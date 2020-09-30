import 'package:atletasunidos/Bloc/user_bloc.dart';
import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Widgets/ButtonPrimary.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:get/get.dart';


class SigninScreen extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      backgroundColor: blackPrimary,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top:20),
                height: 200,
                child: Image.asset('assets/atlType.png')
              ),
              Container(
                height: 150,
                child: Image.asset('assets/atlLog.png')
              ),

              Container(
                child: Text('Alcanza tus metas midiendo tus entrenamientos y compartiendo con tus amigos.',
                  textAlign: TextAlign.center,
                  style: subTitleALt,
                ),
              ),
              GetBuilder<HomeControllers>(
                init: HomeControllers(),
                builder: (_) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: ButtonPrimary(
                      height: 50,
                      text: 'INICIA CON GOOGLE',
                      onPressed: (){
                          _.loading();
                          userBloc.signIn().then((User user){
                              userBloc.updateUserData(Users(
                                  uid: user.uid,
                                  name: user.displayName,
                                  email: user.email,
                                  photoURL: user.photoURL,
                                  // doctor: false,
                                  tokenID: "",
                                  // numeroDocumento: "",
                                  // telefono: "",
                                  // peso: ""
                              ));
                              Get.back();
                            });
                      }),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}