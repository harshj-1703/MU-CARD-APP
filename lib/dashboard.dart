// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
          drawer: DrawerMenu(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(2, 3.5, 0, 3.5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 167, 167, 167)),
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(26, 39, 39, 39),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.double_arrow_rounded,
                        color: Color.fromARGB(255, 9, 0, 103),
                        size: 30,
                      ),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                );
              },
            ),
            centerTitle: true,
            title: Text(
              'MU CARD APP',
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
                padding: const EdgeInsets.fromLTRB(0, 3.5, 2, 3.5),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Color.fromARGB(255, 167, 167, 167)),
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(26, 39, 39, 39),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notifications()),
                            ((route) => true));
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.amber,
                        size: 30,
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
