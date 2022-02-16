import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hkl_books/config.dart';

import 'editing_dialog.dart';

class EditButton extends StatefulWidget {
  const EditButton({
    Key? key,
    required this.icon,
    required this.name,
    required this.title,
    required this.onTaps,
  }) : super(key: key);
  final String icon, name, title;
  final Function onTaps;

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  TextEditingController editedValue = TextEditingController();
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.input,
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
      helpText: 'Cập nhật Sinh nhật',
      cancelText: 'Hủy',
      confirmText: 'Xác nhận',
      errorFormatText: 'Ngày sai định dạng',
      fieldLabelText: 'Nhập Sinh nhật',
      fieldHintText: 'Tháng/Ngày/Năm',
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    editedValue = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: myGrey),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onTap: () {
            // ShowEditDialog(
            //     name: widget.title,
            //     editedValue: editedValue,
            //     hintText: widget.name);
            widget.title == 'Sinh nhật'
                ? _selectDate(context)
                : showDialogEdit(
                    context, widget.title, editedValue, widget.name);
          },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.name,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SvgPicture.asset(
                'assets/icons/pencil-grey.svg',
                color: myGreen,
              )
            ],
          ),
          leading: Container(
              padding: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                  border: Border(right: BorderSide(width: 1, color: myGrey))),
              child: SvgPicture.asset('assets/icons/${widget.icon}')),
        ),
      ),
    );
  }
}
