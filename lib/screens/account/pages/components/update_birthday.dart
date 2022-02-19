import 'package:flutter/material.dart';

class UpdateBirthday extends StatefulWidget {
  const UpdateBirthday({Key? key}) : super(key: key);

  @override
  _UpdateBirthdayState createState() => _UpdateBirthdayState();
}

class _UpdateBirthdayState extends State<UpdateBirthday> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.input,
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
      helpText: 'Chọn ngày Sinh nhật',
      cancelText: 'Hủy',
      confirmText: 'Xác nhận'
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: const TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text(
                'Chọn ngày',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              //color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}
