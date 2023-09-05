import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;
  late Color myColor;
  late Size mediaSize;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;
  @override
  Widget build(BuildContext context) {
    ThemeData(primaryColor: Colors.deepPurple);
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return MaterialApp(
      locale: const Locale("ar"),
      //localizationsDelegates: AppLocalizations.localizationsDelegates,
     // supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(fontFamily: "BentonSnas"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: backgroundColor,
        body: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              Positioned(top: 10, child: _buildTop()),
              SizedBox(
                height: 10,
              ),
              Text(
                "SIGN UP FOR FREE",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Positioned(bottom: 0, child: _buildBottom()),
            ]),
          ),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background1.png"),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
        width: mediaSize.width,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset("assets/images/logo.png"),
          )
        ]));
  }

  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text("Enter your name",style: TextStyle(
                        color: Color(0xFFC4C4C4).withOpacity(0.2),
                        fontSize: 16,
                      ),),
                hintText: "Enter your name",
                filled: true,
                fillColor: Color(0xFF22242E),
                icon: Icon(Icons.person,color: Colors.white,),
                  contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text("Email",style: TextStyle(
                        color: Color(0xFFC4C4C4).withOpacity(0.2),
                        fontSize: 16,
                      ),),
                hintText: "Email",
                filled: true,
                fillColor: Color(0xFF22242E),
                icon: Icon(Icons.email, color: Colors.white),
                 border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      _obscureText = !_obscureText;
                      //setState(() {});
                    },
                    child: Icon(_obscureText
                        ? Icons.remove_red_eye
                        : CupertinoIcons.eye_slash)),
                filled: true,
                fillColor:Color(0xFF22242E),
                label: Text("Paasword",style: TextStyle(
                        color: Color(0xFFC4C4C4).withOpacity(0.2),
                        fontSize: 16,
                      ),),
                hintText: "password",

                icon: Icon(Icons.lock,color: Colors.white),
                 border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),

              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 180,
            height: 50,
            child: ElevatedButton(
              
                style:ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            backgroundColor: Color(0XFF2A2C38),
          ),
                onPressed: () {
                 // Navigator.push(
                   // context,
                    //MaterialPageRoute(builder: (context) => Loginpage()),
                  //);

                  StepState() {}
                },
                child: Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white,),
                )),
          ),
        ]),
      ),
    );
  }

  /* Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        )),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Create an Account",
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.w500),
        ),
        _buildGreyText("Sign up to continue"),
        const SizedBox(height: 45),
        Text("your name",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            )),
        SizedBox(height: 5),
        Container(
          child: TextFormField(
            decoration: InputDecoration(
              //label: Text("Your name"),
              hintText: "Enter your name",
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
        ),
        SizedBox(height: 25),
        Text("your phone",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            )),
        SizedBox(height: 5),
        Container(
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              //label: Text("Your name"),
              hintText: "Enter your phone",
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
        ),
        Text("your email",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            )),
        SizedBox(height: 5),
        Container(
          child: TextFormField(
            decoration: InputDecoration(
              label: Text("Email"),
              hintText: "Enter your email",
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
        ),
        SizedBox(height: 25),
        Text(" password",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            )),
        SizedBox(height: 5),
        Container(
          child: TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                  onTap: () {
                    _obscureText = !_obscureText;
                    setState(() {});
                  },
                  child: Icon(_obscureText
                      ? Icons.remove_red_eye
                      : CupertinoIcons.eye_slash)),
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            debugPrint("Email : ${emailController.text}");
            debugPrint("Password : ${passwordController.text}");
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 20,
            shadowColor: myColor,
            minimumSize: const Size.fromHeight(60),
          ),
          child: const Text("LOGIN"),
        )
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }*/
}





















































/*
  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {}, child: _buildGreyText(" forgot your password?"))
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email : ${emailController.text}");
        debugPrint("Password : ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("LOGIN"),
    );
  }
}*/

