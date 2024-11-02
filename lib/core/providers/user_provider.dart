import 'package:flutter/material.dart';
import 'package:jeemo_pay/core/data_models/login_model.dart';
import 'package:jeemo_pay/core/data_models/user_profile_model.dart';
import 'package:jeemo_pay/shared/locator.dart';
import 'package:jeemo_pay/shared/view_state.dart';
import '../api/user_api/user_api.dart';

class UserProvider extends ChangeNotifier {
  final UserApi _userApi = locator<UserApi>();

  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  UserProfileModel? _userProfile;
  UserProfileModel? get userProfile => _userProfile;

  int? get selectedIndex => null;

  // Login and Register methods
  Future<UserProfileModel> login(LoginModel loginModel) async {
    final response =
        await _userApi.login(loginModel.email, loginModel.password);
    return UserProfileModel.fromJson(response['data']);
  }

  Future<UserProfileModel> register(LoginModel loginModel) async {
    final response =
        await _userApi.register(loginModel.email, loginModel.password);
    return UserProfileModel.fromJson(response['data']);
  }

  // Fetch user profile method
  Future<void> fetchUserProfile(String userId) async {
    _state = ViewState.Busy;
    notifyListeners();

    try {
      final response = await _userApi.fetchUserProfile(userId);
      _userProfile = UserProfileModel.fromJson(response['data']);
      _state = ViewState.Idle;
    } catch (e) {
      _state = ViewState.Error;
      // Optionally handle the error
    } finally {
      notifyListeners();
    }
  }

  void updateSelectedIndex(int index) {}
}
