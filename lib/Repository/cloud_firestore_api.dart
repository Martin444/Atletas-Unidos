import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:atletasunidos/model/user.dart';

class CloudFirestoreAPI {

  // ignore: non_constant_identifier_names
  final String USERS = "users";
  // ignore: non_constant_identifier_names
  final String ORDERS = "order";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(Users user) async{
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    // FirebaseMessaging _firebaseMessagin = FirebaseMessaging();

    // _firebaseMessagin.requestNotificationPermissions();

  //  await _firebaseMessagin.getToken().then((token){
      
        return  ref.set({
          'uid' : user.uid,
          'name' : user.name,
          'email' : user.email,
          'photoURL' : user.photoURL,
          // 'age': user.age,
          // 'Ndocument' : user.numeroDocumento,
          // 'peso': user.peso,
          // 'telefono' : user.telefono,
          // 'myOrders' : user.myOrders,
          'lastSignIn' : DateTime.now(),
          // 'tokenID' : token,
          // 'cupo': []
        }, SetOptions(merge:true));
     
    // });
  }

}