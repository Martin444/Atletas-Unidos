import 'package:atletasunidos/Bloc/user_bloc.dart';
import 'package:atletasunidos/Views/CustomUser/HomePage.dart';
import 'package:atletasunidos/Views/InizialicePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: InitPage(),
      ),
    );
  }
}
