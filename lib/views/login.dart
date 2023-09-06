import 'package:flutter/material.dart';
import 'package:iti_project/views/home.dart';
import 'package:iti_project/views/login_widgets.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xFFE8E5F8),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 120),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/images/logo.png"),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Text(
                  "Login To Your Account",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFFE8E5F8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value ?? "");
                    if (emailValid == false) {
                      return "Please enter your vaild email";
                    }
                    if (value!.isEmpty) {
                      return "Your Email is empty";
                    } else if (value.length < 19) {
                      return "Your email must be greater than 19 ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF22242E),
                    label: Text(
                      "Email",
                      style: TextStyle(
                        color: Color(0xFFC4C4C4).withOpacity(0.2),
                        fontSize: 16,
                      ),
                    ),
                    hintText: "Email",
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.length < 5) {
                      return "Password must be greater than 5";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF22242E),
                    label: Text(
                      "Password",
                      style: TextStyle(
                        color: Color(0xFFC4C4C4).withOpacity(0.2),
                        fontSize: 16,
                      ),
                    ),
                    hintText: "Password",
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Or Continue With",
                        style: TextStyle(
                            color: Color(0xFFE8E5F8),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                LoginWidgets(),
                SizedBox(
                  height: height * .02,
                ),
                InkWell(
                  onTap: () {
                    _formKey.currentState!.validate();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(16),
                    elevation: 10,
                    child: Container(
                      alignment: Alignment.center,
                      height: height * .06,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFF4023D7),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color(0xFFE8E5F8),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forget your Password?",
                      style: TextStyle(
                          color: Color(0xFFE8E5F8),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
