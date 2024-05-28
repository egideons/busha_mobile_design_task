import 'package:get/get.dart';

import '../../app/explore/screen/explore.dart';
import '../../app/intro/screen/intro.dart';
import '../../app/login/screen/login.dart';
import '../../app/page_nav/screen/page_nav.dart';
import '../../app/startup/screen/startup_splash.dart';

class Routes {
  //Screens Route Names
  static const startupSplashscreen = "/";
  static const intro = "/intro";
  static const login = "/login";
  static const pageNav = "/page-nav";
  static const explore = "/explore";
  static const portfolio = "/portfolio";
  static const earn = "/earn";
  static const spend = "/spend";
  static const connect = "/connect";

  //========================= GET PAGES ==========================\\
  static final getPages = [
    //Startup Screens
    GetPage(name: startupSplashscreen, page: () => const StartupSplashscreen()),
    GetPage(name: intro, page: () => const Intro()),

    //Auth Screen
    GetPage(name: login, page: () => const Login()),

    //Main App
    GetPage(name: pageNav, page: () => const PageNav()),
    GetPage(name: explore, page: () => const Explore()),
    // GetPage(name: portfolio, page: () => const Portfolio()),
    // GetPage(name: earn, page: () => const Earn()),
    // GetPage(name: spend, page: () => const Spend()),
    // GetPage(name: connect, page: () => const Connect()),
  ];
}
