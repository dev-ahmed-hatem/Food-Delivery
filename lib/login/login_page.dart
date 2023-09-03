import 'package:flutter/material.dart';
import 'package:last_project/login/login_button.dart';
import 'package:last_project/login/login_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
String icon1 = "assets/images/icon1.png";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Color(0xFFE8E5F8),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
         decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background1.jpg"),
                  fit: BoxFit.cover)
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                        height: 150,
                        width: 150,
                        child: Image.asset("assets/images/logo1.png")
                      ),
                     SizedBox(height:height *.02 ,),
                  
                     Text("Login To Your Account",
                     style: TextStyle(fontSize: 30,
                     color: Color(0xFFE8E5F8),
                     fontWeight: FontWeight.bold, 
                     ),),
                       SizedBox(height:height *.05 ,),
                       Row(
                         children: [
                           Text("",),
                         ],
                       ),
                       Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF22242E),
                            label:Text("Email",style: TextStyle(color: Color(0xFFC4C4C4).withOpacity(0.2),fontSize: 16,),) ,
                            hintText:"Email",
                            contentPadding: EdgeInsets.all(15),
                             border:UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                                 
                               
                          ),
                  
                        ),),
                             SizedBox(height:height *.0001 ,),
                       Row(
                         children: [
                           Text("",),
                         ],
                       ),
                       Container(
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF22242E),
                            label:Text("Password",style: TextStyle(color: Color(0xFFC4C4C4).withOpacity(0.2),fontSize: 16,),) ,
                            hintText:"Password",
                            contentPadding: EdgeInsets.all(15),
                            border:UnderlineInputBorder(borderRadius: BorderRadius.circular(10)),                       
                          ),
                      ),),
                      SizedBox(height:height *.02 ,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text("Or Continue With", 
                            style: TextStyle(color: Color(0xFFE8E5F8),
                            fontSize: 15,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                       SizedBox(height:height *.02 ,),
                       LoginWidgets(),
                       SizedBox(height:height *.02 ,),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forget Password?",
                       style: TextStyle(color: Color(0xFFE8E5F8),
                       fontSize: 16,
                       fontWeight: FontWeight.normal ),),
                  ],
                ),
                SizedBox(height:height *.02 ,),
                LoginButton(
                  buttonText: "Login",
                ),
                SizedBox(height:height *.02 ,),
                   
                     
                  
                    ],),
                  ),
      )
    );
  }
}