import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesLocalDataSource {
  Future<void> saveTheme(String theme);
  Future<String?> getTheme();
}

class PreferencesLocalDataSourceImpl implements PreferencesLocalDataSource {
  final SharedPreferences sharedPreferences;

  PreferencesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveTheme(String theme) async {
    await sharedPreferences.setString('theme', theme);
  }

  @override
  Future<String?> getTheme() async {
    return sharedPreferences.getString('theme');
  }
}
