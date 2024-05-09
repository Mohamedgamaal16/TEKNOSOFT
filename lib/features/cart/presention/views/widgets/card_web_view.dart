import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CardWebView extends StatefulWidget {
  const CardWebView(
      {super.key, required this.totalPrice, required this.paymentToken});
  final int totalPrice;
  final String paymentToken;

  @override
  State<CardWebView> createState() => _CardWebViewState();
}

class _CardWebViewState extends State<CardWebView> {
  InAppWebViewController? _webViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startPayment();
  }
void startPayment() {
  _webViewController?.loadUrl(
    urlRequest: URLRequest(
      url: WebUri(
        'https://accept.paymob.com/api/acceptance/iframes/845630?payment_token=${widget.paymentToken}',
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(javaScriptEnabled: true),
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller;
          startPayment();
        },
        onLoadStop: (controller, url) {
          if (url != null &&
              url.queryParameters.containsKey('success') &&
              url.queryParameters['success'] == 'true') {
            print("payment success");
          } else if (url != null &&
              url.queryParameters.containsKey('success') &&
              url.queryParameters['success'] == 'false') {
            print("payment failed");
          }
        },
      ),
    );
  }
}
