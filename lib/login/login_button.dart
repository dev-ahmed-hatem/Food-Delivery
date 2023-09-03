import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
   final String buttonText;
   LoginButton({required this.buttonText});
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: () {
                    _formKey.currentState!.validate();
      },
      child: Material(
         borderRadius: BorderRadius.circular(16),
                      elevation: 10,
        child: Container(
          alignment: Alignment.center,
          height:height* .08,
          width: double.infinity,
          decoration: BoxDecoration(
          color: Color(0xFF4023D7),
         borderRadius: BorderRadius.circular(16)),
          child: Text(
            buttonText,
            style: TextStyle(color: Color(0xFFE8E5F8),fontSize: 20,fontWeight: FontWeight.bold),
      
          ),
       
      
                          
      
        ),
      ),
    );
  }
}