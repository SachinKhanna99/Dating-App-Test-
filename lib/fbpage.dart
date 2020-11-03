import 'package:datintg_app_test/Authentication.dart';
import 'package:datintg_app_test/Screens/UserDetailScreen/UserFacebook.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'Screens/ClippingWidget/ButtonClip.dart';
import 'Screens/UserDetailScreen/UserDetail1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class Fbpage extends StatelessWidget {

  bool _isLoggedIn = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Map userProfile;
  BuildContext context;
  bool isFacebookLoginIn = false;
  String errorMessage = '';
  String successMessage = '';

  final facebookLogin = FacebookLogin();
  static var _name;

  Future<FirebaseUser> facebookL(BuildContext context) async {
    FirebaseUser currentUser;
    // fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    // if you remove above comment then facebook login will take username and pasword for login in Webview
    try {
      final FacebookLoginResult facebookLoginResult =
      await facebookLogin.logIn(['email', 'public_profile']);
      if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
        FacebookAccessToken facebookAccessToken =
            facebookLoginResult.accessToken;
        final AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: facebookAccessToken.token);
        final AuthResult result = await auth.signInWithCredential(credential);
        final FirebaseUser user = result.user;
      //  final FirebaseUser user = await auth.signInWithCredential(credential);
       // assert(user.email != null);
        assert(user.displayName != null);
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);
        currentUser = await auth.currentUser();
        assert(user.uid == currentUser.uid);
        return currentUser;
      }

    } catch (e) {
      print(e.toString());

    }
    return currentUser;
  }
  Future<String> loginWithFB() async{

    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
   // final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile.toString());

    //    print("Logged in as: ${profile['name']}");
        _name=profile['name'];
        print('${_name}');
        _isLoggedIn=true;

        return profile;
        break;

      case FacebookLoginStatus.cancelledByUser:
      //  setState(() => _isLoggedIn = false );
        print("Cancel by user");
        _isLoggedIn=false;
        break;
      case FacebookLoginStatus.error:
      //   setState(() => _isLoggedIn = false );
        print("error");

        _isLoggedIn=false;
        break;
    }

  }
  Future<String> uname()async{
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    //final result = await facebookLogin.logInWithReadPermissions(['email']);
    final token = result.accessToken.token;
    final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
    final profile = JSON.jsonDecode(graphResponse.body);

    return profile['name'];

}

  void openModalBottomSheet({BuildContext context}) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
      ),
      elevation: 0.0,
      barrierColor: Colors.black87.withOpacity(0.3),
      isScrollControlled: false,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 500,
              decoration: BoxDecoration(
                color: Color(0xff14225f),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop(context);

                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 28.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 28.0,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2.0),
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Don\'t Worry! We\n',
                            style:
                            TextStyle(color: Colors.white, fontSize: 28.0),
                            children: <TextSpan>[
                              TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: 'never post anything\n'),
                              TextSpan(text: 'to facebook'),

                            ],
                          ),
                        ),
                      ),
              SizedBox(height: 150,),
                      GestureDetector(
                        onTap: (){
                          print(_name);
                          facebookL(context).then((user) {
                            if (user != null) {
                              print('Logged in successfully.');
                              setState(() {
                                isFacebookLoginIn = true;
                                successMessage =
                                'Logged in successfully.\nEmail : ${user.email}\nYou can now navigate to Home Page.';


                              });
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => new UserFacebook(user.displayName),), (route) => false);
                              //Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => new UserFacebook(user.displayName),),ModalRoute.withName('/fb'));
                            //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => new UserFacebook(user.displayName.toString()),));
                            } else {
                              print('Error while Login.');
                            }
                          }).catchError((e){print(e.toString());});
                          // if(_isLoggedIn)
                          //   {
                          //     await loginWithFB().whenComplete(() =>
                          //         Navigator.push(context,new MaterialPageRoute(builder: (context) => new UserFacebook(_name.toString()),))
                          //     );
                          //
                          //   }
                         //
                         // loginWithFB().then((val)
                         //      async{
                         //        if(val==_name)
                         //          {
                         //            print("Hoyaa");
                         //            print(_isLoggedIn);
                         //          Navigator.push(context,new MaterialPageRoute(builder: (context) => new UserFacebook(_name.toString()),));
                         //          }else
                         //            {
                         //              print("Nooo");
                         //              Navigator.push(context,new MaterialPageRoute(builder: (context) => new Authentication(),));
                         //            }
                         //      }
                         //
                         //
                         //  );
                          // if(!_isLoggedIn)
                          //   {
                          //     loginWithFB().whenComplete(() => );Navigator.push(context,new MaterialPageRoute(builder: (context) => new UserFacebook(_name.toString()),));
                          //   }
                          // else
                          //   {
                          //     Navigator.push(context,new MaterialPageRoute(builder: (context) => new Authentication(),));
                          //   }



                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 140),
                          child: Container(
                            margin: EdgeInsets.only(right: 30),
                            child: Image.asset('assets/images/countinuebtn.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Demo Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff6200ee),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            openModalBottomSheet(context: context);
          },
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Text(
            'BUTTON',
            style: TextStyle(color: Colors.white),
          ),
          color: Color(0xff6200ee).withOpacity(0.8),
        ),
      ),
    );
  }
}
// class Fb{
//   bool _isLoggedIn = false;
//   Map userProfile;
//   BuildContext context;
//   final facebookLogin = FacebookLogin();
//   Future<String> loginWithFB() async{
//
//
//     final result = await facebookLogin.logInWithReadPermissions(['email']);
//
//     switch (result.status) {
//       case FacebookLoginStatus.loggedIn:
//         final token = result.accessToken.token;
//         final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
//         final profile = JSON.jsonDecode(graphResponse.body);
//         print(profile.toString());
//
//         print("Logged in as: ${profile['name']}");
//         name=
//         return profile['name'];
//         break;
//
//
//       case FacebookLoginStatus.cancelledByUser:
//       //  setState(() => _isLoggedIn = false );
//         print("Cancel by user");
//         break;
//       case FacebookLoginStatus.error:
//       //   setState(() => _isLoggedIn = false );
//         print("error");
//         break;
//     }
//
//   }
//
//   logout(){
//     facebookLogin.logOut();
//
//     _isLoggedIn = false;
//   }
// }
