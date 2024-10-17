import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  bool _isObscure = true;
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
    // Verifica si el campo está vacío
    if (value == null || value.isEmpty) {
      return 'La contraseña no puede estar vacía';
    }

    // Verifica que no tenga caracteres especiales, solo letras y números
    final isValidPassword = RegExp(r'^[a-zA-Z0-9]+$');
    if (!isValidPassword.hasMatch(value)) {
      return 'La contraseña no puede contener caracteres especiales';
    }

    // Si pasa todas las validaciones, regresa null
    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    // Verifica que ambas contraseñas coincidan
    if (password != confirmPassword) {
      return 'Las contraseñas no coinciden';
    }

    // Si coinciden, regresa null
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registrate'),
          centerTitle: true,
          backgroundColor: Colors.pink,
          titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Image.asset('assets/logo.png', width: 200, height: 200),
                      Form(
                          key: _formKey,
                          child: Column(children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                  label: Text('Correo electrónico')),
                              keyboardType: TextInputType.emailAddress,
                              validator: validateEmail,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _isObscure,
                              decoration: const InputDecoration(
                                label: Text('Contraseña'),
                              ),
                              validator: validatePassword,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                                controller: _confirmController,
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                    label: const Text('Confirmar Contraseña'),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                        icon: Icon(_isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off))),
                                validator: (value) => validateConfirmPassword(
                                    _passwordController.text,
                                    _confirmController.text)),
                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      try {
                                        final credential = await FirebaseAuth
                                            .instance
                                            .createUserWithEmailAndPassword(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        );
                                        print(credential);
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'user-not-found') {
                                          print(
                                              'No user found for that email.');
                                        } else if (e.code == 'wrong-password') {
                                          print(
                                              'Wrong password provided for that user.');
                                        }
                                      }
                                    }
                                  },
                                  style: const ButtonStyle(),
                                  child: const Text('Crear cuenta')),
                            ),
                          ]))
                    ])))));
  }
}
