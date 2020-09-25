import 'package:eattendanceapps/components/form_error.dart';
import 'package:eattendanceapps/constants.dart';
import 'package:eattendanceapps/screen/login_success/login_success_screen.dart';
import 'package:eattendanceapps/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text("Register Account", style: headingStyle),
            Text(
              "Complete your personal detail",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String password;
  String confirm_password;
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
    return Form(
      key: _formKey,
      child: Column(children: [
        buildUsernameFormField(),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        buildPasswordFormField(),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        buildConfirmPasswordFormField(),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        FormError(errors: errors),
        SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(56),
          child: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: kPrimaryColor,
            onPressed: () {
              if (_formKey.currentState.validate()) ;
            },
            child: Text(
              "Continue",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (password == confirm_password) {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != confirm_password) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kMatchPassError);
        }
        password = value;
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

  TextFormField buildUsernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => username = newValue,
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
                .createUserWithEmailAndPassword(
                    email: username, password: password))
            .user;
        Navigator.pushNamed(context, LoginSuccessScreen.routeName);
      } catch (e) {}
    }
  }
}
