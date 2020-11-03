import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Authentication.dart';
class Started extends StatefulWidget {
  final FirebaseUser user;
  Started({this.user});
  @override
  _StartedState createState() => _StartedState();
}

class _StartedState extends State<Started> {

  Color color = HexColor("#13235f");
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/screen-2.png'),fit: BoxFit.cover
              )
          ),
        child: SafeArea(


            child: Center(

              child: SingleChildScrollView(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(

                      margin: EdgeInsets.only(top: 60),
                      child: Column(
                        children: [
                          Container(
                         //   margin: EdgeInsets.only(left: 70),
                            child: Image.asset("assets/images/icon.png",width: 70,height: 70,),

                          ),
                          SizedBox(height: 50,),
                          Container(

                            child: Image.asset("assets/images/started.png",height: 250,width: 300,),

                          ),
                          SizedBox(height: 60,),
                          GestureDetector(
                            onTap: (){

                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Authentication(),));
                            },
                            child: Container(
                              // margin: EdgeInsets.only(top:300,bottom: 0,left: 60),
                              child: Image.asset('assets/images/getting.png',cacheWidth: 250,),
                            ),
                          )
                        ],
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
      ),
    );
  }
}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}