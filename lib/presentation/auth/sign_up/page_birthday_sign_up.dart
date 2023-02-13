import 'package:final_flutter_project/presentation/auth/sign_up/template_form_sign_up.dart';
import 'package:final_flutter_project/presentation/shared/date_picker.dart';
import 'package:flutter/material.dart';

class PageBirthdaySignUp extends StatelessWidget {
  static const routeName = 'screen_birthday';

  final Function(DateTime dateTime) onSelectedDateChange;

  const PageBirthdaySignUp({
    Key? key,
    required this.onSelectedDateChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateFormSignUp(
      label: "What's your birthday ?",
      child: DatePickerSnapchat(
        onSelectedDate: onSelectedDateChange,
      ),
    );
  }
}
