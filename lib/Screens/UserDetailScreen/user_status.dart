import 'package:datintg_app_test/Screens/ClippingWidget/BackArrowClip.dart';
import 'package:datintg_app_test/Screens/ClippingWidget/ButtonClip.dart';
import 'package:datintg_app_test/Screens/UserDetailScreen/UserDetailsInterests.dart';
import 'package:datintg_app_test/Screens/UserDetailScreen/userDetail3.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';


// this classes i am  single ,married class Which is screen number 11 on XD
class UserStatus extends StatefulWidget {
  final String name;
  UserStatus(this.name);
  @override
  _UserStatusState createState() => _UserStatusState();
}

class _UserStatusState extends State<UserStatus> {
  AppBar appbar = AppBar(
    backgroundColor: Colors.white,
  );
  bool isselected=false;
  bool second=false;
  bool third=false;
  bool solo=false;
  bool forth=false;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: _height * .961,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  height: 70,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
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
                      Text(
                        "      Hi, ",
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.normal,
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        widget.name, // TODO Real Name in here
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Expanded(
                    child: ClipPath(
                      // clipper: ClippingClass(),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage('assets/images/bg-2.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(

                                // mainAxisAlignment:
                                //     MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  WelcomeWidget(height: _height),
                                  // Spacer(),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          '  I am a',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              isselected=true;
                                              second=false;
                                              third=false;
                                              forth=false;
                                              solo=true;
                                            });

                                          },
                                          child:
                                          !isselected ? Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(25.0),
                                            ),
                                            child: Text(
                                              "SINGLE",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ):Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.circular(25.0),
                                            ),
                                            child: Text(
                                              "SINGLE",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              second=true;
                                              isselected=false;
                                              third=false;
                                              forth=false;
                                              solo=true;
                                            });

                                          },
                                          child: !second ? Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(25.0),
                                            ),
                                            child: Text(
                                              "MARRIED",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ):Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.circular(25.0),
                                            ),
                                            child: Text(
                                              "MARRIED",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                      ),

                                      SizedBox(
                                        height: 10.0,
                                      ),

                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isselected=false;
                                            second=false;
                                            third=true;
                                            solo=true;
                                            forth=false;
                                          });

                                        },
                                        child: !third ? Container(
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(25.0),
                                          ),
                                          child: Text(
                                            "DIVORCED",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ):Container(
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(25.0),
                                          ),
                                          child: Text(
                                            "DIVORCED",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isselected=false;
                                            second=false;
                                            third=false;
                                            forth=true;
                                            solo=true;
                                          });

                                        },
                                        child: !forth ? Container(
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(25.0),
                                          ),
                                          child: Text(
                                            "SEPARATED",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ):Container(
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(25.0),
                                          ),
                                          child: Text(
                                            "SEPARATED",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  // Spacer(),
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
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(solo)
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserDetailInterest(widget.name)),
                            );
                          }else
                          {
                            Toast.show("Please Select Status", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                          }

                        },
                        child: CustomPaint(
                          painter: ButtonCustomCurve(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "Continue",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 7.0,
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

class FormWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            '  I am a',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 45.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            "MAN",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 45.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            "WOMAN",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 45.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            "OTHERS",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'roboto',
                letterSpacing: 1),
          ),
        ),
        // Container(
        //   constraints: const BoxConstraints(maxWidth: 500),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [],
        //   ),
        // ),
      ],
    );
  }
}

class SingleGender extends StatelessWidget {
  final String gender;
  const SingleGender({
    this.gender,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        gender,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// **************************  Welcome to Kailer *****************

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    Key key,
    @required double height,
  })
      : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          child: Image.asset(
            'assets/images/img-6.png',
            height: 150,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}






