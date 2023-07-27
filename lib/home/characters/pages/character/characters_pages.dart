import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/config/colors.dart';
import 'package:rick_and_morty/core/routes/routes.dart';
import 'package:rick_and_morty/core/utils/debouncer.dart';
import 'package:rick_and_morty/home/characters/logic/provider/character_provider.dart';
import 'package:rick_and_morty/home/characters/pages/character/widgets/character_item.dart';
import 'package:rick_and_morty/home/characters/pages/character/widgets/character_item_shimmer.dart';
import 'package:rick_and_morty/home/shared_widgets/custom_scaffold.dart';
import 'package:rick_and_morty/home/shared_widgets/custom_text_field.dart';
import 'package:rick_and_morty/home/shared_widgets/not_found.dart';

class CharactersPages extends ConsumerStatefulWidget {
  const CharactersPages({super.key});

  @override
  ConsumerState<CharactersPages> createState() => _CharactersPagesState();
}

class _CharactersPagesState extends ConsumerState<CharactersPages> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _search = TextEditingController();
  String gender = "";
  String status = "";

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
      if (ref.read(characterProvider).characters.isEmpty) {
        ref.read(characterProvider.notifier).getCharacters();
      }
    });
    _scrollController.addListener(() {
      final nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        ref.read(characterProvider.notifier).getCharacters(gender: gender, name: _search.text, status: status);
      }
    });
    super.initState();
  }

  final _debounce = Debounce(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    final characters = ref.watch(characterProvider).characters;
    final state = ref.watch(characterProvider).pageState;

    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              CustomTextField(
                textEditingController: _search,
                hintText: "Search for characters",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.filter_list_alt),
                  onPressed: () {
                    showFilters();
                  },
                ),
                onChanged: (value) {
                  onTextChange();
                },
              ),
              if (state.hasError && characters.isEmpty) const NotFound(),
              SizedBox(
                height: 20.h,
              ),
              if (characters.isEmpty && !state.hasError)
                const Expanded(child: CharacterItemShimmer()),
              if (characters.isNotEmpty)
                Expanded(
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 12, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                context.pushNamed(
                                    RAndMRoutesNames.characterDetails.name,
                                    extra: characters[index]);
                              },
                              child:
                                  CharacterItem(characters: characters[index]));
                        },
                        itemCount: characters.length,
                      )
                    ],
                  ),
                ),
              if (state.isLoading && characters.isNotEmpty)
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
        ref
            .read(characterProvider.notifier)
            .refresh(gender: gender, name: _search.text, status: status);
      } else {
        ref
            .read(characterProvider.notifier)
            .clearData(gender: gender, status: status);
      }
    });
  }

  showFilters() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: Container(
              height: gender.isNotEmpty || status.isNotEmpty ? 290.h : 260.h,
              width: 200.w,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: backgroundSecondary),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topLeft,
                children: [
                  Column(
                    children: [
                      Text(
                        "Filters",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(6.r)),
                        ),
                        value: gender,
                        items: [
                          DropdownMenuItem(
                            value: "",
                            child: Text(
                              "Select a gender",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "female",
                            child: Text(
                              "Female",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "male",
                            child: Text(
                              "Male",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "genderless",
                            child: Text(
                              "Genderless",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "unknown",
                            child: Text(
                              "Unknown",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          switch (value) {
                            case "male":
                              gender = value!;
                              break;
                            case "female":
                              gender = value!;
                            case "genderless":
                              gender = value!;
                              break;
                            case "unknown":
                              gender = value!;
                              break;
                            default:
                              gender = value!;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(6.r)),
                        ),
                        value: status,
                        items: [
                          DropdownMenuItem(
                            value: "",
                            child: Text(
                              "Select a status",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "alive",
                            child: Text(
                              "Alive",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "dead",
                            child: Text(
                              "Dead",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "unknown",
                            child: Text(
                              "Unknown",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          switch (value) {
                            case "alive":
                              status = value!;
                              break;
                            case "dead":
                              status = value!;

                            case "unknown":
                              status = value!;
                              break;
                            default:
                              {
                                status = "";
                              }
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r)),
                              backgroundColor: Colors.deepPurple),
                          onPressed: () {
                            ref.read(characterProvider.notifier).refresh(
                                gender: gender,
                                name: _search.text,
                                status: status);
                            context.pop();
                          },
                          child: const Text(
                            "Filter",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(height: 10.h,),
                      if (gender.isNotEmpty || status.isNotEmpty)
                        InkWell(
                          onTap: () {
                            gender = "";
                            status = "";
                            ref
                                .read(characterProvider.notifier)
                                .refresh(name: _search.text, gender: "", status: "");
                            context.pop();
                          },
                          child: Text(
                            "Delete filter",
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Positioned(
                    top: -18.h,
                    left: -18.w,
                    child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  )
                ],
              )),
        );
      },
    );
  }
}
