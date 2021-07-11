import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

const String covid_world = "https://www.worldometers.info/coronavirus/";
const String covid_vn = "https://vnexpress.net/covid-19/covid-19-viet-nam";

class _MyAppState extends State<WebPage> {
  WebViewController _controller;
  _back() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    }
  }

  _forward() async {
    if (await _controller.canGoForward()) {
      await _controller.goForward();
    }
  }

  _loadPage() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(
      url == "https://www.worldometers.info/coronavirus/"
          ? 'https://vnexpress.net/covid-19/covid-19-viet-nam'
          : "https://www.worldometers.info/coronavirus/",
    );
    print(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19'),
        // backgroundColor: Colors.blue[100],
        actions: <Widget>[
          IconButton(
            onPressed: _back,
            icon: Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: _forward,
            icon: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(width: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadPage,
        child: Icon(Icons.refresh),
      ),
      body: SafeArea(
        child: WebView(
          key: Key("webview"),
          initialUrl: covid_vn,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
        ),
      ),
    );
  }
}
