import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hkl_books/config.dart';

class EditButton extends StatefulWidget {
  const EditButton({
    Key? key,
    required this.icon,
    required this.name,
    required this.title,
  }) : super(key: key);
  final String icon, name, title;

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  TextEditingController editedValue = TextEditingController();
  @override
  void initState() {
    editedValue = TextEditingController();
    super.initState();
  }

  void showDialogEdit(context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 18,
                letterSpacing: 0.5,
              )),
          actions: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  TextField(
                    controller: editedValue,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Cập nhật')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Hủy')),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
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
            showDialogEdit(context, 'Cập nhật ${widget.title}');
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
