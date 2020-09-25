import 'package:eattendanceapps/components/form_error.dart';
import 'package:eattendanceapps/components/no_account_text.dart';
import 'package:eattendanceapps/constants.dart';
import 'package:eattendanceapps/screen/forgot_password/forgot_password_screen.dart';
import 'package:eattendanceapps/screen/login_success/login_success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eattendanceapps/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Welcome",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Sign in with your username and password",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          SignForm(),
        ],
      ),
    ));
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String _username;
  String _password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildUsernameTextFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildPasswordTextFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
                Text("Remember Me"),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName);
                  },
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(56),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: kPrimaryColor,
                onPressed: signInBase,
                child: Text(
                  "Continue",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.white),
                ),
              ),
            ),
            NoAccountText(),
          ],
        ),
      ),
    );
  }

  TextFormField buildPasswordTextFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => _password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kMatchPassError);
        }
        _password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildUsernameTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _username = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kUsernameNullError);
        } else if (!usernameValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidUsernameError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kUsernameNullError);
          return "";
        } else if (!usernameValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidUsernameError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Enter your username",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Future<void> signInBase() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _username, password: _password))
            .user;
        print(user);
        Navigator.pushNamed(context, LoginSuccessScreen.routeName);
      } catch (e) {}
    }
  }
}
