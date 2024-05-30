import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/models/xtz/xtz_tx_block_model.dart';

import '../models/xtz/xtz_blocks_model.dart';
import '../services/api/api_url.dart';
import '../services/client/client_service.dart';

class XtzTxsController extends GetxController {
  static XtzTxsController get instance {
    return Get.find<XtzTxsController>();
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
  var xtzBlocksResponse = XtzBlockResponseModel.fromJson(null).obs;
  var xtzTxsItems = <XtzTxBlockModel>[].obs;
  List<XtzTxBlockModel> displayedXtzTxs = [];
  var txsLink = "".obs;

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
    displayedXtzTxs = xtzTxsItems.take(20).toList();
    hasMoreData.value = displayedXtzTxs.length < xtzTxsItems.length;
    update();
  }

  //Load More
  Future<void> loadMore() async {
    int currentLength = displayedXtzTxs.length;

    await Future.delayed(const Duration(seconds: 2)); // Simulate loading delay

    displayedXtzTxs.addAll(xtzTxsItems.skip(currentLength).take(20));
    hasMoreData.value = displayedXtzTxs.length < xtzTxsItems.length;
    isLoading.value = false;
    update();
  }

//================ Load transactions =================//
  Future<void> loadTransactions() async {
    isLoading.value = true;
    update();
    //Api url
    var getXtzBlocks = ApiUrl.getTezosBlocks;
    txsLink.value = getXtzBlocks;

    //Client service
    var response = await ClientService.getRequest(getXtzBlocks)
        .timeout(const Duration(seconds: 20));

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
        XtzBlockResponseModel responseModel =
            XtzBlockResponseModel.fromJson(responseJson);

        //Assign the values of the response model to the Tezos block model variable declared earlier
        xtzBlocksResponse.value = responseModel;

        //Assign the values of the btc txs to the block txs model variable declared earlier
        xtzTxsItems.value = xtzBlocksResponse.value.blocks;
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading.value = false;
    update();
  }
}
