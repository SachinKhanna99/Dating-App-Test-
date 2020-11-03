import 'package:datintg_app_test/Screens/Authentication/otpVerification.dart';
import 'package:datintg_app_test/Screens/UserDetailScreen/UserDetail1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class PhoneAuthenti
{
  String verification;
  var _auth = FirebaseAuth.instance;
BuildContext context;
  Future<void> sendOtp(String _number) async {
    final PhoneVerificationCompleted phoneVerificationCompleted =
        (AuthCredential credential) {

        };
    final PhoneVerificationFailed phoneVerificationFailed =
        (AuthException exception) {
      print("Login Faild due to $exception");
    };
    final PhoneCodeSent phoneCodeSent =
        (String verificationId, [int forceResendingToken]) {
      this.verification = verificationId;

      Toast.show("Code Send", context,duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

      Navigator.push(context, new MaterialPageRoute(builder: (context) => new OTPVerification("", verificationId),));
    };
    final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
     this.verification = verificationId;
      print("time out");
    };
    await _auth.verifyPhoneNumber(
        phoneNumber: _number,
        timeout: Duration(seconds: 120),
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
  }

  Future<void> signIn(String otpCode) async {
    final AuthCredential authCredential = PhoneAuthProvider.getCredential(
        verificationId: verification, smsCode: otpCode);
    await _auth.signInWithCredential(authCredential).whenComplete(() => Navigator.push(context, new MaterialPageRoute(builder: (context) => UserDetails1(),)));
  }

}