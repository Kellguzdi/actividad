import 'package:flutter/material.dart';

class RecoveryPassword extends StatefulWidget {
  const RecoveryPassword({ super.key });

  @override
  // ignore: library_private_types_in_public_api
  _RecoveryPasswordState createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recovery Pass'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                    label: Text('Contraseña')
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Contraseña')
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context,'/');
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.amber[500],
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Guardar')
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