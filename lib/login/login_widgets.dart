import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginWidgets extends StatelessWidget {
  const LoginWidgets({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      ElevatedButton.icon(
          onPressed: () async {
            if (await launchUrlString("https://www.facebook.com/")) {
              launchUrlString("https://www.facebook.com/");
            } else {
              print('Could not launch '); // Add this line for debugging
              // You can handle the error in your app, e.g., show an error message to the user.
            }
          }, icon: Icon(Icons.facebook_rounded,color:Colors.white,), 
          label: Text("Facebook"),
          style: ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            backgroundColor: Color(0XFF2A2C38),
          ),    
                  
      ),
       ElevatedButton.icon(
          onPressed: () async {
            
             if (await launchUrlString("https://myaccount.google.com/")) {
              await canLaunchUrlString("https://myaccount.google.com/");
            } else {
              print('Could not launch '); // Add this line for debugging
              // You can handle the error in your app, e.g., show an error message to the user.
            }
          },
           icon: Icon(Icons.g_mobiledata_sharp,color:Colors.white,), 
          label: Text("Google"),
          style: ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            backgroundColor: Color(0XFF2A2C38),
          ),    
                  
      ),
      
      ],
    );
  }
}


