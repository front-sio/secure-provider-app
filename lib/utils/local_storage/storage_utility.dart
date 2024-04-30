import 'package:get_storage/get_storage.dart';

class SecuriteLocalStorage {
  static final SecuriteLocalStorage _instance = SecuriteLocalStorage._internal();


  factory SecuriteLocalStorage(){
    return _instance;
  }

  SecuriteLocalStorage._internal();

  final _storage = GetStorage();


  Future<void> saveData<Se>(String key, Se value) async{
    await _storage.write(key, value);
  }

  Se? readData<Se>(String key){
    return _storage.read<Se>(key);
  }

  Future<void> removeData(String key) async {
    return await _storage.remove(key);
  }

  Future<void> clearAll(String key) async {
    return await _storage.erase();
  }


}