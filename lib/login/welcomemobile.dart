// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mu_card/login/welcomename.dart';

class WelcomeMobile extends StatefulWidget {
  WelcomeMobile({super.key});

  @override
  State<WelcomeMobile> createState() => _WelcomeMobileState();
}

class _WelcomeMobileState extends State<WelcomeMobile> {
  TextEditingController welcomeMobileController =
      TextEditingController(text: '');
  bool otpVisibility = false;
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // stops: [0.5, 0.5],
        colors: [
          Color.fromARGB(255, 0, 255, 251),
          Colors.white,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                    child: Container(
                      height: 17,
                      width: 280,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(255, 178, 178, 178),
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 246, 255, 0)),
                          value: 0.5,
                          minHeight: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 70, 0, 0),
                    child: Text(
                      'Hi ' + WelcomeName.welcomeName.toUpperCase() + ' !!',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 38, 36, 36),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Please Provide and verify your phone number',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 121, 121, 121),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 55, 0, 0),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 38, 36, 36),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.DIALOG,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle:
                      TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.start,
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                  initialValue: number,
                  maxLength: 10,
                  formatInput: true,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  // inputBorder: OutlineInputBorder(),
                  inputDecoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 5, 14, 5),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
                //   ],
                // ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: SizedBox(
                      height: 50,
                      width: 140,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Get OTP',
                          style: TextStyle(
                              color: Color.fromARGB(255, 238, 255, 0),
                              fontSize: 21,
                              letterSpacing: 1.4),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary:
                              Color.fromARGB(130, 48, 40, 40), // background
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(50, 25),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        '<<Back To Login',
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1,
                            color: Color.fromARGB(255, 255, 187, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
