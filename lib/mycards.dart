import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:mu_card/dashboard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mu_card/qrcode.dart';

class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

bool containerMain = true;

class _MyCardsState extends State<MyCards> with SingleTickerProviderStateMixin {
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Share NFC Card App',
        text: 'Share NFC Card App',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Share NFC Card App');
  }

  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showMoreMenu() async {
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
                SimpleDialogOption(
                  onPressed: () {
                    // Navigator.of(context).pop();
                    showSnackBar('This device doesnt support NFC');
                  },
                  child: Center(
                    child: const Text(
                      'Write Physical Card',
                      style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(),
                SimpleDialogOption(
                  onPressed: () {},
                  child: Center(
                    child: const Text(
                      'Disable Card',
                      style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(),
                SimpleDialogOption(
                  onPressed: () {},
                  child: Center(
                    child: const Text(
                      'Delete Card',
                      style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            );
          });
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'My Cards',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 2, 54),
                fontSize: 24,
                fontFamily: 'Times New Roman',
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Card Label : ',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 2, 54),
                    fontSize: 15,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Card',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 42, 0),
                    fontSize: 15,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        CarouselSlider(
            items: [
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(color: Colors.black),
                      color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.0015)
                            ..rotateY(pi * _animation.value * 2),
                          child: _animation.value <= 0.5
                              ? InkWell(
                                  onTap: () {
                                    if (_status == AnimationStatus.dismissed) {
                                      _controller.forward();
                                    } else {
                                      _controller.reverse();
                                    }
                                  },
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          height: 225,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                // stops: [0.5, 0.5],
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 0, 30, 255),
                                                  Color.fromARGB(
                                                      255, 79, 79, 79),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                              color: Colors.grey),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              'No profile is active on card',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Times New Roman',
                                              ),
                                            )),
                                      ]),
                                )
                              : InkWell(
                                  onTap: () {
                                    if (_status == AnimationStatus.dismissed) {
                                      _controller.forward();
                                    } else {
                                      _controller.reverse();
                                    }
                                  },
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Container(
                                              height: 225,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  // stops: [0.5, 0.5],
                                                  colors: [
                                                    Color.fromARGB(
                                                        227, 201, 201, 201),
                                                    Color.fromARGB(
                                                        255, 79, 79, 79),
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(21),
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Text(
                                                  'Share profile by scanning the QR code',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'Times New Roman',
                                                  ),
                                                )),
                                          ]),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 22, 0, 0),
                                        child: SizedBox(
                                          height: 150,
                                          width: 150,
                                          child: Container(
                                            color: Colors.white,
                                            child: Icon(
                                              Icons.qr_code_2_outlined,
                                              size: 150,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Card Status : ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Times New Roman',
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Enabled',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 255, 34),
                                    fontSize: 14,
                                    fontFamily: 'Times New Roman',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: IconButton(
                                            onPressed: () {
                                              share();
                                            },
                                            icon: Icon(
                                              Icons.share,
                                              color: Colors.white,
                                              size: 27,
                                            ))),
                                  ),
                                  Text('Share',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Times New Roman',
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: IconButton(
                                            onPressed: () {
                                              showSnackBar(
                                                  'This device doesnt support NFC');
                                            },
                                            icon: Icon(
                                              Icons.nfc,
                                              color: Colors.white,
                                              size: 27,
                                            ))),
                                  ),
                                  Text('NFC',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Times New Roman',
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    const QRViewExample(),
                                              ));
                                            },
                                            icon: Icon(
                                              Icons.qr_code_2,
                                              color: Colors.white,
                                              size: 27,
                                            ))),
                                  ),
                                  Text('QR',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Times New Roman',
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: IconButton(
                                            onPressed: () {
                                              _showMoreMenu();
                                            },
                                            icon: Icon(
                                              Icons.more_vert,
                                              color: Colors.white,
                                              size: 27,
                                            ))),
                                  ),
                                  Text('More',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Times New Roman',
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Active Profile on this card.',
                            style: TextStyle(
                                color: Colors.amber[900],
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'No profile selected  ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 195, 187, 181),
                                    fontFamily: 'Times New Roman',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              // TextButton(
                              //   onPressed: () {
                              //     setState(() {
                              //       pageNumber = 1;
                              //     });
                              //   },
                              //   style: TextButton.styleFrom(
                              //     padding: EdgeInsets.zero,
                              //     minimumSize: Size(50, 10),
                              //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              //   ),
                              //   child: Text(
                              //     'Select profile',
                              //     style: TextStyle(
                              //         color: Color.fromARGB(
                              //           255,
                              //           77,
                              //           7,
                              //           255,
                              //         ),
                              //         decoration: TextDecoration.underline),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 280,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(21)),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  size: 70,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Link new card',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Times New Roman',
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
            options: CarouselOptions(
              height: 421,
              // aspectRatio: 0.6,
              viewportFraction: 0.89,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              // autoPlay: true,
              // autoPlayInterval: Duration(seconds: 10),
              // autoPlayAnimationDuration: Duration(milliseconds: 800),
              // autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.25,
              scrollDirection: Axis.horizontal,
            )),
      ],
    );
  }

  showSnackBar(String message) {
    var SnackBarVariable = SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        behavior: SnackBarBehavior.floating,
        width: 300,
        duration: const Duration(seconds: 2));
    ScaffoldMessenger.of(context).showSnackBar(SnackBarVariable);
  }
}
