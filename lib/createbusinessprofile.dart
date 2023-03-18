// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mu_card/addemailbusiness.dart';
import 'package:mu_card/addmobilenumbersbusiness.dart';

class CreateBusinessProfile extends StatefulWidget {
  const CreateBusinessProfile({super.key});

  @override
  State<CreateBusinessProfile> createState() => _CreateBusinessProfileState();
}

class _CreateBusinessProfileState extends State<CreateBusinessProfile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  File? _image;
  Future getImageCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  Future getImageGallary() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);

      setState(() {
        this._image = imageTemporary;
      });
    } catch (e) {
      print(e);
    }
  }

  void _showDialogBox(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 0, 255, 247)),
              height: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
                    child: Text(
                      'Select Picture',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 4, 120),
                          letterSpacing: 2,
                          fontFamily: 'Times New Roman'),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            getImageCamera();
                            Navigator.pop(context);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/camera.png',
                                height: 70,
                                width: 70,
                              ),
                              Text(
                                'Camera',
                                style: TextStyle(
                                    fontFamily: 'Times New Roman',
                                    fontSize: 21,
                                    color: Color.fromARGB(255, 7, 0, 99),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      // VerticalDivider(
                      //   color: Colors.amber,
                      // ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                        child: InkWell(
                          onTap: () {
                            getImageGallary();
                            Navigator.pop(context);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/gallery.png',
                                height: 70,
                                width: 70,
                              ),
                              Text(
                                'Gallery',
                                style: TextStyle(
                                    fontFamily: 'Times New Roman',
                                    fontSize: 21,
                                    color: Color.fromARGB(255, 7, 0, 99),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showName() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Basic Info',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Your Name',
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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Designation',
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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Company',
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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Industry',
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
              ],
            );
          });
    }

    //add bio menu
    Future<void> _addbio() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Bio',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      maxLines: 7,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Bio Here',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //add edu menu
    Future<void> _addedu() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Education',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      maxLines: 7,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Education Here',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //add exp menu
    Future<void> _addExp() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Experience',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      maxLines: 7,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Experience Here',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //add hobby menu
    Future<void> _addhobby() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Hobby',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      maxLines: 7,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Hobby Here',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //add info menu
    Future<void> _addinfo() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Info',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      maxLines: 7,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Info Here',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //add services menu
    Future<void> _addservices(context) async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Services',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      maxLines: 7,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Services Here',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //add address menu
    Future<void> _addAddress(context) async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Address',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add House Number',
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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add City',
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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add State',
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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Country',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //whatsapp add
    Future<void> _addwhatsapp() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add WhatsApp',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add WhatsApp',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //instagram add
    Future<void> _addInstagram() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Instagram',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Instagram',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //Facebook add
    Future<void> _addFacebook() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Facebook',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Facebook',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //linkedin add
    Future<void> _addLinkedin() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add LinkedIn',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add LinkedIn',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //Twitter add
    Future<void> _addTwitter() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Twitter',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Twitter',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //skype add
    Future<void> _addSkype() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Skype',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Skype',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //gpay add
    Future<void> _addGpay() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add GPay',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add GPay',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //paytm add
    Future<void> _addPaytm() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Paytm',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Paytm',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //website add
    Future<void> _addWebsite() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Website',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Website Link',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //drive add
    Future<void> _addDrive() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Drive',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Drive Link',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //document add
    Future<void> _addDocument() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Document',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Document Link',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //website add
    Future<void> _addCloud() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Cloud',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Cloud Link',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

    //messenger add
    Future<void> _addMessenger() async {
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Add Messenger',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Times New Roman',
                              fontSize: 27),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      // maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 1.1,
                          fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        hintText: 'Add Messenger',
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
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
              ],
            );
          });
    }

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
            'Business Profile',
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
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 7, 7, 7),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 7, 234, 255),
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 10),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    ' Save',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 55, 0),
                        fontSize: 20,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(21, 12, 21, 8),
                        child: InkWell(
                          onTap: () {
                            // print('pressed');
                            // getImageGallary();
                            // getImageCamera();
                            _showDialogBox(context);
                          },
                          child: ClipOval(
                            //no need to provide border radius to make circular image
                            child: _image != null
                                ? Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: 120,
                                  )
                                : CircleAvatar(
                                    radius: 50,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/guest.png',
                                        fit: BoxFit.cover,
                                        height: 200,
                                        width: 200,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showName();
                        },
                        child: Column(
                          children: [
                            Text(
                              'Your Name',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 3, 99),
                                  fontSize: 21,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Designation',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 3, 99),
                                  fontSize: 16,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Company',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 3, 99),
                                  fontSize: 16,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Industry',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 3, 99),
                                  fontSize: 16,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      _addbio();
                    },
                    child: Text(
                      'Add Bio',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Times New Roman'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 0, 82),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      _addservices(context);
                    },
                    child: Text(
                      'Add Services',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Times New Roman'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 0, 82),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 15, 2, 5),
                child: Text(
                  'Phone messenger & Emails',
                  style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 0, 103)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        // _addContacts();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddBusinessMobiles()),
                            // ModalRoute.withName("/MainScreen")
                            ((route) => true));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.call,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Contact',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddBusinessEmails()),
                            // ModalRoute.withName("/MainScreen")
                            ((route) => true));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.email,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Email ID',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addwhatsapp();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.whatsapp,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Whatsapp',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addMessenger();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.facebookMessenger,
                              size: 42,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            'Messenger',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 15, 2, 5),
                child: Text(
                  'Address & Location',
                  style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 0, 103)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    _addAddress(context);
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 72,
                        width: 72,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 21, 104),
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 42,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      Text(
                        'Add new',
                        style: TextStyle(
                            color: Color.fromARGB(255, 3, 0, 82),
                            fontSize: 15,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 15, 2, 5),
                child: Text(
                  'Website & Links',
                  style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 0, 103)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addWebsite();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.earthAsia,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Website',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addDrive();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.googleDrive,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Drive Link',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addDocument();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.edit_document,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Document',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addCloud();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.cloud,
                              size: 42,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            'Cloud Link',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 15, 2, 5),
                child: Text(
                  'Social Media',
                  style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 0, 103)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addSkype();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.skype,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Skype',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addTwitter();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Twitter',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addLinkedin();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.linkedin,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'LinkedIn',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addFacebook();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              size: 42,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            'Facebook',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addInstagram();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              size: 42,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            'Instagram',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 15, 2, 5),
                child: Text(
                  'Payment',
                  style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 0, 103)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addGpay();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.googlePay,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'GPay',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addPaytm();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.paypal,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Paytm',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 15, 2, 5),
                child: Text(
                  'Other Information',
                  style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 0, 103)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addedu();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.graduationCap,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Education',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addExp();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.certificate,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Experience',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addhobby();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.puzzlePiece,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Hobbies',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _addinfo();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 21, 104),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.info,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Info',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 0, 82),
                                fontSize: 15,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w500),
                          )
                        ],
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
