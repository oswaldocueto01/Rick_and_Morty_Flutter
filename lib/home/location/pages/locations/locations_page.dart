

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/routes/routes.dart';
import 'package:rick_and_morty/core/utils/debouncer.dart';
import 'package:rick_and_morty/home/location/logic/provider/location_provider.dart';

import 'package:rick_and_morty/home/location/pages/locations/widgets/item_location.dart';
import 'package:rick_and_morty/home/shared_widgets/custom_scaffold.dart';
import 'package:rick_and_morty/home/shared_widgets/custom_text_field.dart';
import 'package:rick_and_morty/home/shared_widgets/not_found.dart';
import 'package:rick_and_morty/home/shared_widgets/shimmer_list.dart';

class LocationsPage extends ConsumerStatefulWidget {

  const LocationsPage({super.key});

  @override
  ConsumerState<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends ConsumerState<LocationsPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _search = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    _search.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() {
      if (ref.read(locationProvider).locations.isEmpty) {
        ref.read(locationProvider.notifier).getLocations(name: "");
      }
    });
    _scrollController.addListener(() {
      final nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        ref.read(locationProvider.notifier).getLocations(name: _search.text);
      }
    });
    super.initState();
  }

  final _debounce = Debounce(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(locationProvider).pageState;
    final locations = ref.watch(locationProvider).locations;
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              CustomTextField(
                textEditingController: _search,
                hintText: "Search for locations",
                suffixIcon: const Icon(Icons.search),
                onChanged: (value) {
                  onTextChange();
                },
              ),
              if (state.hasError && locations.isEmpty) const NotFound(),
              SizedBox(
                height: 20.h,
              ),
              if (locations.isEmpty && !state.hasError)
                Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding:  EdgeInsets.only(bottom: 7.h),
                          child: const ShimmerList(),
                        ),
                        itemCount: 14)),
              if (locations.isNotEmpty)
                Expanded(
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverList.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 7.h),
                            child: GestureDetector(
                                onTap: () {
                                  context.pushNamed(
                                      RAndMRoutesNames.localizationDetails.name,
                                      extra: locations[index]);
                                },
                                child: ItemLocation(localization: locations[index]),
                          ));
                        },
                        itemCount: locations.length,
                      )
                    ],
                  ),
                ),
              if (state.isLoading && locations.isNotEmpty)
                const CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
  onTextChange() {
    _debounce.run(() {
      if (_search.text.isNotEmpty) {
        ref.read(locationProvider.notifier).refresh(name: _search.text);
      } else {
        ref.read(locationProvider.notifier).clearData();
      }
    });
  }
}
