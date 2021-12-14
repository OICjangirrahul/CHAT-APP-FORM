import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
Map<String, dynamic>? userMap;
  bool isloading = false;
  final TextEditingController _search = TextEditingController();
  void onSearch() async {
    setState(() {
      isloading = true;
    });
    FirebaseFirestore _firebase = FirebaseFirestore.instance;
    await _firebase
        .collection('users')
        .where('email', isEqualTo: _search.text)
        .get()
        .then((value) {
      userMap = value.docs[0].data();
      setState(() {
        isloading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('home screen'),
      ),
      body: isloading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.width / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                    height: size.height / 14,
                    width: size.width / 1.15,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                          hintText: 'search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onSearch();
                    },
                    child: Text('search'),
                  ),
                  userMap!= null ? ListTile(
                    title: Text(userMap?['name'],
                    
                    ),
                    subtitle: Text(userMap?['email']),
                  ):Container(),

                ],
              ),
            ),
    );
  }
}
