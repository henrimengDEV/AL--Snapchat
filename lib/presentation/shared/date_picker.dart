import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';

class DatePickerSnapchat extends StatefulWidget {

  const DatePickerSnapchat({Key? key}) : super(key: key);

  @override
  State<DatePickerSnapchat> createState() => _DatePickerSnapchatState();
}

class _DatePickerSnapchatState extends State<DatePickerSnapchat> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          height: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey[900]!,
                  Colors.black,
                ],
                stops: const [0.7, 1.0],
              ),),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DatePickerWidget(
                  looping: false, // default is not looping
                  firstDate: DateTime.now(), //DateTime(1960),
                  //  lastDate: DateTime(2002, 1, 1),
//              initialDate: DateTime.now(),// DateTime(1994),
                  dateFormat:
                  // "MM-dd(E)",
                  "dd/MMMM/yyyy",
                  // locale: DatePicker.localeFromString('th'),
                  onChange: (DateTime newDate, _) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                    print(_selectedDate);
                  },
                  pickerTheme: const DateTimePickerTheme(
                    backgroundColor: Colors.transparent,
                    itemTextStyle:
                    TextStyle(color: Colors.white, fontSize: 19),
                    dividerColor: Colors.white,
                  ),
                ),
                Text("${_selectedDate ?? ''}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
