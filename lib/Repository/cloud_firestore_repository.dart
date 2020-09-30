import 'package:atletasunidos/model/user.dart';
import 'cloud_firestore_api.dart';

class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(Users user) => _cloudFirestoreAPI.updateUserData(user);
  }