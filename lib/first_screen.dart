import 'package:ceckk/database/local_storage.dart';
import 'package:ceckk/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'models/user_model.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _selectedIndex = 0;
  TextEditingController reportingController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController dateofBirthController = TextEditingController();
  TextEditingController bloodController = TextEditingController();
  UserModel? data;
  // TextEditingController dateInput = TextEditingController();

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      data = await LocalStorage.getUserDetails();
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // dateInput.text = ""; //set the initial value of text field
    super.initState();
    init();
  }

  init() async {
    data = await LocalStorage.getUserDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1280px-Image_created_with_a_mobile_phone.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.menu,
                          color: Colors.red,
                          weight: 20,
                          size: 30,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.5,
                        ),
                        const Text(
                          "User Profile",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: height * 0.6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 4),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                      ),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: width * 0.4,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                'Ankit Soni',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width * 0.4,
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                'Flutter Developer',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Reporting manager:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                _getRightUi(
                                    _selectedIndex,
                                    ReusableTextField(
                                      hintText: "Enter Name",
                                      fieldController: reportingController,
                                      // formatter: [
                                      //   FilteringTextInputFormatter.allow(
                                      //       RegExp('[a-zA-Z]')),
                                      // ],
                                    ),
                                    data?.reportingManager ?? "")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Employee Code:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                _getRightUi(
                                    _selectedIndex,
                                    ReusableTextField(
                                      hintText: "XXXX",
                                      fieldController: codeController,
                                      formatter: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[a-zA-Z]')),
                                      ],
                                    ),
                                    data?.employeeCode ?? "")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Email Id:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                _getRightUi(
                                    _selectedIndex,
                                    ReusableTextField(
                                      hintText: "abc@gmail.com",
                                      fieldController: emailController,
                                    ),
                                    data?.email ?? "")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Contact no:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                _getRightUi(
                                    _selectedIndex,
                                    ReusableTextField(
                                      hintText: "1234567890",
                                      fieldController: contactController,
                                      formatter: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                    data?.contact ?? "")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Date of Birth:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                _getRightUi(
                                    _selectedIndex,
                                    ReusableTextField(
                                      hintText: "27/02/2000",
                                      fieldController: dateofBirthController,
                                    ),
                                    data?.dob ?? "")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Blood Group:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                _getRightUi(
                                    _selectedIndex,
                                    ReusableTextField(
                                      hintText: "B+",
                                      fieldController: bloodController,
                                    ),
                                    data?.bloodGroup ?? "")
                              ],
                            ),
                          ),
                          if (_selectedIndex == 0)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    if (contactController.text.isEmpty ||
                                        bloodController.text.isEmpty ||
                                        reportingController.text.isEmpty ||
                                        emailController.text.isEmpty ||
                                        dateofBirthController.text.isEmpty ||
                                        codeController.text.isEmpty) {
                                      showToast("All fields are mandatory");
                                    } else {
                                      UserModel userData = UserModel();
                                      userData.contact = contactController.text;
                                      userData.bloodGroup =
                                          bloodController.text;
                                      userData.email = emailController.text;
                                      userData.dob = dateofBirthController.text;
                                      userData.employeeCode =
                                          codeController.text;
                                      userData.reportingManager =
                                          reportingController.text;

                                      LocalStorage.setUserData(data: userData)
                                          .then((value) {
                                        showToast("Data Saved Successfully");
                                      });
                                    }
                                    setState(() {
                                      codeController.clear();
                                      reportingController.clear();
                                      dateofBirthController.clear();
                                      bloodController.clear();
                                      emailController.clear();
                                      contactController.clear();
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.black87),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                  color: Colors.red)))),
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                OutlinedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.red)))),
                                    onPressed: () {},
                                    child: Text("Close",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold))),
                              ],
                            )
                        ],
                      ),
                    ),
                  ),
                ),
                if (_selectedIndex == 0)
                  Positioned(
                    right: -40,
                    top: -110,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 95,
                        backgroundImage: NetworkImage(
                            "https://avatoon.me/wp-content/uploads/2021/09/Cartoon-Pic-Ideas-for-DP-Profile-02-768x768.png"),
                      ),
                    ),
                  )
                else
                  Positioned(
                    right: -40,
                    top: -110,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: CircleAvatar(
                            backgroundColor: Colors.black87,
                            radius: 18,
                            child: GestureDetector(
                              onTap: () {
                                onEditTap();
                              },
                              child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.black87,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 3,
                        ),
                        CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 95,
                            backgroundImage: NetworkImage(
                                "https://avatoon.me/wp-content/uploads/2021/09/Cartoon-Pic-Ideas-for-DP-Profile-02-768x768.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 40),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline, size: 40),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart, size: 40),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[600],
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  onEditTap() {
    _selectedIndex = 0;
    reportingController.text = data?.reportingManager ?? "";
    codeController.text = data?.employeeCode ?? "";
    emailController.text = data?.email ?? "";
    dateofBirthController.text = data?.dob ?? "";
    bloodController.text = data?.bloodGroup ?? "";

    setState(() {});
  }

  showToast(String text) {
    Fluttertoast.showToast(msg: text);
  }

  getUi(int index, double height, double width) {
    if (index != 0) {
      return Text("coco");
    }
    return Stack(
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1280px-Image_created_with_a_mobile_phone.png"),
                fit: BoxFit.fill,
              ),
            )),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: height * 0.6,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: width * 0.4,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            'Ankit Soni',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * 0.4,
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            'Flutter Developer',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Reporting manager:',
                              style: TextStyle(fontSize: 18),
                            ),
                            ReusableTextField(
                              hintText: "Enter Name",
                              fieldController: reportingController,
                              formatter: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-zA-Z]')),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Employee Code:',
                              style: TextStyle(fontSize: 18),
                            ),
                            ReusableTextField(
                              hintText: "000",
                              fieldController: codeController,
                              maxLength: 3,
                              formatter: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Email Id:',
                              style: TextStyle(fontSize: 18),
                            ),
                            ReusableTextField(
                              hintText: "abc@gmail.com",
                              fieldController: emailController,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Contact no:',
                              style: TextStyle(fontSize: 18),
                            ),
                            ReusableTextField(
                              hintText: "1234567890",
                              fieldController: contactController,
                              maxLength: 10,
                              formatter: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Date of Birth:',
                              style: TextStyle(fontSize: 18),
                            ),
                            ReusableTextField(
                              // onTap: () async {
                              //   DateTime? pickedDate = await showDatePicker(
                              //       context: context,
                              //       initialDate: DateTime.now(),
                              //       firstDate: DateTime(1950),
                              //       //DateTime.now() - not to allow to choose before today.
                              //       lastDate: DateTime(2100));
                              //
                              //   if (pickedDate != null) {
                              //     print(
                              //         pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              //     String formattedDate =
                              //         DateFormat('yyyy-MM-dd')
                              //             .format(pickedDate);
                              //     print(
                              //         formattedDate); //formatted date output using intl package =>  2021-03-16
                              //     setState(() {
                              //       dateInput.text =
                              //           formattedDate; //set output date to TextField value.
                              //     });
                              //   } else {}
                              // },
                              hintText: "27/02/2000",
                              fieldController: dateofBirthController,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Blood Group:',
                              style: TextStyle(fontSize: 18),
                            ),
                            ReusableTextField(
                              hintText: "B+",
                              fieldController: bloodController,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              if (contactController.text.isEmpty ||
                                  bloodController.text.isEmpty) {
                                showToast("All fields are mandatory");
                              } else {
                                UserModel userData = UserModel();
                                userData.contact = contactController.text;
                                userData.bloodGroup = bloodController.text;
                                userData.email = emailController.text;
                                userData.dob = reportingController.text;
                                userData.employeeCode =
                                    dateofBirthController.text;
                                userData.employeeCode = bloodController.text;
                                LocalStorage.setUserData(data: userData)
                                    .then((value) {
                                  showToast("Data Saved Successfully");
                                });
                              }
                              setState(() {
                                codeController.clear();
                                reportingController.clear();
                                dateofBirthController.clear();
                                bloodController.clear();
                              });
                            },
                            child: Text("Save"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          OutlinedButton(
                              onPressed: () {}, child: Text("Close")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              right: -40,
              top: -110,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 95,
                  backgroundImage: NetworkImage(
                      "https://avatoon.me/wp-content/uploads/2021/09/Cartoon-Pic-Ideas-for-DP-Profile-02-768x768.png"),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  _getRightUi(int index, Widget widget, String text) {
    if (index == 0) {
      return widget;
    }
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
