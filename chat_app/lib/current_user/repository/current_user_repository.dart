
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUserRepository {

  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static const _key_ = '__user__';

  void setUserId(String userId) => _preferences.setString(_key_, userId);

  String? getUserId()  => _preferences.getString(_key_);

  void removeId() => _preferences.clear();
}