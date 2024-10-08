import 'package:actividad/widgets/recovery_password.dart';
import 'package:actividad/widgets/send_email.dart';
import 'package:actividad/widgets/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:actividad/widgets/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/send-email':(context) =>  const Login(),
        '/verify-code':(context) =>  const SendEmail(),
        '/':(context) =>  const VerifyEmail(),
        '/save':(context) =>  const RecoveryPassword(),

      },
    );
  }
}
