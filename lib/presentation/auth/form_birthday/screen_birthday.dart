import 'package:final_flutter_project/presentation/shared/date_picker.dart';
import 'package:flutter/material.dart';

import '../form_username/screen_username.dart';

class ScreenBirthday extends StatelessWidget {
  static const routeName = 'screen_birthday';

  late DateTime selectedDate = DateTime.now();

  ScreenBirthday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "What's your birthday ?",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DatePickerSnapchat(
                    onSelectedDate: onChangeDate,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () => _goToUsername(context),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 40),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onChangeDate(DateTime dateTime) {
    selectedDate = dateTime;
  }

  _goToUsername(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenUsername.routeName);
  }
}
