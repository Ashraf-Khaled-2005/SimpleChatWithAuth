import 'dart:developer';

import 'package:chatapp/screen/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat.dart';
import 'widget/buttom.dart';
import 'widget/sncak.dart';
import 'widget/textfield.dart';

class SignUpPage extends StatefulWidget {
  static String id = "signup";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    String? email, pass;
    bool isloading = false;
    GlobalKey<FormState> key = GlobalKey();
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: const Color(0xff26425c),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  Image.asset("assets/images/scholar.png"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Scolar Chat",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Pacifico",
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Customtextfield(
                    onChanged: (p0) {
                      email = p0;
                    },
                    hint: "Enter your Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Customtextfield(
                    hint: "Enter your Password",
                    onChanged: (p0) {
                      pass = p0;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtom(
                    text: "SignUp",
                    onTap: () async {
                      if (key.currentState!.validate()) {
                        try {
                          isloading = true;
                          setState(() {});
                          await Register(email, pass);
                          Snackbar(context, "success");
                          Navigator.of(context)
                              .pushNamed(ChatPage.id, arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            Snackbar(
                                context, "The password provided is too weak.");
                          } else if (e.code == 'email-already-in-use') {
                            Snackbar(context,
                                "The account already exists for that email.");
                          }
                        } catch (e) {
                          Snackbar(context, e.toString());
                        }
                        isloading = false;
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already Have an account  ",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(LoginPage.id);
                          },
                          child: const Text("Login",
                              style: TextStyle(fontSize: 24)))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> Register(String? email, String? pass) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: pass!,
    );
  }
}
