import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WelcomeName extends StatefulWidget {
  const WelcomeName({super.key});

  @override
  State<WelcomeName> createState() => _WelcomeNameState();
}

class _WelcomeNameState extends State<WelcomeName> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  bool referralVisibility = false;

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
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                    child: Container(
                      height: 17,
                      width: 280,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(255, 178, 178, 178),
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 246, 255, 0)),
                          value: 0.25,
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
                    padding: const EdgeInsets.fromLTRB(20, 70, 0, 0),
                    child: Text(
                      'Welcome to MU',
                      style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                          // color: Color.fromARGB(255, 255, 255, 255),
                          color: Color.fromARGB(255, 38, 36, 36),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Let\'s get started...',
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 121, 121, 121),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 55, 0, 0),
                    child: Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 38, 36, 36),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: SizedBox(
                  height: 44,
                  child: TextField(
                    controller: nameController,
                    cursorColor: Colors.black,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1.1,
                        fontFamily: 'Times New Roman'),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(14, 5, 14, 5),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'Email ID',
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 38, 36, 36),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: SizedBox(
                  height: 44,
                  child: TextField(
                    controller: emailController,
                    cursorColor: Colors.black,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1.1,
                        fontFamily: 'Times New Roman'),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(14, 5, 14, 5),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (referralVisibility == true) {
                            referralVisibility = false;
                          } else {
                            referralVisibility = true;
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(50, 25),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'I have referral code',
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
              Visibility(
                visible: referralVisibility,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 35,
                        width: 220,
                        child: TextField(
                          controller: referralController,
                          cursorColor: Colors.black,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              letterSpacing: 1,
                              fontFamily: 'Times New Roman'),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Apply',
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
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: SizedBox(
                      height: 50,
                      width: 140,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Next',
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
            ],
          ),
        ),
      ),
    );
  }
}
