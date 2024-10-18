
import 'package:actividad/firebase_options.dart';
import 'package:actividad/widgets/create_account.dart';
import 'package:actividad/widgets/profile.dart';
import 'package:actividad/widgets/recovery_password.dart';
import 'package:actividad/widgets/send_email.dart';
import 'package:actividad/widgets/splash_screen.dart';
import 'package:actividad/widgets/verify_email.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:actividad/widgets/login.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
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
        '/': (context) => const SplashScreen(),
        '/login':(context) =>  const Login(),
        '/send-email':(context) =>  const SendEmail(),
        '/verify-code':(context) =>  const VerifyEmail(),
        '/save':(context) =>  const RecoveryPassword(),
        '/profile':(context) =>  const Profile(),
        '/register':(context) =>  const CreateAccount(),
      },
    );
  }
}
