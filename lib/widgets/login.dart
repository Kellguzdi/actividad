import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su contraseña';
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
                          validator: validatePassword,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, '/profile');
                                  try {
                            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,                  
                            );
                            print(credential);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
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
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text(
                            'Registrarse',
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
