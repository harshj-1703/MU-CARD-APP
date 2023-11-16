// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mu_card/connection.dart';
import 'package:mu_card/mycards.dart';
import 'package:mu_card/profiles.dart';
import 'drawer.dart';
import 'notifications.dart';

int pageNumber = 0;

class Dashboard extends StatefulWidget {
  // int pageNumber = 0;
  // set setPage(int number) {
  //   pageNumber = number;
  // }

  // int get getPage {
  //   return pageNumber;
  // }

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
          Color.fromARGB(255, 50, 190, 255),
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
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
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
        body: Column(
          children: [
            if (pageNumber == 1) ...[
              Expanded(child: SingleChildScrollView(child: Profiles())),
            ],
            if (pageNumber == 2) ...[
              Connection(),
            ],
            if (pageNumber == 0) ...[
              MyCards(),
            ],
          ],
        ),
        bottomNavigationBar: BottomBar(
          pageNumber: pageNumber,
          onPageChanged: (int page) {
            setState(() {
              pageNumber = page;
            });
          },
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final int pageNumber;
  final ValueChanged<int> onPageChanged;

  BottomBar({required this.pageNumber, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 27, 0, 136)),
        color: Color.fromARGB(55, 111, 255, 236),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 70,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomBarButton(
              icon: Icons.credit_card,
              label: 'My Cards',
              selected: pageNumber == 0,
              onPressed: () => onPageChanged(0),
            ),
            BottomBarButton(
              icon: Icons.perm_contact_calendar_sharp,
              label: 'Profiles',
              selected: pageNumber == 1,
              onPressed: () => onPageChanged(1),
            ),
            BottomBarButton(
              icon: Icons.connect_without_contact,
              label: 'Connection',
              selected: pageNumber == 2,
              onPressed: () => onPageChanged(2),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onPressed;

  BottomBarButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return selected
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 27, 0, 136)),
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton.icon(
              onPressed: onPressed,
              icon: Icon(
                icon,
                size: 30,
                color: Colors.amber,
              ),
              label: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Times New Roman',
                ),
              ),
            ),
          )
        : IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
          );
  }
}
