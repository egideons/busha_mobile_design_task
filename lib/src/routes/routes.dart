import 'package:get/get.dart';

import '../../app/bottom_nav/screen/bottom_nav.dart';
import '../../app/currency_txs/btc/screen/btc_txs.dart';
import '../../app/currency_txs/xtz/screen/xtz_txs.dart';
import '../../app/explore/screen/explore.dart';
import '../../app/intro/screen/intro.dart';
import '../../app/login/screen/login.dart';
import '../../app/startup/screen/startup_splash.dart';

class Routes {
  //Screens Route Names
  static const startupSplashscreen = "/";
  static const intro = "/intro";
  static const login = "/login";
  static const bottomNav = "/page-nav";
  static const explore = "/explore";
  static const portfolio = "/portfolio";
  static const earn = "/earn";
  static const spend = "/spend";
  static const connect = "/connect";

  //Subroutes
  static const btcTxs = "/btc-txs";
  static const xtzTxs = "/xtz-txs";
  static const btcTransactionDetails = "/btc-tx-details";
  static const xtzTransactionDetails = "/xtz-tx-details";

  //========================= GET PAGES ==========================\\
  static final getPages = [
    //Startup Screens
    GetPage(name: startupSplashscreen, page: () => const StartupSplashscreen()),
    GetPage(name: intro, page: () => const Intro()),

    //Auth Screen
    GetPage(name: login, page: () => const Login()),

    //Main App
    GetPage(name: bottomNav, page: () => const BottomNav()),
    GetPage(name: explore, page: () => const Explore()),
    GetPage(name: btcTxs, page: () => const BtcTxs()),
    GetPage(name: xtzTxs, page: () => const XtzTxs()),
  ];
}
