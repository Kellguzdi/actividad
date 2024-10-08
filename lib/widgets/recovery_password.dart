import 'package:flutter/material.dart';

class RecoveryPassword extends StatefulWidget {
  const RecoveryPassword({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RecoveryPasswordState createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

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
        title: const Text('Recovery Pass'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                obscureText: _isObscure,
                decoration: const InputDecoration(label: Text('Contraseña')),
                controller: _passwordController,
                validator: validatePassword,                
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                obscureText: _isObscure,
                decoration:InputDecoration(
                  label: const Text('Repetir Contraseña'),
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(()=> _isObscure =!_isObscure);
                    }, 
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off)
                  )
                ),
                controller: _repeatPasswordController,
                validator: (value) => validateConfirmPassword(_passwordController.text, _repeatPasswordController.text),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        Navigator.pushNamed(context, '/');
                      }                      
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.amber[500],
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Guardar')),
              )
            ],
          )),
        ),
      ),
    );
  }
}
