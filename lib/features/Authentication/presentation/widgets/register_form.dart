import 'package:adopt_my_pet_dz/core/shared/colors.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/pages/initialisation_page.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/widgets/container_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RegisterForm extends StatelessWidget {
  String email = "";
  String password = "";
  String passwordConfirm = "";
  String displayName = "";
  String error = "";
  var _keyForm = GlobalKey<FormState>();
  RegisterForm({this.email, this.error, this.displayName});

  @override
  Widget build(BuildContext context) {
    globalSizeClass.recalcuate(MediaQuery.of(context));
    return Column(
      children: <Widget>[
        SizedBox(
          height: 18,
        ),
        Text(
          "Adopt My Pet",
          style: TextStyle(
              color: Colors.black, fontFamily: "Impact", fontSize: 31),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "assets/app/logo.png",
            height: 180,
            width: 180,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Create a New Account ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: "Trebuchet",
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Form(
          key: _keyForm,
          child: Column(
            children: <Widget>[
              //! Email Box
              containerInput(
                  icon: Icons.email,
                  textfield: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: writeColor,
                      fontFamily: "Trebuchet",
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        hintText: "Email",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none),
                    initialValue: email == null ? "" : email,
                    onChanged: (value) => email = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "An email must be provided";
                      } else {
                        return null;
                      }
                    },
                  ),
                  helpTooltip:
                      "The email is is your electronic letter box . You can change it later"),
              SizedBox(
                height: 20.5,
              ),

              //! Username Box
              containerInput(
                  icon: Icons.format_bold,
                  textfield: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: writeColor,
                      fontFamily: "Trebuchet",
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      hintText: "Username",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    initialValue: displayName == null ? "" : displayName,
                    onChanged: (value) => displayName = value,
                    validator: (value) {
                      if (value.isEmpty || value.length < 8) {
                        return "Type a correct username";
                      } else {
                        return null;
                      }
                    },
                  ),
                  helpTooltip:
                      "The username is your name show when in your profile . You can change it later"),
              SizedBox(
                height: 15.0,
              ),

              //! Password Box
              containerInput(
                  icon: Icons.lock,
                  textfield: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: writeColor,
                      fontFamily: "Trebuchet",
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      hintText: "Password",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    initialValue: " ",
                    onChanged: (value) => password = value,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty || value.length < 8) {
                        return "Type a correct password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  helpTooltip:
                      "The Password must be more than 8 caracters . It has to be secure ! "),
              SizedBox(
                height: 18,
              ),

              //! Password Confirmation Box
              containerInput(
                  //TODO Personal Logo of a lock confirmation
                  icon: Icons.lock,
                  textfield: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: writeColor,
                      fontFamily: "Trebuchet",
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      hintText: "Confirm Password",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) => passwordConfirm = value,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty || value.length < 8) {
                        return "Type a correct password";
                      } else if (value != password) {
                        return "The passwords are not equal ! ";
                      } else {
                        return null;
                      }
                    },
                  ),
                  helpTooltip: "The Passwords must be identical ! "),
              SizedBox(
                height: 22,
              ),
              error == null
                  ? Container()
                  : Text(
                      error,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Trebuchet",
                          color: Colors.red),
                    ),
              SizedBox(
                height: 10,
              ),
              ButtonTheme(
                buttonColor: mainColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: mainColor, width: 1.0),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                minWidth: globalSizeClass.containerWidth,
                height: globalSizeClass.containerHeight,
                child: RaisedButton(
                  child: Text(
                    'Rgister',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Trebuchet",
                    ),
                  ),
                  onPressed: () async {
                    if (_keyForm.currentState.validate()) {
                      BlocProvider.of<RegisterBloc>(context).add(RegisterEvent(
                          email: email,
                          password: password,
                          displayName: displayName));
                    }
                  },
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Already Have an Account ? ",
                style: TextStyle(
                  color: writeColor,
                  fontFamily: "Trebuchet",
                ),
              ),
              SizedBox(
                height: 2,
              ),
              ButtonTheme(
                buttonColor: Color(0xFF74A2FF),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: mainColor, width: 1.0),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                minWidth: globalSizeClass.containerWidth,
                height: globalSizeClass.containerHeight,
                child: RaisedButton(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Trebuchet",
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InitialisationPage()));
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
