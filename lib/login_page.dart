import 'package:flutter/material.dart';
import 'auth.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _errorMessage;

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (AuthLocal.validate(username, password)) {
      Navigator.pushReplacementNamed(context, "/create");
    } else {
      setState(() {
        _errorMessage = "Usuário ou senha inválidos!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // campo usuário
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "Usuário",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite o usuário";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField( //
                controller: _passwordController,
                obscureText: true, // sempre escondida
                decoration: const InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite a senha";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // mensagem de erro
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),

              const SizedBox(height: 16),

              // botão entrar
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
                },
                child: const Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
