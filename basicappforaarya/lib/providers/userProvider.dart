import 'package:basicappforaarya/models/userModel.dart';
import 'package:basicappforaarya/services/apiServices.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  UserModel? _userModel;

  bool _isLoading = false;

  UserModel? get userDetails => _userModel;

  bool get isLoading => _isLoading;

  Future<dynamic> fetchUserDetails(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _userModel = await apiService.getUserProfile(id);
      print('++++++++++++++++++++++++++++++++++++');
      print(_userModel);
    } catch (e) {
      throw Exception(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
