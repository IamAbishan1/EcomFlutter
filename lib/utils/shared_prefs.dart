import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  storeString(String key, String value) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(key, value);
  }

  getString(String key) async{
      SharedPreferences pref = await SharedPreferences.getInstance();
      return pref.getString(key);

  }

  storeUser(user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('user', user);
  }

  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('user');
  }

  removeUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove('user');
  }

  clearUp() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }


}
