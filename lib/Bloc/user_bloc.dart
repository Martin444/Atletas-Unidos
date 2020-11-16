import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:atletasunidos/Repository/auth_repository.dart';
import 'package:atletasunidos/Repository/cloud_firestore_api.dart';
import 'package:atletasunidos/Repository/cloud_firestore_repository.dart';
import 'package:atletasunidos/Repository/firebase_storage_repository.dart';
import 'package:atletasunidos/model/user.dart';





class UserBloc implements Bloc {

  // ignore: non_constant_identifier_names
  final _auth_repository = AuthRepository();

  //Flujo de datos = Streams
  //Stream - firebase

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;
  // Future<User> get currentUser => FirebaseAuth.instance.currentUser();

  //Casos uso
  //1. SignIn a la aplicación Google
  Future<User> signIn() {
    return _auth_repository.signInFirebase();
  }

  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(Users user) => _cloudFirestoreRepository.updateUserDataFirestore(user);

  final _firebaseStorageRepository = FirebaseStorageRepository();
  // Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);

  //Creamos un streeam que está escuchando los pedidos y me los trae en tiempo real.
  Stream<QuerySnapshot> orderListStream = FirebaseFirestore.instance.collection(CloudFirestoreAPI().ORDERS).snapshots();
  Stream<QuerySnapshot> get ordersStream => orderListStream;



    signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {

  }
}