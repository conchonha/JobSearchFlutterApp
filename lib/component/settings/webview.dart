import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewClient extends StatelessWidget {
  const WebViewClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://careerstart.vn/viec-lam/tat-ca-viec-lam-vi.html',
    );
  }
}
