import 'package:flutter/cupertino.dart';
import 'package:zero/models/user.dart';

class userProvider extends ChangeNotifier
{
  User _user=User('', '', '', '', '', '', '');

  User get user => _user;

  void setUser(String user)
  {
    _user=User.fromJson(user);
    notifyListeners();
  }



}