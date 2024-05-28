import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormWithValidation extends StatefulWidget {
  const FormWithValidation({super.key});

  @override
  State<FormWithValidation> createState() => _FormWithValidationState();
}

class TextObject {
  String? name;
  String? email;
  String? mobile;
  String? address;

  TextObject(this.name, this.email, this.mobile, this.address);

  @override
  String toString() {
    return 'Person{name: $name, mobile: $mobile, address: $address, email : $email}';
  }
}

class NameInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String singleSpacedText = newValue.text.replaceAll(RegExp(r'\s+'), ' ');
    return TextEditingValue(
      text: singleSpacedText.replaceAll(RegExp(r'[^a-zA-Z\s]'), ''),
      selection: newValue.selection,
    );
  }
}

class EmailInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.replaceAll(RegExp(r'\s'), ''),
      selection: newValue.selection,
    );
  }
}

class _FormWithValidationState extends State<FormWithValidation> {
  final _formKey = GlobalKey<FormState>();

  void onPressed() => {debugPrint("Lll")};
  final inputName = TextEditingController();
  final inputEmail = TextEditingController();
  final inputMobile = TextEditingController();
  final inputAddress = TextEditingController();
  final inputGender = TextEditingController();
  final inputState = TextEditingController();
  final inputDistrict = TextEditingController();
  final inputVillage = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputName.dispose();
    inputEmail.dispose();
    inputMobile.dispose();
    inputAddress.dispose();
    inputGender.dispose();
    inputState.dispose();
    inputDistrict.dispose();
    inputVillage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form with Validation',
          style: TextStyle(
              fontSize: 14, color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Basic Details",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    tileColor: Theme.of(context).colorScheme.surface,
                    textColor: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: inputName,
                    inputFormatters: [NameInputFormatter()],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // autofocus: true,
                    onChanged: (value) {
                      debugPrint(value.length.toString());
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter some text";
                      } else if (value.length <= 2 || value.length >= 50) {
                        return "Name should be from 3 to 50 characters";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name',
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: inputEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // autofocus: true,
                    inputFormatters: [
                      EmailInputFormatter(),
                    ],
                    validator: (value) {
                      Pattern emailPattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = RegExp(emailPattern as String);
                      if (value == null || value.isEmpty) {
                        return "please enter some text";
                      } else if (value.length < 6 || !regex.hasMatch(value)) {
                        return "Invalid email format";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your Email ID',
                      labelText: 'Email ID',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    maxLength: 10,
                    controller: inputMobile,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // autofocus: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter some text";
                      } else if (value.startsWith(RegExp(r'[0-5]'))) {
                        return "Invalid Format";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        suffixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(
                            Icons.dialpad,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Mobile Number',
                        labelText: 'Mobile Number',
                        helperText: 'use this to login'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: inputAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // autofocus: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter some text";
                      } else if (value.contains("@")) {
                        return "please don't use '@'";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Address',
                      labelText: 'Address',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              // Clear all the text fields
                              inputName.clear();
                              inputEmail.clear();
                              inputMobile.clear();
                              inputAddress.clear();
                              inputGender.clear();
                              inputState.clear();
                              inputDistrict.clear();
                              inputVillage.clear();
                              // Reset the form to clear validation errors
                              _formKey.currentState!.reset();
                            },
                            child: Text(
                              "cancel".toUpperCase(),
                            )),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: FilledButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                TextObject textObject = TextObject(
                                    inputName.text,
                                    inputEmail.text,
                                    inputMobile.text,
                                    inputAddress.text);
                                debugPrint(textObject.toString());
                              }
                            },
                            child: Text(
                              "save".toUpperCase(),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
