import 'package:flutter/material.dart';
import 'package:mid/Contact.dart';
import 'package:mid/main.dart';
import 'package:mid/my-provider.dart';
import 'package:provider/provider.dart';

class AddPerson extends StatefulWidget {
  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  bool firstNameisValid = false;
  bool lastNameisValid = false;
  bool firstPhoneValid = false;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstphoneController = TextEditingController();
  final secondphoneController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<MyProvider>(builder: (context, provider, x) {
      return Container(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: firstNameController,
              decoration: InputDecoration(
                  labelText: 'First Name',
                  errorText: firstNameisValid
                      ? null
                      : 'please enter first name for contact',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
              onChanged: (String val) {
                final v = val;
                if (val == null) {
                  setState(() {
                    firstNameisValid = false;
                  });
                } else {
                  setState(() {
                    firstNameisValid = true;
                  });
                }
              },
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: lastNameController,
              decoration: InputDecoration(
                  labelText: 'last name',
                  errorText: lastNameisValid
                      ? null
                      : 'please enter last name for contact',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
              onChanged: (String val) {
                final v = val;
                if (v == null) {
                  setState(() {
                    lastNameisValid = false;
                  });
                } else {
                  setState(() {
                    lastNameisValid = true;
                  });
                }
              },
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: firstphoneController,
              decoration: InputDecoration(
                  labelText: 'first phone ',
                  errorText: firstPhoneValid
                      ? null
                      : 'please enter first phone for contact',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
              onChanged: (String val) {
                final v = val;
                if (v == null) {
                  setState(() {
                    firstPhoneValid = false;
                  });
                } else {
                  setState(() {
                    firstPhoneValid = true;
                  });
                }
              },
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: secondphoneController,
              decoration: InputDecoration(
                  labelText: 'second phone',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            ),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 40,
              tooltip: 'add',
              hoverColor: Color(0xff4d000),
              focusColor: Color(0xff4da6ff),
              onPressed: () {
               if((firstNameController.text)!='' && (lastNameController.text)!='' && (firstphoneController.text)!='' ){
                  provider.addContact(Contact(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    phoneNumOne: firstphoneController.text,
                    phoneNumTwo: secondphoneController.text == null
                        ? ''
                        : secondphoneController.text));
                firstNameController.text = '';
                lastNameController.text = '';
                firstphoneController.text = '';
                secondphoneController.text = '';
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyApp()));
               }
               else  {
                    
               }
              },
            ))
          ],
        ),
      );
    }));
  }
}
