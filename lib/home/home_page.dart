import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/home/characters/pages/character/characters_pages.dart';
import 'package:rick_and_morty/home/episodes/pages/episodes/episodes_page.dart';
import 'package:rick_and_morty/home/location/pages/locations/locations_page.dart';

final indexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final PageController _pages = PageController(initialPage: 0);

  @override
  void dispose() {
    // TODO: implement dispose
    _pages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(indexProvider, (p, int n) {
      _pages.jumpToPage(n);
    });
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
    ));
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: customBottomNavigationBar(),
      body: PageView(
        controller: _pages,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          value = ref.read(indexProvider.notifier).state;
        },
        children: const [
          CharactersPages(),
          LocationsPage(),
          EpisodesPage()
        ],
      ),
    );
  }

  Widget customBottomNavigationBar() {
    final index = ref.watch(indexProvider);
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.black.withAlpha(50),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Locations',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_collection,
            ),
            label: 'Episodes',
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          ref.read(indexProvider.notifier).state = value;
          print(ref.read(indexProvider.notifier).state);
        },
      ),
    );
  }
}
