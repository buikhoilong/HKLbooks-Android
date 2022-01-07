import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hkl_books/config.dart';

class EditButton extends StatefulWidget {
  const EditButton({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);
  final String icon, name;

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  TextEditingController editedValue = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editedValue = new TextEditingController();
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
                children: const [
                  TextField(
                      //controller: editedValue,
                      ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Loading...",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      )),
                  SizedBox(
                    height: 15,
                  ),
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
            showDialogEdit(context, 'Đổi');
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
