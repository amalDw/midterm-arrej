import 'package:flutter/material.dart';
import 'package:mid/Contact.dart';

class MyProvider extends ChangeNotifier {
  List<Contact> contactListItems=[Contact(firstName: 'hghg',lastName: 'jsjdhjs',phoneNumOne: 'jhsdjshds',phoneNumTwo: 'jhsdhsjhd')];
  Contact chosenContact;
  addContact(Contact c) {
    this.contactListItems.add(c);
  }

  deleteContact(index) {
    this.contactListItems.removeAt(index);
  }

  editContact(Contact c, index) {
    this.contactListItems[index].firstName = c.firstName;
    this.contactListItems[index].lastName = c.lastName;
    this.contactListItems[index].phoneNumOne = c.phoneNumOne;
    this.contactListItems[index].phoneNumTwo = c.phoneNumTwo;

  }
}
