import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const ClorexaApp());
}

class ClorexaApp extends StatelessWidget {
  const ClorexaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clorexa Hosting',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final WebViewController controller;

  int selectedIndex = 0;

  final List<String> urls = [
    "https://clorexahost.in",
    "https://billing.clorexahost.in",
    "https://panel.clorexa.host",
  ];

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(urls[0]));
  }

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    controller.loadRequest(Uri.parse(urls[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clorexa Hosting")),
      body: WebViewWidget(controller: controller),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Billing"),
          BottomNavigationBarItem(icon: Icon(Icons.dns), label: "Panel"),
        ],
      ),
    );
  }
}
