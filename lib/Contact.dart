import 'package:flutter/cupertino.dart';

class Contact {
  String firstName;
  String lastName;
  String phoneNumOne;
  String phoneNumTwo;
  Contact(
      {@required this.firstName,
      @required this.lastName,
      @required this.phoneNumOne,
       this.phoneNumTwo});
}
