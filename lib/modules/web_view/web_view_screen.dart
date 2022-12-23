import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/NewsResponse.dart';
import 'package:news_app/shared/style/my_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key}) : super(key: key);
  static const String routeName = 'WebView';
  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as News;
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(news.url ?? ""));
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: MyColor.whiteColor,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/pattern.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          body: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
