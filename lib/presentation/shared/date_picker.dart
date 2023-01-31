import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';

typedef OnSelectedDate = void Function(DateTime dateTime);


class DatePickerSnapchat extends StatelessWidget {

  final OnSelectedDate onSelectedDate;

  const DatePickerSnapchat({ required this.onSelectedDate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: DatePickerWidget(
        looping: false, // default is not looping
        firstDate: DateTime(1900), //DateTime(1960),
        lastDate: DateTime.now(),
        // initialDate: DateTime.now(),// DateTime(1994),
        dateFormat:
            // "MM-dd(E)",
            "dd/MMMM/yyyy",
        // locale: DatePicker.localeFromString('th'),
        onChange: (DateTime newDate, _) {
          onSelectedDate(newDate);
        },
        pickerTheme: const DateTimePickerTheme(
          backgroundColor: Colors.transparent,
          itemTextStyle: TextStyle( fontSize: 25),
        ),
      ),
    );
  }
}
