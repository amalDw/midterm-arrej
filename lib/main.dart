import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mid/Contact.dart';
import 'package:mid/my-provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MyProvider>(
    create: (context) => MyProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Contact contact = Contact(
      firstName: 'firstName',
      lastName: 'jh',
      phoneNumOne: '9887788',
      phoneNumTwo: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('contact list'),
        ),
        body: Consumer<MyProvider>(builder: (context, provider, x) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: Container(
                      child: provider.contactListItems == null
                          ? Container(
                            alignment: Alignment.center,
                              child: Text('No Contacts Available'),
                            )
                          : Container(
                              height: 700,
                              child: ListView.builder(
                                  itemCount: provider.contactListItems.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Color(0xff4da6ff),
                                        child: Text(
                                            '${provider.contactListItems[index].firstName[0]}'),
                                      ),
                                    );
                                  }),

                              //child: Text('jhjhfjdh'),
                            )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () => {},
                      tooltip: 'add contact',
                      child: Icon(Icons.add),
                    ),
                  ),
                )
              ],
            ),
          );
        }) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
/**
 * 
 * git config --global user.email "216067@ppu.edu.ps"
  git config --global user.name "amalDw"

 */