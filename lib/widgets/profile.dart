import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
const Profile({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width:double.infinity,
              height:48,
              child: ElevatedButton(
                onPressed: () async => await FirebaseAuth.instance.signOut(),
                child:const Text("Cerrar sesión")
              )
            )
          ],
        )
      )
    );
  }
}