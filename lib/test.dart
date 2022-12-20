import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String url = 'http://demo1012754.mockable.io/performances';
  late List data;
  bool _isDataLoading = true;

  Future<List> _getUsers() async {
    var response = await http.get(
      Uri.parse(url),
      headers: {"Accept": 'application/json'},
    );

    setState(() {
      var listData = json.decode(response.body);
      data = listData['performances'];

      _isDataLoading = false;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();

    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tickets API call'),
        ),
        body: _isDataLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        tileColor: Colors.white,
                        title: Text(data[index]['name'],
                            style: TextStyle(
                                color: Color.fromRGBO(140, 15, 13, 0.9),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        onTap: () {},
                      ),
                    ),
                  );
                }));
  }
}
