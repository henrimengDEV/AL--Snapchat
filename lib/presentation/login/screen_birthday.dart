import 'package:final_flutter_project/presentation/shared/date_picker.dart';
import 'package:flutter/material.dart';

import 'form_birthday.dart';

class ScreenBirthday extends StatelessWidget {
  const ScreenBirthday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Expanded(child: FormBirthday()),
              ElevatedButton(
                  onPressed: () => {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ScreenBirthday()))
                  },
                  child: Text("Continue")),
              SizedBox(height: 10),
              Expanded(child: DatePickerSnapchat()),
            ],
          ),
        ),
      ),
    );
  }
}
