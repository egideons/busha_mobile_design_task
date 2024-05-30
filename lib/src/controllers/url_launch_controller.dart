import 'package:url_launcher/url_launcher.dart';

class UrlLaunchController {
  static Future<void> launchWebView(Uri url, LaunchMode launchMode) async {
    if (!await launchUrl(
      url,
      mode: launchMode,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
