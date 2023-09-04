import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginWidgets extends StatelessWidget {
  const LoginWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () async {
            if (await launchUrlString("https://www.facebook.com/")) {
              launchUrlString("https://www.facebook.com/");
            } else {
              print('Could not launch '); // Add this line for debugging
              // You can handle the error in your app, e.g., show an error message to the user.
            }
          },
          child: const Image(
              height: 20,
              width: 60,
              image: AssetImage(
                  "assets/images/WhatsApp Image 2023-09-04 at 6.41.30 PM (1).jpeg")),
        ),
        ElevatedButton(
          onPressed: () async {
            if (await launchUrlString("https://myaccount.google.com/")) {
              await canLaunchUrlString("https://myaccount.google.com/");
            } else {
              print('Could not launch '); // Add this line for debugging
              // You can handle the error in your app, e.g., show an error message to the user.
            }
          },
          child: Image(
              height: 20,
              width: 60,
              image: AssetImage(
                  "assets/images/WhatsApp Image 2023-09-04 at 6.41.30 PM.jpeg")),
        ),
      ],
    );
  }
}

class BuildButton extends StatelessWidget {
  final Image iconImage;
  final String TextButton;
  BuildButton({required this.iconImage, required this.TextButton});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * .05,
      width: width * .36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF2A3857)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconImage,
          SizedBox(
            width: 5,
          ),
          Text(
            TextButton,
            style: TextStyle(
                color: Color(0xFFE8E5F8),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
