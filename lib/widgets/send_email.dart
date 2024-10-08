import 'package:flutter/material.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sendEmail'),
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
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 48,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Correo electronico')
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context,'/verify-code');
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.amber[400],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      )
                    ),
                    child: const Text('Enviar Código')
                  ),                  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
