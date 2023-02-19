import 'package:app_name/services/index.dart';

const uuidStorageKey = 'uuid';

class SharedPref {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }
}
