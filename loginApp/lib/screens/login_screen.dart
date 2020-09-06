import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            emailField(),
            SizedBox(
              height: 10,
            ),
            passwordField(),
            SizedBox(
              height: 20,
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "email@email.com",
        labelText: "Email",
      ),
      validator: validateEmail,
      onSaved: (String value) {
        print(value);
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      //keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "******",
        labelText: "Password",
      ),
      validator: validatePassword,
      onSaved: (String value) {
        print(value);
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('TIme to post $email and $password');
          // take *both* email / pw

          // send it to API
        }
      },
      child: Text('Submit'),
    );
  }
}
