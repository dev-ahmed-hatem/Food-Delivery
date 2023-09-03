import 'package:flutter/material.dart';

class LoginWidgets extends StatelessWidget {
  const LoginWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BuildButton(iconImage: Image(
          height: 20,
          width: 20,
          image: AssetImage("assets/images/icon4.jpg")),
          TextButton: "Facebook",
          ),
         BuildButton(iconImage: Image(
          height: 20,
          width: 20,
          image: AssetImage("assets/images/icon2.png")),
          TextButton: "Google",
          ),
      ],
    );

  }
}

class BuildButton extends StatelessWidget {
  final Image iconImage;
  final String TextButton;
  BuildButton({required this.iconImage,required this.TextButton });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * .05,
      width: width *.36,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
      border: Border.all(color:Color(0xFF2A3857) ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        iconImage,
        SizedBox(width: 5,),
        Text(TextButton,style: TextStyle(
          color:Color(0xFFE8E5F8),fontSize: 16, 
          fontWeight: FontWeight.bold),),
      ],),
    );
  }
}