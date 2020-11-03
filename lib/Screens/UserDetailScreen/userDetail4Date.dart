import 'package:datintg_app_test/Screens/ClippingWidget/BackArrowClip.dart';
import 'package:datintg_app_test/Screens/ClippingWidget/ButtonClip.dart';
import 'package:datintg_app_test/Screens/UserDetailScreen/user_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class UserDetails4 extends StatefulWidget {
  final String name;
  UserDetails4(this.name);
  @override
  UserDetails4State createState() => UserDetails4State();

}

class UserDetails4State extends State<UserDetails4> {
  TextEditingController date=new TextEditingController();
  AppBar appbar = AppBar(
    backgroundColor: Colors.white,
  );
  DateTime selectedDate = DateTime.now();
  String registration;
  bool isAdult2(String birthDateString) {
    String datePattern = "dd-MM-yyyy";

    // Current time - at this moment
    DateTime today = DateTime.now();

    // Parsed date to check
    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

    // Date to check but moved 18 years ahead
    DateTime adultDate = DateTime(
      birthDate.year + 18,
      birthDate.month,
      birthDate.day,
    );

    return adultDate.isBefore(today);
  }
  Future _selectDate() async {


    DatePicker.showDatePicker(context,
        showTitleActions: true,

        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime(3000, 12, 31),
        onConfirm: (datetime) {setState(() {
          registration=DateFormat("dd-MM-yyyy  ").format(datetime);
          date.text=registration.toString();
        });},

        locale: LocaleType.en);
    // DateTime picked = await showDatePicker(
    //     context: context,
    //     lastDate: new DateTime(2030),
    //     firstDate: new DateTime(2020),
    //     initialDate: new DateTime.now());
    //
    //
    // if (picked != null)
    //
    //   setState(
    //           () => {registration=picked.toString(),
    //         date.text = picked.toString()
    //       }
    //   );
    setState(() {

      date.text=registration.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height:720,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height:90,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(

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
                      SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        " Hi, ",
                        style: TextStyle(
                          color: Colors.black54,
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
                    //  clipper: ClippingClass(),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 50.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: new AssetImage('assets/images/bg-2.png'),
                                fit: BoxFit.fill),
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
                                  SizedBox(height: _height * 0.05),
                                  FormWidget(
                                    height: _height,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    width: double.infinity,
                                    height: 46.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),

                                    child: TextFormField(

                                      // focusNode: _focusNode,
                                      keyboardType: TextInputType.phone,
                                      autocorrect: false,
                                      controller: date,

                                      onSaved: (value) {
                                        registration = value;
                                      },
                                      onTap: () {
                                        _selectDate();
                                        FocusScope.of(context).requestFocus(new FocusNode());
                                      },

                                      maxLines: 1,
                                      //initialValue: 'Aseem Wangoo',
                                      validator: (value) {
                                        if (value.isEmpty || value.length < 1) {
                                          return 'Choose Date';
                                        }
                                        else if( isAdult2(registration))
                                          {
                                            return "True";
                                          }
                                        else
                                          {
                                            return null;
                                          }
                                      },
                                      decoration: InputDecoration(
                                       hintText: 'dd/mm/yyyy',
                                        //filled: true,
                                        suffixIcon: Icon(Icons.calendar_today),
                                       // icon: const Icon(Icons.calendar_today),
                                        labelStyle:
                                        TextStyle(decorationStyle: TextDecorationStyle.solid),
                                      ),
                                    ),
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
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => UserDetailInterest()),
                          // );
                          if(registration==null)
                            {

                              Toast.show("Please Select Birth Date", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                            }

                       if(isAdult2(registration))
                         {
                            print("GOOOO");
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new UserStatus(widget.name),));
                            Toast.show("Yes You are adult", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                         }
                       else
                           {
                             print("NOOO");
                             Toast.show("NO, You are not an adult", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

                           }
                         print("hello");
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

class FormWidget extends StatelessWidget {
  FormWidget({
    this.title,
    this.placeholder,
    Key key,
    @required double height,
  })  : _height = height,
        super(key: key);

  final double _height;
  final String title;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Please Confirm your age',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: _height * 0.008,
        ),
        Container(
          child: Text(
            'You must be at least 18',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          height: _height * 0.02,
        ),
        // DatePickerWidget(
        //   placeholder: "dd/mm/yyyy",
        //
        // ),
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

class DatePickerWidget extends StatelessWidget {
  final String placeholder;
  const DatePickerWidget({
    this.placeholder,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "dd/yy/mm",

            ),
            // placeholder,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2020),
              );
            },
            child: Icon(Icons.calendar_today),
          ),
        ],
      ),
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
        SizedBox(
          height: _height * 0.008,
        ),
        Container(
          child: Image.asset('assets/images/img-5.png',height: 100,),
        ),
      ],
    );
  }
}
