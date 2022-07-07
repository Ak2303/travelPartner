import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_partner/misc/colors.dart';
import 'package:travel_partner/widget/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  String? text;
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.isResponsive = false, this.width, this.text = "Button"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(text: (isResponsive == true) ? text! : "", color: Colors.white,),
          Image.asset("img/button-one.png"),
        ],
      ),
    );
  }
}
