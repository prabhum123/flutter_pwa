// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello/performances.dart';
import 'package:hello/test.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'dart:js' as js;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PWA Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color.fromRGBO(140, 15, 13, 1),
          ),
          scaffoldBackgroundColor: Color.fromRGBO(140, 15, 13, 0.6)),
      home: const MyHomePage(title: 'Flutter PWA APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // RaisedButton(
            //     child: Text('CMS Page',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 40)),
            //     color: Colors.blue,
            //     onPressed: () async {
            //       js.context
            //           .callMethod('open', ['https://ticket.rakuten.co.jp/']);
            //     }),
            // RaisedButton(
            //     child: Text('Performances',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 40)),
            //     color: Colors.blue,
            //     onPressed: () async {
            //       js.context
            //           .callMethod('open', ['https://ticket.rakuten.co.jp/']);
            //     })

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        js.context.callMethod(
                            'open', ['https://ticket.rakuten.co.jp/']);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          primary: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.developer_board,
                            color: Color.fromRGBO(140, 15, 13, 0.9),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "CMS",
                            style: TextStyle(
                              color: Color.fromRGBO(140, 15, 13, 0.9),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Test()));
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          primary: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.event,
                              color: Color.fromRGBO(140, 15, 13, 0.9)),
                          SizedBox(height: 10),
                          Text(
                            "Events",
                            style: TextStyle(
                              color: Color.fromRGBO(140, 15, 13, 0.9),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed:
      //       // () async {
      //       //   //final Uri _url = Uri.parse('https://ticket.rakuten.co.jp/');
      //       //   final Uri _url = Uri.parse('https://ticket.rakuten.co.jp/');

      //       //   if (!await launchUrl(
      //       //     _url,
      //       //     mode: LaunchMode.inAppWebView,
      //       //   )) {
      //       //     throw 'Could not launch $_url';
      //       //   }
      //       // },
      //       () {
      //     js.context.callMethod('open', ['https://ticket.rakuten.co.jp/']);
      //     html.window.addEventListener('load', listen, false);

      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void listen(html.Event event) {
    print("before timer");
    Timer(Duration(seconds: 3), () {
      print("after timer");
      html.window.scrollTo(0, 1);
    });
  }
}
