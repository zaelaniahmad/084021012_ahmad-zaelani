import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetDetailScreen extends StatefulWidget {
  final int? value;

  GetDetailScreen({Key? key, this.value}) : super(key: key);

  @override
  State<GetDetailScreen> createState() => _GetDetailScreenState();
}

class _GetDetailScreenState extends State<GetDetailScreen> {
  Map? data;
  String? uri;

  @override
  void initState() {
    super.initState();
    print('Cek parameter ${widget.value}');
    var url = 'https://reqres.in/api/users/${widget.value}';
    _getRefreshData(url);
  }

  Future<void> _getRefreshData(String url) async {
    await getJsonData(url);
  }

  Future<void> getJsonData(String url) async {
    setState(() {
      uri = url;
    });
    var response = await http
        .get(Uri.parse(uri!), headers: {'Accept': 'application/json'});
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get detail data api reqres'),
      ),
      body: Container(
        child: data == null
            ? Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text(
                        'Loading...',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                child: ListTile(
                  leading: Image.network(data!['avatar']),
                  title: Text(data!['first_name'] + " " + data!['last_name']),
                  subtitle: Text(data!['email']),
                ),
              ),
      ),
    );
  }
}
