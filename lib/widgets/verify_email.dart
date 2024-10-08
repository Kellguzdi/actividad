import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
const VerifyEmail({ super.key });

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify email'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(          
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo2.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 48,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Código de verificación')
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  height: 49,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,'/save');
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.amber[500],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)
                      )
                    ),
                    child: const Text('Verificar código')
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}