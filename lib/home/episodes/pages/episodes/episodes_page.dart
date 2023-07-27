import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/routes/routes.dart';
import 'package:rick_and_morty/core/utils/debouncer.dart';
import 'package:rick_and_morty/home/episodes/logic/provider/episode_provider.dart';
import 'package:rick_and_morty/home/shared_widgets/custom_scaffold.dart';
import 'package:rick_and_morty/home/shared_widgets/custom_text_field.dart';
import 'package:rick_and_morty/home/shared_widgets/item_episodes.dart';
import 'package:rick_and_morty/home/shared_widgets/not_found.dart';
import 'package:rick_and_morty/home/shared_widgets/shimmer_list.dart';

class EpisodesPage extends ConsumerStatefulWidget {
  const EpisodesPage({super.key});

  @override
  ConsumerState<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends ConsumerState<EpisodesPage> {
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
      if (ref.read(episodeProvider).episodes.isEmpty) {
        ref.read(episodeProvider.notifier).getEpisodes(name: "");
      }
    });
    _scrollController.addListener(() {
      final nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        ref.read(episodeProvider.notifier).getEpisodes(name: _search.text);
      }
    });
    super.initState();
  }

  final _debounce = Debounce(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(episodeProvider).pageState;
    final episodes = ref.watch(episodeProvider).episodes;

    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              CustomTextField(
                textEditingController: _search,
                hintText: "Search for episodes",
                suffixIcon: const Icon(Icons.search),
                onChanged: (value) {
                  onTextChange();
                },
              ),
              if (state.hasError && episodes.isEmpty) const NotFound(),
              SizedBox(
                height: 20.h,
              ),
              if (episodes.isEmpty && !state.hasError)
                Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding:  EdgeInsets.only(bottom: 7.h),
                          child: const ShimmerList(),
                        ),
                        itemCount: 14)),
              if (episodes.isNotEmpty)
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
                                      RAndMRoutesNames.episodeDetails.name,
                                      extra: episodes[index]);
                                },
                                child: ItemEpisodes(episode: episodes[index])),
                          );
                        },
                        itemCount: episodes.length,
                      )
                    ],
                  ),
                ),
              if (state.isLoading && episodes.isNotEmpty)
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
        ref.read(episodeProvider.notifier).refresh(name: _search.text);
      } else {
        ref.read(episodeProvider.notifier).clearData();
      }
    });
  }
}
