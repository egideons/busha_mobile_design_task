import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/explore_controller.dart';
import 'package:mobile_design_task/src/models/btc/btc_tx_model.dart';

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
    await loadInitialData();
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //================ Variables =================\\
  var btcTxModel = BtcTxsBlockResponseModel.fromJson(null).obs;
  var btcTxs = <BtcTxModel>[].obs;
  List<BtcTxModel> displayedBtcTxs = [];
  var txLink = "".obs;

  //================ Controllers =================\\
  var scrollController = ScrollController();

  //================ Booleans =================\\
  var isScrollToTopBtnVisible = false.obs;
  var isLoading = false.obs;
  var hasMoreData = true.obs;

  //================ Scroll to Top =================//
  void scrollToTop() {
    scrollController.jumpTo(0);
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

  //Load Data
  Future<void> loadInitialData() async {
    displayedBtcTxs = btcTxs.take(20).toList();
    hasMoreData.value = displayedBtcTxs.length < btcTxs.length;
    update();
  }

  //Load More
  Future<void> loadMore() async {
    int currentLength = displayedBtcTxs.length;

    await Future.delayed(const Duration(seconds: 2)); // Simulate loading delay

    displayedBtcTxs.addAll(btcTxs.skip(currentLength).take(20));
    hasMoreData.value = displayedBtcTxs.length < btcTxs.length;
    isLoading.value = false;
    update();
  }

//================ Load transactions =================/
  Future<void> loadTransactions() async {
    isLoading.value = true;
    update();
    var exploreController = ExploreController.instance;

    //Api url
    var url = ApiUrl.getBitcoinBlockTx(exploreController.btcHash.value);

    txLink.value = url;

    log(txLink.value);

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

        //Assign the values of the btc txs to the block txs model variable declared earlier
        btcTxs.value = btcTxModel.value.tx;
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading.value = false;
    update();
  }
}
