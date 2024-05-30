import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/explore_controller.dart';

import '../models/btc/btc_txs_block_response_model.dart';
import '../services/api/api_url.dart';
import '../services/client/client_service.dart';

class BtcTxsController extends GetxController {
  static BtcTxsController get instance {
    return Get.find<BtcTxsController>();
  }

  @override
  void onInit() async {
    await loadTransactions();
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //Data Handling
  var btcTxModel = BtcTxsBlockResponseModel.fromJson(null).obs;

  //================ Controllers =================\\
  var scrollController = ScrollController();

  //================ Booleans =================\\
  var isScrollToTopBtnVisible = false.obs;

  //================ Variables =================\\
  var isLoading = false.obs;

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

//================ Load transactions =================//
  Future<void> loadTransactions() async {
    isLoading.value = true;
    update();
    await loadBitcoinTx();
    isLoading.value = false;
    update();
  }

  loadBitcoinTx() async {
    var exploreController = ExploreController.instance;

    //Api url
    var url = ApiUrl.getBitcoinBlockTx(exploreController.btcHash.value);

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
        BtcTxsBlockResponseModel responseModel =
            BtcTxsBlockResponseModel.fromJson(responseJson);

        //Assign the values of the response model to the bitcoin latest block model variable declared earlier
        btcTxModel.value = responseModel;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
