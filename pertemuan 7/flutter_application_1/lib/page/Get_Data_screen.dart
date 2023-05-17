import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/Get_detail_screen.dart';

class GetDataScreen extends StatefulWidget {
  GetDataScreen({Key? key}) : super(key: key);

  @override
  State<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  final String url = "https://reqres.in/api/users?page=2";
  List? data;

  @override
  void initState() {
    super.initState();
    _getRefreshData();
  }

  Future<void> _getRefreshData() async {
    await getJsonData();
  }

  Future<void> getJsonData() async {
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
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
        title: Text("Get data api regres"),
      ),
      body: RefreshIndicator(
        onRefresh: _getRefreshData,
        child: data == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    GetDetailScreen(value: data![index]["id"]),
                              ),
                            );
                            print(data![index]["id"]);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    data![index]["avatar"],
                                    height: 80,
                                    width: 80,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${data![index]["first_name"]} ${data![index]["last_name"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(data![index]["email"]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider()
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
