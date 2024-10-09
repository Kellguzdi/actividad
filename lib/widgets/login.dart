import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? validateEmail(String? value) {
    // Expresión regular para validar un correo electrónico
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null; // Si es válido, no devuelve ningún error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                        Image.asset('assets/logo2.png',
                            width: 200, height: 200),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                                hintText: 'Correo Electronico',
                                label: Text('Correo')),
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                              hintText: 'Contraseña',
                              label: const Text('Contraseña'),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(
                                      () => _isObscure = !_isObscure,
                                    );
                                  },
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, '/send-email');
                                  print(
                                      "Datos : ${_emailController.text} ${_passwordController.text}");
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.pink,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  )),
                              child: const Text('Iniciar Sesion')),
                        ),
                        TextButton(
                          onPressed: () {
                          // Navegar a la pantalla de recuperación de contraseña                            
                            Navigator.pushNamed(context, '/save');
                          },
                          child: const Text(
                            'Recuperar contraseña',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black
                            ),
                          ),
                        )
                      ])))),
    );
  }
}
