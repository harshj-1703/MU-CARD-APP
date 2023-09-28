import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mu_card/addinstaprofile.dart';
import 'package:mu_card/addlinkedinprofile.dart';
import 'package:mu_card/addsocialprofile.dart';
import 'package:mu_card/addspotifyprofile.dart';
import 'package:mu_card/addyoutubeprofile.dart';
import 'package:mu_card/createbusinessprofile.dart';

class Profiles extends StatefulWidget {
  const Profiles({super.key});

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  Future<void> createProfile() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            // title: const Text('Select Booking Type'),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 40,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  'Select Your Profile Type',
                  style: TextStyle(color: Colors.black, fontSize: 21),
                )),
              ),
              Center(
                  child: Text(
                'Create your profile and start connecting',
                style: TextStyle(color: Colors.black, fontSize: 15),
              )),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.grey),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CreateBusinessProfile()),
                                              ((route) => true));
                                        },
                                        icon: Icon(
                                          Icons.business_center,
                                          size: 40,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      'Business',
                                      style: TextStyle(
                                          fontFamily: 'Times New Roman',
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.grey),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddSocialProfile()),
                                              ((route) => true));
                                        },
                                        icon: Icon(
                                          Icons.person,
                                          size: 40,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      'Personal',
                                      style: TextStyle(
                                          fontFamily: 'Times New Roman',
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    createProfile();
                  },
                  child: Text(
                    '+ Create Profile',
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
            ),
          ),
        ),
      ],
    );
  }
}
