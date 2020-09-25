import 'package:eattendanceapps/size_config.dart';
import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Column formErrorText({String error}) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Text(error),
          ],
        ),
      ],
    );
  }
}
