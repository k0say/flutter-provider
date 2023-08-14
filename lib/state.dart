import 'package:flutter/material.dart';
import 'package:flutter_app/logic.dart';

class TestState with ChangeNotifier {
  dynamic _currentState = "init testo";
  List<Post> _postList = [];

  get ilTesto => _currentState;

  List<Post> get postList => _postList;

  void setNewState(dynamic value) {
    _currentState = value;
    notifyListeners();
  }

  void setPostList(List<Post> postList) {
    _postList = postList;
    notifyListeners();
  }
}
