import 'package:flutter/material.dart';
import 'package:greenfarmer/view/widgets/app_text.dart';


class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key, this.homeScreen=false, this.title});
  final bool homeScreen;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(

      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, size: 25,),
          ),
          Spacer(),
          AppText(text: title??"GREEN FARMER", fontWeight: FontWeight.bold, fontSize: 20, ),
          Spacer(),
          if(homeScreen)
          Icon(Icons.notifications_none_outlined, size: 30,),
          if(homeScreen)
          SizedBox(width: 10,)
        ],
      ),
    );
  }
}
