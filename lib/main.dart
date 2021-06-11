import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:signup_login/config/palette.dart';

void main() {
  runApp(
    MaterialApp(
      home: SignUpLoginUI(),
    ),
  );
}


class SignUpLoginUI extends StatelessWidget {
  const SignUpLoginUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Signup Login UI",
        home: SignupLoginScreen(),
    );
  }
}
class SignupLoginScreen extends StatefulWidget{
  @override
  _SignupLoginScreenState createState() => _SignupLoginScreenState();

}

class _SignupLoginScreenState extends State<SignupLoginScreen> {
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
            // the stack is used to put widget on top of another
        Stack(
          children: [
            // this is used to position the widgets
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 60.0,
                      height: 60.0,),

                    Image.asset(
                      'images/logo.png',
                      width: 100.0,
                      height: 150.0,
                    ),

                    Text(
                      'News Block',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 150.0,
                    ),
                    Center(
                      child: Text(
                        'Everything You Want to Know',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 150.0,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                height: 500,
                width: 350,
                decoration: BoxDecoration(
                  color: Palette.lightBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              if(isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(bottom: 3),
                                height: 2,
                                width: 20,
                                color: Palette.deepBlue,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Sign Up', style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold,
                                  color: isSignupScreen? Palette.deepBlue: Palette.lightTextColor,
                              ),),
                            ],),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              if(!isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(bottom: 3),
                                height: 2,
                                width: 20,
                                color: Palette.deepBlue,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Sign in', style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold,
                                  color: !isSignupScreen? Palette.deepBlue :  Palette.lightTextColor
                              ),),

                            ],),
                        )
                      ],),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 50.0),
                      child: Text(
                        'Email',
                        textAlign: TextAlign.left,
                        style: TextStyle(

                        color: Palette.lightTextColor,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            // the crossAxisAlignment is used to align all column elements from start
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // this container is for the email field. The container
                              // was added to style the textfield using the BoxDocoration
                              // property of the container
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                          ),
                                child: buildTextField('kangbreder@gmail.com', false, true),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // this is for the text 'Passsword'
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Password',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Palette.lightTextColor,
                                  ),
                                ),
                              ),
                              // this container is for the password field. The container
                              // was added to style the textfield using the BoxDocoration
                              // property of the container.
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child:  buildTextField('jesusgirl.123', true, false),
                              ),
                               SizedBox(
                                 height: 50,
                               ),
                              // the docorated box is to enhance the style of the button
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Palette.deepBlue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // this is for the submit button
                                child: FlatButton(
                                  minWidth: 350,
                                     onPressed: () {
                                       print('Received click');
                                     },
                                     child: const Text('Submit', style: TextStyle(
                                       color: Palette.lightBlue,
                                     ),),
                                   ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // This container widget is for the black horizontal line at the
                              // bottom of the screen.
                              Center(
                                child: Container(
                                  height: 5,
                                  width: 150,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

        )
    );
  }
// this method is for the text fields of email and password.
  Widget buildTextField(String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        // to render text field invisible at start
        obscureText: passwordVisible,
        keyboardType: isEmail? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(35))
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(35))
            ),
            contentPadding: EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: TextStyle( fontSize: 14, color: Palette.darkTextColor),
            // this is to add the eye icon at the end of password field only. When the eye icon toggles,
          // the text visibility toggles as well.
            suffixIcon:  isPassword? IconButton(
            icon: Icon(
          // Based on passwordVisible state choose the icon
          passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Palette.darkTextColor,
          ),
          onPressed: () {
    // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              passwordVisible = !passwordVisible;
            },);
          },
        ) : null,
          ),
      ),
    );
  }
}

