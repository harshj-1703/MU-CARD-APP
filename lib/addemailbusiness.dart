import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AddBusinessEmails extends StatefulWidget {
  const AddBusinessEmails({super.key});

  @override
  State<AddBusinessEmails> createState() => _AddBusinessEmailsState();
}

class _AddBusinessEmailsState extends State<AddBusinessEmails> {
  List<String> _mobileNumbers = [];

  void _addMobileNumberField() {
    setState(() {
      _mobileNumbers.add("");
    });
  }

  void _removeMobileNumberField(int index) {
    setState(() {
      _mobileNumbers.removeAt(index);
    });
  }

  void _updateMobileNumberField(int index, String value) {
    setState(() {
      _mobileNumbers[index] = value;
    });
  }

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
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Add Emails',
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
                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                      child: Text(
                        'Add Emails',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 15, 178),
                            fontFamily: 'Times New Roman',
                            fontSize: 27),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                        onPressed: _addMobileNumberField,
                        icon: Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 8, 1, 75),
                          size: 30,
                        ),
                        label: Text(
                          'Add New',
                          style: TextStyle(
                              color: Color.fromARGB(255, 8, 1, 75),
                              fontSize: 17),
                        )),
                  ],
                ),
              ),
              Divider(),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ..._mobileNumbers.asMap().entries.map((entry) {
                        int index = entry.key;
                        String mobileNumber = entry.value;
                        return Row(
                          children: [
                            Expanded(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 3, 10, 3),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(5.0),
                                      // set highlight color here
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.2),
                                          blurRadius: 10.0,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Times New Roman',
                                          letterSpacing: 1.25),
                                      initialValue: mobileNumber,
                                      maxLength: 10,
                                      decoration: InputDecoration(
                                        counterText: "",
                                        contentPadding:
                                            EdgeInsets.fromLTRB(15, 3, 10, 3),
                                        hintText: "Enter Email",
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        _updateMobileNumberField(index, value);
                                      },
                                    ),
                                  )),
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                _removeMobileNumberField(index);
                              },
                            ),
                          ],
                        );
                      }).toList(),
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
