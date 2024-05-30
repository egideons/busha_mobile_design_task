import 'package:get/get.dart';

import '../../app/bottom_nav/screen/bottom_nav.dart';
import '../../app/currency_txs/btc/screen/btc_txs.dart';
import '../../app/currency_txs/xtz/screen/xtz_txs.dart';
import '../../app/explore/screen/explore.dart';
import '../../app/intro/screen/intro.dart';
import '../../app/login/screen/login.dart';
import '../../app/startup/screen/startup_splash.dart';
import '../../app/transaction_details/btc/screen/btc_transaction_details.dart';

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
  static const btcTxs = "/btc-transactions";
  static const xtzTxs = "/xtz-transactions";
  static const btcTransactionDetails = "/btc-transaction-details";
  static const xtzTransactionDetails = "/xtz-transaction-details";

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
    GetPage(
      name: btcTxs,
      page: () => const BtcTxs(),
    ),
    GetPage(
      name: xtzTxs,
      page: () => const XtzTxs(),
    ),
    GetPage(
      name: btcTransactionDetails,
      page: () => const BTCTransactionDetails(),
    ),
    // GetPage(
    //   name: xtzTransactionDetails,
    //   page: () => const BTCTransactionDetails(),
    // ),
  ];
}
