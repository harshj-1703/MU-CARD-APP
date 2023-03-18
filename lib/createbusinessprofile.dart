// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
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

    // Future<void> _addContacts() async {
    //   List<String> _mobileNumbers = [];

    //   void _addMobileNumberField() {
    //     setState(() {
    //       _mobileNumbers.add("");
    //     });
    //   }

    //   void _removeMobileNumberField(int index) {
    //     setState(() {
    //       _mobileNumbers.removeAt(index);
    //     });
    //   }

    //   void _updateMobileNumberField(int index, String value) {
    //     setState(() {
    //       _mobileNumbers[index] = value;
    //     });
    //   }

    //add contacts menu
    //   await showDialog<void>(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return Dialog(
    //           backgroundColor: Colors.transparent,
    //           child: Container(
    //             width: MediaQuery.of(context).size.width,
    //             height: MediaQuery.of(context).size.height,
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(20)),
    //             // child: YourDialogContent(),
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
    //                         child: Text(
    //                           'Add Contacts',
    //                           style: TextStyle(
    //                               color: Color.fromARGB(255, 0, 15, 178),
    //                               fontFamily: 'Times New Roman',
    //                               fontSize: 27),
    //                         ),
    //                       ),
    //                       Expanded(child: Container()),
    //                       IconButton(
    //                           onPressed: () {
    //                             Navigator.of(context).pop();
    //                           },
    //                           icon: Icon(
    //                             Icons.close,
    //                             color: Color.fromARGB(255, 0, 0, 0),
    //                             size: 35,
    //                           ))
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.end,
    //                     children: [
    //                       TextButton.icon(
    //                           onPressed: _addMobileNumberField,
    //                           icon: Icon(Icons.add),
    //                           label: Text('Add New')),
    //                     ],
    //                   ),
    //                 ),
    //                 Divider(),
    //                 SingleChildScrollView(
    //                   child: Column(
    //                     children: [
    //                       ..._mobileNumbers.asMap().entries.map((entry) {
    //                         int index = entry.key;
    //                         String mobileNumber = entry.value;
    //                         return Row(
    //                           children: [
    //                             Expanded(
    //                               child: TextFormField(
    //                                 initialValue: mobileNumber,
    //                                 decoration: InputDecoration(
    //                                   hintText: "Enter mobile number",
    //                                 ),
    //                                 onChanged: (value) {
    //                                   _updateMobileNumberField(index, value);
    //                                 },
    //                               ),
    //                             ),
    //                             IconButton(
    //                               icon: Icon(Icons.remove),
    //                               onPressed: () {
    //                                 _removeMobileNumberField(index);
    //                               },
    //                             ),
    //                           ],
    //                         );
    //                       }).toList(),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       });
    // }

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
                      onTap: () {},
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
                      onTap: () {},
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
                      onTap: () {},
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
                  onTap: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
