import 'package:atletasunidos/Bloc/user_bloc.dart';
import 'package:atletasunidos/Controllers/Homecontroller.dart';
import 'package:atletasunidos/Views/AdminUser/Ui/AlumnosList.dart';
import 'package:atletasunidos/Views/AdminUser/Ui/CreateEvent.dart';
import 'package:atletasunidos/Views/AdminUser/Ui/CreateMicroC.dart';
import 'package:atletasunidos/Views/AdminUser/Widget/ButtonBlue.dart';
import 'package:atletasunidos/Widgets/Events/BannerList.dart';
import 'package:atletasunidos/Widgets/InfoProfile.dart';
import 'package:atletasunidos/Widgets/Pizzarra/pizzarra.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:get/get.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  UserBloc userBloc;

  var date = Get.find<HomeControllers>();

  @override
  Widget build(BuildContext context) {
     userBloc = BlocProvider.of(context);
    return Scaffold(
      backgroundColor: blackPrimary,
       floatingActionButton: FloatingActionButton(
        backgroundColor: redPrimary,
        child: Icon(Icons.list_alt),
        onPressed: (){
            Get.to(CreateMicro(),
              transition: Transition.rightToLeftWithFade
            );
        },
      ),
      appBar: AppBar(
        // leading: Icon(Icons.sort),
        backgroundColor: blackPrimary,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: Container(
          color: blackPrimary,
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/atlLog.png'),
              ),

              SizedBox(height: 10,),

                 Column(
                          children: <Widget>[
                            ListTile(
                              title: Text("Inicio",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                           
                            
                            ListTile(
                              title: Text("Alumnos",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19
                                    ),
                                  ),
                              onTap: () async {
                                Navigator.pop(context);
                                Get.to(AlumnosList(),
                                  transition: Transition.rightToLeft
                                );
                              },
                            ),
                            ListTile(
                              title: Text("Cerrar sesión",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19
                                ),
                              ),
                              onTap: () {
                                userBloc.signOut();
                              },
                            ),
                          ],
                        )
                      

            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Pizzarra(),
                SizedBox(height: 30,),
                Text('Eventos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  ),
                ),
                BannerList(), 
                SizedBox(height: 30,),

                ButtonBlue(
                  title: 'Crea un evento',
                  onTap: (){
                    Get.to(CreateEvent(),
                      transition: Transition.downToUp
                    );
                  },
                ),
                
              ],
          ),
        ),
      ),
    );
  }
}