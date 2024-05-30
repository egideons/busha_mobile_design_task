import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../controllers/api_processor_controller.dart';

String contentType = "application/json";

final dio = Dio();

class ClientService {
  static Future<Response> getRequest(url) async {
    Response response;
    try {
      response = await dio.getUri(
        Uri.parse(url),
        options: Options(
          contentType: contentType,
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          persistentConnection: true,
          receiveDataWhenStatusError: true,
        ),
      );

      //For Debugging
      log("This is the response status code: ${response.statusCode}");
      log("This is the response data: ${response.data}");
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log("Dio Error Response Data: ${e.response!.data}");
        log("Dio Error Response headers: ${e.response!.headers}");
        log("Dio Error Response Request Options: ${e.response!.requestOptions}");
      } else {
        // Something happened in setting up or sending the request that triggered an Error

        //The request was made but there was no internect connection on the device
        if (e.message!.contains(
          "The connection errored: Failed host lookup:",
        )) {
          log("Dio Request Options Error: ${e.requestOptions}");
          log("Dio Error Message: ${e.message}");
          ApiProcessorController.errorSnack("Please connect to the internet");
        }
        //The request was made but there was no error message
        if (e.message == null) {
          log("Dio Request Options Error: ${e.requestOptions}");
          log("Dio Error Message: ${e.message}");
          ApiProcessorController.errorSnack(
            "Please check your internet connection",
          );
        }
      }
      return response;
    }
  }
}
