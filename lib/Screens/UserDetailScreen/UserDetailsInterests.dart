
import 'package:datintg_app_test/Screens/ClippingWidget/BackArrowClip.dart';
import 'package:datintg_app_test/Screens/ClippingWidget/ButtonClip.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../constants.dart';
import 'Components/clipping.dart';

class UserDetailInterest extends StatefulWidget {
  final String name;

  UserDetailInterest(this.name);

  @override
  UserDetailInterestState createState() => UserDetailInterestState();
}

class UserDetailInterestState extends State<UserDetailInterest> {
  bool full;
  final List<String> reportList=new List();
  List<String> selectedChoices = List();

  List<Widget> choices = List();
  List<String> interests = [
    "Politics",
    "yoga",
    "swimming",
    "gardening",
    "cooking",
    "poetry",
    "reading",
    "movies",
    "couch surfing",
    "series binge Watching",
    "vlogging",
    "standup Comedy",
    "trekking",
    "riding",
    "driving",
    "vegeterian",
    "nov veg",
    "eggeterian",
    "bisexual",
    "sapiosexual",
    "spirituality",
    "potterhead",
    "baking",
     "blogging",
    "dancing",
     "fishing",
    "writing",
     "singing",
     "foodie",
    "music",
    "fitness",
    "cycling",

  ];
  AppBar appbar = AppBar(
    backgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {

    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height:970,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height:50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                horizontal: 15.0, vertical: 10.0),
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
                        "      Hi, ",
                        style: TextStyle(
                          color: Colors.black,
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
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
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
                                // WelcomeWidget(height: _height),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 7.0,
                                    ),
                                    Text(
                                      "My Interests",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7.0,
                                    ),
                                    Text(
                                      "Select only 10 options",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    child: Wrap(
                                      // spacing: 20.0,
                                      // runSpacing: 3.0,
                                      children: [
                                      // reportList.forEach((item) {
                                      //     choices.add(Container(
                                      //       padding: const EdgeInsets.all(5.0),
                                      //       child: ChoiceChip(
                                      //         padding: EdgeInsets.symmetric(horizontal:10.0, vertical: 9.0),
                                      //         disabledColor: kButtonPrimaryColor,
                                      //         selectedShadowColor: kButtonPrimaryColor,
                                      //         // checkmarkColor: kButtonPrimaryColor,
                                      //         // showCheckmark: false,
                                      //         label: Text(item),
                                      //         labelStyle: TextStyle(
                                      //             color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),
                                      //         shape: RoundedRectangleBorder(
                                      //           side: BorderSide(color: kButtonPrimaryColor),
                                      //           borderRadius: BorderRadius.circular(22.0),
                                      //         ),
                                      //         backgroundColor: kPrimaryColor,
                                      //         selectedColor: kButtonPrimaryColor,
                                      //         selected: selectedChoices.contains(item),
                                      //         onSelected: (selected) {
                                      //           setState(() {
                                      //             {
                                      //
                                      //
                                      //               if(selectedChoices.length==10)
                                      //               {
                                      //                 full=true;
                                      //                 Toast.show("You already Selected 10 choices", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                      //                 if( selectedChoices.contains(item) )
                                      //                 {
                                      //                   selectedChoices.remove(item);
                                      //                 }
                                      //               }
                                      //               else if(selectedChoices.length>10 )
                                      //               {
                                      //                 Toast.show("Please Select  10 choices", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                      //               }
                                      //               else
                                      //               {
                                      //                 full=false;
                                      //               }
                                      //               if(!full)
                                      //               {
                                      //                 selectedChoices.contains(item)
                                      //                     ? selectedChoices.remove(item)
                                      //                     : selectedChoices.add(item);
                                      //               }
                                      //
                                      //
                                      //             }
                                      //
                                      //           });
                                      //         },
                                      //
                                      //       ),
                                      //
                                      //     ));
                                      //   }
                                       // )
                                         ChoiceChipWidget(interests),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height:10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => UserDetails4()),
                          // );
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
                                GestureDetector(
                                  onTap: (){
                                    // if(interests.length>=10)
                                    //   {
                                    //     Toast.show("Please asd", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                    //   }
                                  },
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
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
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChoiceChipWidget extends StatefulWidget {
  final List<String> reportList;

  ChoiceChipWidget(this.reportList);

  @override
  _ChoiceChipWidgetState createState() => new _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
 // String selectedChoice = "";
  List<String> selectedChoices = List();
  bool full;
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(5.0),
        child: ChoiceChip(
          padding: EdgeInsets.symmetric(horizontal:10.0, vertical: 9.0),
          disabledColor: kButtonPrimaryColor,
          selectedShadowColor: kButtonPrimaryColor,
          // checkmarkColor: kButtonPrimaryColor,
          // showCheckmark: false,
          label: Text(item),
          labelStyle: TextStyle(
              color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: kButtonPrimaryColor),
            borderRadius: BorderRadius.circular(22.0),
          ),
          backgroundColor: kPrimaryColor,
          selectedColor: kButtonPrimaryColor,
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              // if(selectedChoices.length==10)
              //   {
              //     Toast.show("You already Selected 10 choices", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              //   }
              // else if(selectedChoices.length>10)
              //   {
              //     Toast.show("Please Select 10 choices", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              //   }
              // else
                  {


                  if(selectedChoices.length==10)
                    {
                      full=true;
                      Toast.show("You already Selected 10 choices", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                      if( selectedChoices.contains(item) )
                      {
                        selectedChoices.remove(item);
                      }
                    }
                  else if(selectedChoices.length>10 )
                    {
                      Toast.show("Please Select  10 choices", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                    }
                  else
                    {
                      full=false;
                    }
                  if(!full)
                    {
                      selectedChoices.contains(item)
                          ? selectedChoices.remove(item)
                          : selectedChoices.add(item);
                    }


                  }

            });
          },

        ),

      ));
    }
    );

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
