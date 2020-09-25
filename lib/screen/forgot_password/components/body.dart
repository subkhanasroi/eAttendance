import 'package:eattendanceapps/components/form_error.dart';
import 'package:eattendanceapps/components/no_account_text.dart';
import 'package:eattendanceapps/constants.dart';
import 'package:eattendanceapps/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassword(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (newValue) => email = newValue,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kUsernameNullError)) {
                  setState(() {
                    errors.remove(kUsernameNullError);
                  });
                } else if (!usernameValidatorRegExp.hasMatch(value) &&
                    !errors.contains(kInvalidUsernameError)) {
                  setState(() {
                    errors.remove(kInvalidUsernameError);
                  });
                }
                return null;
              },
              validator: (value) {
                if (value.isEmpty && !errors.contains(kUsernameNullError)) {
                  setState(() {
                    errors.add(kUsernameNullError);
                  });
                } else if (!usernameValidatorRegExp.hasMatch(value) &&
                    !errors.contains(kInvalidUsernameError)) {
                  setState(() {
                    errors.add(kInvalidUsernameError);
                  });
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(56),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: kPrimaryColor,
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                  ;
                },
                child: Text(
                  "Continue",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            NoAccountText(),
          ],
        ));
  }
}
