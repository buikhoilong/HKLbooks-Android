import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hkl_books/config.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton({
    Key? key,
    required this.icon,
    required this.name,
    required this.navigateTo,
  }) : super(key: key);
  final String icon, name;
  final Widget navigateTo;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        tileColor: myGreyBG,
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigateTo))
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            const Icon(
              Icons.chevron_right,
              color: myGreen,
            )
          ],
        ),
        leading: SvgPicture.asset('assets/icons/$icon'),
      ),
    );
  }
}
