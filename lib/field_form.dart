import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FieldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller;
  bool? isForm = true; //? significa que não é obrigatório
  bool isEmail = false;

  FieldForm({
    required this.label,
    required this.isPassword,
    required this.controller,
    this.isForm,
    required this.isEmail,// com o required se torna obrigatório
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: this.isForm,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(46, 184, 228, 237),//aqui seta a cor de fundo do formulario nome,email,senha
        labelText: label
      ),
      validator: (value){
        if(value!.length < 5){
          return "Digite ao menos 5 caracteres"; //valida se o campo digitado tem mais do que 5 caracteres
        }
        if(this.isEmail && !value.contains("@")){//valida se é um email vendo se NÃO tem o @
          return'Digite o Email corretamente';
        }
      },
    );
  }
}