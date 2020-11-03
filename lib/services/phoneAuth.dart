import 'package:datintg_app_test/Screens/Authentication/mobileLogin.dart';
import 'package:datintg_app_test/Screens/Authentication/otpVerification.dart';
import 'package:datintg_app_test/Screens/UserDetailScreen/UserDetail1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';


//class LoginStore = LoginStoreBase with _$LoginStore;

class LoginStoreBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static String actualCode;

  bool isLoginLoading = false;

  bool isOtpLoading = false;


  GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> otpScaffoldKey = GlobalKey<ScaffoldState>();


  FirebaseUser firebaseUser;


  Future<bool> isAlreadyAuthenticated() async {
    firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      return true;
    } else {
      return false;
    }
  }


  Future<void> getCodeWithPhoneNumber(BuildContext context,
      String phoneNumber) async {
    isLoginLoading = true;

    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential auth) async {
          await _auth
              .signInWithCredential(auth)
              .then((AuthResult value) {
            if (value != null && value.user != null)
            {
              print('Authentication successful');
              Toast.show("Authentication successful", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              onAuthenticationSuccessful(context, value);
            } else {

              Toast.show("ERRRor : Invalid code", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
            }
          }).catchError((error) {

            Toast.show("ERRRor"+error.toString(), context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
          });
        },
        verificationFailed: (AuthException authException) {
          print('Error message: ' + authException.message);
          Toast.show( authException.message.toString()+"ERRRor", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

        },
        codeSent: (String verificationId, [int forceResendingToken]) async {
          actualCode = verificationId;
          isLoginLoading = false;
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => OTPVerification(phoneNumber, verificationId)));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          actualCode = verificationId;
        }
    );
  }


  Future<String> validateOtpAndLogin(BuildContext context, String smsCode) async{
  //  isOtpLoading = true;
     AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: actualCode, smsCode: smsCode);

    await _auth.signInWithCredential(_authCredential).catchError((error) {
      //isOtpLoading = false;
      print("---------------------Error: "+error.toString());
      Toast.show(error.toString()+"ERRRor", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }).then((AuthResult authResult) {
      if (authResult != null && authResult.user != null) {
        print('Authentication successful');
        onAuthenticationSuccessful(context, authResult);
      }
    });
  }

  Future<void> onAuthenticationSuccessful(BuildContext context,
      AuthResult result) async {


    firebaseUser = result.user;

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => UserDetails1()), (
        Route<dynamic> route) => false);

  }
}  //

