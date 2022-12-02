import 'dart:html';

import 'package:firstproject/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? username;
  String? password;
  String? genderselected;
  String? DateTime;
  String? Slider;
  String? email;
  String? Radiobutton;
  String? Checkbox;
  String? Checkboxgroup;
  String? Segmented;
  String? Choicechip;
  String? userPrefs;

  List gender = ["Male", "Female", "Others"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 223, 223),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back),
        title: Text(
          "NETFLIX",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 143, 4, 4)),
        ),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: "username",
                decoration: InputDecoration(
                    hintText: "Enter UserName",
                    labelText: "UserName",
                    hintStyle: TextStyle(color: Colors.white)),
                readOnly: false,
                enabled: true,
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "This field is required")
                ]),
              ),
              FormBuilderTextField(
                name: "password",
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                    hintStyle: TextStyle(color: Colors.white)),
                readOnly: false,
                enabled: true,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "This field is required"),
                ]),
              ),
              FormBuilderDropdown(
                name: "gender",
                items: gender
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "This field is required")
                ]),
                decoration: InputDecoration(
                    hintText: "Select Gender",
                    labelText: "Gender",
                    hintStyle: TextStyle(color: Colors.white)),
                onChanged: (newvalue) {
                  setState(() {
                    genderselected = newvalue.toString();
                  });
                },
              ),
              FormBuilderDateTimePicker(
                name: "DateTime",
                // initialValue: DateTime.now(),
                // firstDate: DateTime(2022-10-11),
                // lastDate: DateTime.now(),
                decoration: InputDecoration(
                    hintText: "Enter DateTime",
                    labelText: "DateTime",
                    hintStyle: TextStyle(color: Colors.white)),

                enabled: true,
                onChanged: (newvalue) {
                  setState(() {
                    DateTime = newvalue.toString();
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "This field is required")
                ]),
              ),
              FormBuilderSlider(
                name: "Slider",
                initialValue: 40,
                min: 0,
                max: 100,
                divisions: 7,
                activeColor: Color.fromARGB(255, 187, 23, 11),
                inactiveColor: Colors.white,
              ),
              FormBuilderTextField(
                name: "email",
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Enter Email Address",
                    labelText: "Email",
                    hintStyle: TextStyle(color: Colors.white)),
                readOnly: false,
                enabled: true,
                onChanged: (value) {
                  setState(() {
                    email = value.toString();
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "This field is required"),
                  FormBuilderValidators.email()
                ]),
              ),
              FormBuilderRadioGroup(
                name: "Radiobutton",
                options: ["Tamil", "Hindi", "Spanish"]
                    .map((e) => FormBuilderFieldOption(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                controlAffinity: ControlAffinity.trailing,
                decoration: InputDecoration(
                    // hintText: "Enter UserName",
                    // labelText: "UserName",
                    hintStyle: TextStyle(color: Colors.white)),
                // readOnly: false,
                enabled: true,
                onChanged: (value) {
                  setState(() {
                    Radiobutton = value;
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "This field is required")
                ]),
              ),
              FormBuilderCheckbox(
                name: "Checkbox",
                title: Row(
                  children: [
                    Text("Agree & Continue"),
                    Text(
                      " terms of service",
                      style: TextStyle(color: Color.fromARGB(255, 182, 21, 10)),
                    )
                  ],
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "This field is required")
                ]),
              ),
              FormBuilderCheckboxGroup(
                name: "Checkboxgroup",
                options: List.generate(5, (index) => index + 1)
                    .map((e) => FormBuilderFieldOption(
                          value: e,
                          child: Text(e.toString()),
                        ))
                    .toList(),
              ),
              FormBuilderSegmentedControl(
                name: "Segmented",
                options: List.generate(5, (index) => index + 1)
                    .map((e) => FormBuilderFieldOption(
                          value: e,
                          child: Icon(
                            Icons.star,
                          ),
                        ))
                    .toList(),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "This field is required")
                ]),
              ),
              FormBuilderFilterChip(
                name: "Filterchip",
                options: ["Tamil", "Hindi", "Spanish"]
                    .map((e) => FormBuilderChipOption(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
              ),
              FormBuilderChoiceChip(
                name: "Choicechip",
                options: ["Tamil", "Hindi", "Spanish"]
                    .map((e) => FormBuilderChipOption(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "This field is required")
                ]),
                selectedColor: Color.fromARGB(255, 185, 41, 30),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 180, 36, 26),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    username =
                        _formKey.currentState!.value["username"].toString();
                    username =
                        _formKey.currentState!.value["password"].toString();
                    username = _formKey.currentState!.value["genderselected"]
                        .toString();
                    userinfo(username!, password!, genderselected!);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => homescreen(
                                  username: username!,
                                  password: password!,
                                  gender: genderselected!,
                                )));
                    _formKey.currentState!.fields['User Name']!.reset();
                    _formKey.currentState!.fields['Password']!.reset();
                    _formKey.currentState!.fields['Gender']!.reset();
                  } else {
                    print("Error");
                  }
                },
                child: Text("Sign In"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Need help?",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "New to Netflix? Sign up now.",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        )),
      ),
    );
  }

  void userinfo(String username, String password, String genderselected) async {
    SharedPreferences userPrefs = await SharedPreferences.getInstance();
    userPrefs.setStringList("userInfo", [username, password, genderselected]);
    print(userPrefs.getStringList("userInfo"));
  }
}
