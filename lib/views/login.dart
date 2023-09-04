import 'package:flutter/material.dart';
import 'package:iti_project/views/home.dart';
import 'package:iti_project/views/loginwidger.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

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
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover)),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 120,
                      width: 160,
                      child: Image.asset("assets/images/logo.png")),
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
                  Row(
                    children: [
                      Text(
                        "",
                      ),
                    ],
                  ),
                  Container(
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value ?? "");
                        if (emailValid == false) {
                          return "Your Email isn't correct";
                        }

                        if (value!.isEmpty) {
                          return "The Field is empty";
                        } else if (value.length < 11) {
                          return "Your Email must contain 15 characters";
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
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .0001,
                  ),
                  Row(
                    children: [
                      Text(
                        "",
                      ),
                    ],
                  ),
                  Container(
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Password can't be less than 6 digits";
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
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forget Password?",
                        style: TextStyle(
                            color: Color(0xFFE8E5F8),
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    width: 140,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        setState(() {});
                      },
                      child: Text("Login"),
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

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
          height: height * .08,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xFF4023D7),
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            buttonText,
            style: TextStyle(
                color: Color(0xFFE8E5F8),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
