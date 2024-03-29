// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddInstaProfile extends StatefulWidget {
  const AddInstaProfile({super.key});

  @override
  State<AddInstaProfile> createState() => _AddInstaProfileState();
}

class _AddInstaProfileState extends State<AddInstaProfile> {
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
          Color.fromARGB(255, 50, 190, 255),
          Colors.white,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Add Instagram',
            style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 9, 0, 103)),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: const [
                    Color.fromARGB(255, 169, 255, 255),
                    Color.fromARGB(255, 0, 255, 251),
                  ]),
            ),
          ),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.fromLTRB(0, 7, 7, 7),
          //     child: Container(
          //       padding: EdgeInsets.all(5),
          //       decoration: BoxDecoration(
          //           color: Color.fromARGB(255, 7, 234, 255),
          //           border: Border.all(
          //             color: Colors.white,
          //             width: 3,
          //           ),
          //           borderRadius: BorderRadius.circular(20)),
          //       child: TextButton(
          //         onPressed: () {},
          //         style: TextButton.styleFrom(
          //           padding: EdgeInsets.zero,
          //           minimumSize: Size(50, 10),
          //           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //         ),
          //         child: Text(
          //           ' Save',
          //           style: TextStyle(
          //               color: Color.fromARGB(255, 255, 55, 0),
          //               fontSize: 20,
          //               fontFamily: 'Times New Roman',
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     ),
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // color: Color.fromARGB(83, 252, 252, 252),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(86, 252, 252, 252),
                        Color.fromARGB(199, 0, 247, 255)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // _showName();
                        },
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Instagram',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 205, 3, 181),
                                  fontSize: 30,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Create Your Instagram Profile',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 3, 99),
                                  fontSize: 18,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 7),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 34, 0, 202)),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 121, 3, 148),
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: SizedBox(
                                height: 40,
                                width: 160,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Create Card',
                                    style: TextStyle(
                                        color: Colors.amberAccent,
                                        fontSize: 20,
                                        fontFamily: 'Times New Roman'),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 8, 8, 8),
                                    foregroundColor: Colors.white,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
