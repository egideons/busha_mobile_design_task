import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/wallet_controller.dart';
import 'package:mobile_design_task/src/models/btc/btc_latest_block_model.dart';
import 'package:mobile_design_task/src/models/xtz/xtz_blocks_model.dart';
import 'package:mobile_design_task/src/services/api/api_url.dart';
import 'package:mobile_design_task/src/services/client/client_service.dart';

import '../constants/assets.dart';

class ExploreController extends GetxController {
  static ExploreController get instance {
    return Get.find<ExploreController>();
  }

  @override
  void onInit() async {
    await loadWalletData();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadData();
    });
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //Data Handling
  var btcLatestBlockResponse = BtcLatestBlockModel.fromJson(null).obs;
  var btcHash = "".obs;
  var xtzBlocksResponse = TezosBlockModel.fromJson(null).obs;

  //================ Controllers =================\\
  var scrollController = ScrollController();

  //================ Booleans =================\\
  var isScrollToTopBtnVisible = false.obs;

  //================ Variables =================//
  var isLoading = false.obs;

  //Today's Top Movers
  var todaysMoversIcon = <dynamic>[
    Image.asset(
      Assets.ethIcon,
      fit: BoxFit.contain,
      height: 46,
      width: 46,
    ),
    Image.asset(
      Assets.btcIcon,
      fit: BoxFit.contain,
      height: 46,
      width: 46,
    ),
    Image.asset(
      Assets.solIcon,
      fit: BoxFit.contain,
      height: 46,
      width: 46,
    ),
  ];

  var todaysMoversLongNames = <String>[
    "Ethereum",
    "Bitcoin",
    "Solana",
  ];

  var todaysMoversPercentages = <String>[
    "6.76",
    "1.76",
    "1.76",
  ];
  var todaysMoversValueIncreases = <bool>[
    false,
    true,
    true,
  ];

  //================ Scroll to Top =================//
  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

//================ Scroll Listener =================//

  void scrollListener() {
    //========= Show action button ========//
    if (scrollController.position.pixels >= 150) {
      isScrollToTopBtnVisible.value = true;
      update();
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 150) {
      isScrollToTopBtnVisible.value = false;
      update();
    }
  }

  //Load Wallet Data
  loadWalletData() async {
    await WalletController.instance.loadVisibilityState();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    update();

    //Handle requests
    await loadBtcLatestBlock();
    // await loadTezosBlocks();
    // await loadXtzLatestBlock();

    isLoading.value = false;
    update();
  }

  loadBtcLatestBlock() async {
    //Api url
    var url = ApiUrl.getBitcoinLatestBlock;

    //Client service
    var response = await ClientService.getRequest(url);

    if (response == null) {
      return;
    }
    try {
      if (response.statusCode == 200) {
        // Convert to json
        dynamic responseJson;
        if (response.data is String) {
          responseJson = jsonDecode(response.data);
        } else {
          responseJson = response.data;
        }

        //Map the response json to the model provided
        BtcLatestBlockModel responseModel =
            BtcLatestBlockModel.fromJson(responseJson);

        //Assign the values of the response model to the bitcoin latest block model variable declared earlier
        btcLatestBlockResponse.value = responseModel;

        //Assign the btcHash variable
        btcHash.value = responseModel.hash;
        log("This is the btc hash: ${btcHash.value}");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  loadXtzLatestBlock() async {
    await ClientService.getRequest(ApiUrl.getTezosBlocksCount);
  }

  loadTezosBlocks() async {
    await ClientService.getRequest(ApiUrl.getTezosBlocks);
  }
}
