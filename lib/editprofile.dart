import 'package:flutter/material.dart';

import 'login/welcomename.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
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
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(2.5, 2.5, 0, 2.5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Color.fromARGB(255, 167, 167, 167)),
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(22, 76, 76, 76),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left_sharp,
                  color: Color.fromARGB(255, 9, 0, 103),
                  size: 30,
                ),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ],
              ),
              SizedBox(
                // width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text(
                    'Change Profile',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 2, 125)),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 38, 36, 36),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: SizedBox(
                  // height: 50,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    },
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.black,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontFamily: 'Times New Roman'),
                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.fromLTRB(14, 5, 14, 5),
                      // filled: true,
                      // fillColor: Colors.white,
                      border: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      'Contact',
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 38, 36, 36),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: SizedBox(
                  // height: 50,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Contact Number';
                      }
                      return null;
                    },
                    controller: contactController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1.1,
                        fontFamily: 'Times New Roman'),
                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.fromLTRB(14, 5, 14, 5),
                      // filled: true,
                      // fillColor: Colors.white,
                      border: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      'Email ID',
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 38, 36, 36),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: SizedBox(
                  // height: 50,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1.1,
                        fontFamily: 'Times New Roman'),
                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.fromLTRB(14, 5, 14, 5),
                      // filled: true,
                      // fillColor: Colors.white,
                      border: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.amberAccent,
                              fontSize: 20,
                              fontFamily: 'Times New Roman'),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 20, 20, 20),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Delete Account',
                          style: TextStyle(
                              color: Colors.amberAccent,
                              fontSize: 15,
                              fontFamily: 'Times New Roman'),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 20, 20, 20),
                          foregroundColor: Colors.white,
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
    );
  }
}
