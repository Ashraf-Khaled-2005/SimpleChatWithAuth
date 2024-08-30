import 'package:chatapp/screen/Login.dart';
import 'package:chatapp/screen/Signup.dart';
import 'package:chatapp/screen/chat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

// 26425c
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SignUpPage.id: (context) => SignUpPage(),
          LoginPage.id: (context) => LoginPage(),
          ChatPage.id: (context) => ChatPage()
        },
        home: LoginPage());
  }
}
