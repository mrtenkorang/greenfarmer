import 'package:flutter/material.dart';
import 'package:greenfarmer/view/widgets/app_text.dart';


class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(

      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Container(),
          Spacer(),
          AppText(text: "GREEN FARMER", fontWeight: FontWeight.bold, fontSize: 20, ),
          Spacer(),
          Icon(Icons.notifications_none_outlined, size: 30,),
          SizedBox(width: 10,)
        ],
      ),
    );
  }
}
