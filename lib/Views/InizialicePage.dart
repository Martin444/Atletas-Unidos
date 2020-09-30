import 'package:atletasunidos/Bloc/user_bloc.dart';
import 'package:atletasunidos/Views/CustomUser/HomePage.dart';
import 'package:atletasunidos/Views/Signin/SigninScreen.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';



class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return StreamBuilder(
      stream: userBloc.authStatus,
      // ignore: missing_return
      builder: (BuildContext context,AsyncSnapshot snapshot) {
        switch (snapshot.hasData) {
          case false:
            return Scaffold(
              body: SigninScreen()
            );
            break;
          case true:
            return HomePage();
          default:
        }
      }
    );
  }
}