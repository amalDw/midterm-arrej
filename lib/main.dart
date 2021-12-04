import 'dart:js';
import 'package:flutter/material.dart';
import 'package:mid/Contact.dart';
import 'package:mid/my-provider.dart';
import 'package:mid/pages/add-person.dart';
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
                      child: (provider.contactListItems == null || provider.contactListItems.length==0)
                          ? Container(
                            height: 200,
                            alignment: Alignment.center,
                              child: Text('No Contacts Available'),
                            )
                          : Container(
                             padding: EdgeInsets.all(9),
                              child: ListView.builder(
                                  itemCount: provider.contactListItems.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return GestureDetector(
                                      onTap: (){

                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(7),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Color(0xff4da6ff),
                                            child: Text(
                                                '${provider.contactListItems[index].firstName[index]}'),
                                          ),
                                          title: Text('${provider.contactListItems[index].firstName}   ${provider.contactListItems[index].lastName}'),
                                        ),
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
                      onPressed: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPerson()))
                      },
                      tooltip: 'add contact',
                      child: Icon(Icons.add),
                    ),
                  ),
                )
              ],
            ),
          );
        }) 
        );
  }
}
