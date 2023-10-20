import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
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

  // This widget is the root of your application.
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
        theme: FlexThemeData.light(scheme: FlexScheme.redM3,useMaterial3: true),
        // The Mandy red, dark theme.
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed,useMaterial3: true),
        home: MainPage(),
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
    PageController mainPageViewController = new PageController();
    mainPageViewController.initialPage;

    return Scaffold(
      extendBody: false,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: mainPageViewController,
        children: [
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
            icon: Icon(Iconsax.home_2),
            title: Text("日记本"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Iconsax.smileys4),
            title: Text("心情本"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Iconsax.calendar),
            title: Text("日历本"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Iconsax.user),
            title: Text("我"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}


