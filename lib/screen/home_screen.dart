import 'package:flutter/material.dart';
import 'package:rest_api_example/model/user_details_model.dart';
import 'package:rest_api_example/services/user_api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserDetailsModel>? _userModelData = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModelData = (await ApiService().getUsersData())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter REST API Example'),
      ),
      body: _userModelData == null || _userModelData!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModelData!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text("No: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              Text(_userModelData![index].id.toString()),
                              // Text(_userModelData![index].username),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const Text("Name: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              Text(_userModelData![index].username),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const Text("Email: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              Text(_userModelData![index].email),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const Text("Website: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              Text(_userModelData![index].website),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
