import 'dart:ffi';

import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateCode(String? value) {
    // Verifica si el campo está vacío
    if (value == null || value.isEmpty) {
      return 'El código no puede estar vacío';
    }

    // Verifica que el campo tenga exactamente 6 dígitos
    if (value.length != 6) {
      return 'El código debe tener exactamente 6 dígitos';
    }

    // Verifica que solo contenga números
    final isNumeric = RegExp(r'^[0-9]+$');
    if (!isNumeric.hasMatch(value)) {
      return 'El código solo debe contener números';
    }

    // Si pasa todas las validaciones, regresa null
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify email'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
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
                        label: Text('Código de verificación')),
                    validator: validateCode,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    height: 49,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/save');
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.amber[500],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0))),
                        child: const Text('Verificar código')),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
