import 'package:datintg_app_test/Screens/ClippingWidget/BackArrowClip.dart';
import 'package:datintg_app_test/Screens/ClippingWidget/ButtonClip.dart';
import 'package:datintg_app_test/Screens/UserDetailScreen/UserDetail1.dart';
import 'package:datintg_app_test/services/phoneAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../constants.dart';
import 'otpVerification.dart';

class MobileLogin extends StatefulWidget {
  @override
  _MobileLoginState createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {

  final phonenumber=TextEditingController(text: "+91");
  String phoneNo, smssent, verificationId;
  AppBar appbar = AppBar(
    backgroundColor: Colors.white,
  );
  // Future<void> verifyPhone() async{
  //   final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
  //     this.verificationId = verId;
  //   };
  //   final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]){
  //     this.verificationId = verId;
  //     // smsCodeDialoge(context).then((value){
  //     //   print("Code Sent");
  //     // });
  //   };
  //   final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth){};
  //   final PhoneVerificationFailed verifyFailed = (AuthException e) {
  //     print('${e.message}');
  //   };
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber:"+91"+phoneNo,
  //     timeout: const Duration(seconds: 60),
  //     verificationCompleted: verifiedSuccess,
  //     verificationFailed: verifyFailed,
  //     codeSent: smsCodeSent,
  //     codeAutoRetrievalTimeout: autoRetrieve,
  //   );
  // }
// String actualCode,status;
//   startPhoneAuth(String phone) async {
//     final PhoneCodeSent codeSent =
//         (String verificationId, [int forceResendingToken]) async {
//       this.actualCode = verificationId;
//       setState(() {
//         print('Code sent to $phone');
//         status = "\nEnter the code sent to " + phone;
//       });
//     };
//     final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verificationId) {
//       this.actualCode = verificationId;
//       setState(() {
//         status = "\nAuto retrieval time out";
//       });
//     };
//     final PhoneVerificationFailed verificationFailed =
//         (AuthException authException) {
//       setState(() {
//         status = '${authException.message}';
//
//         print("Error message: " + status);
//         if (authException.message.contains('not authorized'))
//           status = 'Something has gone wrong, please try later';
//         else if (authException.message.contains('Network'))
//           status = 'Please check your internet connection and try again';
//         else
//           status = 'Something has gone wrong, please try later';
//       });
//     };
//     final PhoneVerificationCompleted verificationCompleted =
//         (AuthCredential auth) {
//       setState(() {
//         status = 'Auto retrieving verification code';
//       });

  @override
  Widget build(BuildContext context) {

    final _height = MediaQuery.of(context).size.height;




    final codeController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // constraints: const BoxConstraints(maxWidth: 500),
            height: _height * .961,
            margin: EdgeInsets.only(top: 10),
            // height: _height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageAndBack(height: _height),
                Container(
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 0.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WelcomeWidget(height: _height),
                                  Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        ' Login Here',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: 'roboto'
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Container(
                                      child: Text(
                                        ' Enter Your Mobile Number',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'roboto'
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: TextFormField(
                                        controller: phonenumber,

                                        onChanged: (value){
                                          this.phoneNo=value;

                                        },
                                        decoration: InputDecoration(
                                          hintText: "e.g 9632587410",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18.0,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          fillColor: Color(0xfff3f3f4),
                                          filled: true,
                                        ),
                                        cursorColor: kPrimaryColor,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.phone,
                                      ),
                                    ),
                                    Container(
                                      constraints: const BoxConstraints(maxWidth: 500),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [],
                                      ),
                                    ),
                                  ],
                                ),
                                  Spacer(),
                                  Opacity(
                                      opacity: 0.0,
                                      child: ResendOTP(height: _height)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CustomPaint(
                          painter: BackButtonCustomCurve(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 8.0),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if(phoneNo.toString().isEmpty)
                          {
                            Toast.show("Please Enter Phone number code", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

                          }
                          else{
                          LoginStoreBase().getCodeWithPhoneNumber(context, phonenumber.text);
                          }




                        },
                        child: CustomPaint(
                          painter: ButtonCustomCurve(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: GestureDetector(

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    "Request To OTP",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResendOTP extends StatelessWidget {
  const ResendOTP({
    Key key,
    @required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Didn\'t receive an OTP?',
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: _height * 0.01,
        ),
        Container(
          child: Text(
            'Resend OTP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key key,
    @required double height,
  })  : _height = height,
        super(key: key);

  final double _height;


  @override
  Widget build(BuildContext context) {
    final _phonenumber=TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Login Here',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,

            ),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Container(
          child: Text(
            'Enter Your Mobile Number',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: _height * 0.02,
        ),
        TextFormField(
          controller: _phonenumber,
          decoration: InputDecoration(
            hintText: "e.g 9632587410",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            fillColor: Color(0xfff3f3f4),
            filled: true,
          ),
          cursorColor: kPrimaryColor,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ],
    );
  }
}

// **************************  Welcome to Kailer *****************

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    Key key,
    @required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 2.0,
          width: 50.0,
          decoration: BoxDecoration(color: Colors.white),
        ),
        SizedBox(
          height: _height * 0.015,
        ),
        Container(
          child: Text(
            "Welcome To,",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
                fontFamily: 'roboto'
            ),
          ),
        ),
        SizedBox(
          height: _height * 0.008,
        ),
        Container(
          child: Text(
            "Kailer",
            style: TextStyle(
              color: Colors.white,
              fontSize: 29.0,
              fontFamily: 'roboto'
            ),
          ),
        ),
      ],
    );
  }
}

class ImageAndBack extends StatelessWidget {
  const ImageAndBack({
    Key key,
    @required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Image.asset(
            "assets/images/img-2.png",
            height: 150,
            width: 300,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
