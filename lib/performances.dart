import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Performances extends StatefulWidget {
  @override
  _PerformancesState createState() => _PerformancesState();
}

class _PerformancesState extends State<Performances> {
  var data;
  @override
  void initState() {
    super.initState();
    print("initState...");
    getData();
  }

  getData() async {
    print("getData...");
    final uri = Uri.parse(
        'https://bionic-dev.eventgate.jp/api/performance/index?offset=0&limit=20&ostype=android&version=1');
    final headers = {
      'Content-Type': 'application/json',
      'x-app-key':
          'cmNwYXl6cXRrZm5xcWVtYmdwcW5raGZndHd5dWZudXN4Y3l4c2thdHBocG1nY3NobXZicnltZW5m bnFrZndtZXJ6a3dkeG52cnhxY3hkbmRtbXZ0bnludHd6ZGdya215cGFwZ2VtZ2hwZ3dic3lrdHJk eHZoZnFmdHNra2dmeWE='
    };

    Map<String, dynamic> body = {
      'offset': 0,
      'limit': 20,
      'ostype': 'android',
      'version': 1
    };
    String jsonBody = json.encode(body);

    // print("before api call...");
    // Response response = await post(
    //   uri,
    //   headers: headers,
    //   body: jsonBody,
    // );

    // data = response.body;
    // print("after api call2..." + data);

    print("before api call...");

    String url = 'https://randomuser.me/api/?results=10';
    var response = await get(
      Uri.parse(url),
      headers: {"Accept": 'application/json'},
    );
    data = response.body;
    print("after api call2..." + data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Navigate to a new screen on Button click'),
          backgroundColor: Colors.blueAccent),
      body: data != null
          ? Center(
              //child: Text(data["result"]["performances"]),
              child: Text(data[0]['name']['first']),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
