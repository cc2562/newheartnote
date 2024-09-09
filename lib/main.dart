import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newheartnote/calbook/view.dart';
import 'package:newheartnote/heartbook/view.dart';
import 'package:newheartnote/mypage/view.dart';
import 'package:newheartnote/notebook/view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType)
    {
      return GetMaterialApp(
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          // ... app-specific localization delegate[s] here
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        title: 'Flutter Demo',
        theme: FlexThemeData.light(scheme: FlexScheme.deepPurple,useMaterial3: true),
        // The Mandy red, dark theme.
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.deepPurple,useMaterial3: true),
        home: const MainPage(),
      );
    }
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTab=0;
  @override
  Widget build(BuildContext context) {
    PageController mainPageViewController = PageController();
    mainPageViewController.initialPage;
    return Scaffold(
      extendBody: false,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: mainPageViewController,
        children: const [
          NotebookPage(),
          HeartbookPage(),
          CalbookPage(),
          MypagePage(),
        ],
      ),
      bottomNavigationBar:SalomonBottomBar(
        currentIndex: _selectedTab,
        onTap: (i) => setState((){
          _selectedTab=i;
          mainPageViewController.jumpToPage(i);
        }),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.home_2),
            title: const Text("日记本"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.smileys4),
            title: const Text("心情本"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.calendar),
            title: const Text("日历本"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.user),
            title: const Text("我"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}


