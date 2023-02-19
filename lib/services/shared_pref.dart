import 'package:tfilafinder/services/index.dart';

const uuidStorageKey = 'uuid';

class SharedPref {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }
}
