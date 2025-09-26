import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/container_all.dart';
import 'package:projeto_final_flutter/field_form.dart';
import 'package:projeto_final_flutter/user.dart';
import 'package:projeto_final_flutter/user_provider.dart';
import 'user_provider.dart';


class UserView extends StatelessWidget {
  UserView({super.key});
  String title = "Ver Usuário";

//guarda a informação de cada campo no formulario
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {

    UserProvider userProvider = UserProvider.of(context) as UserProvider;//acesso a todos os usuarios

    int? index;
    if(userProvider.indexUser != null){//se for diferente de nulo ele guarda as informações preenchidas
      index = userProvider.indexUser;//dados que ja existem
      controllerName.text = userProvider.userSelected!.name;//vai ser adicionado um em cada campo
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;
      controllerPhone.text = userProvider.userSelected!.phone;

    }

    return Scaffold( //Scaffold n tem child
    appBar: AppBar(
      title: Text(this.title),
      actions: [
        Container(
          child: TextButton(
            child: Text('Lista de Usuários'),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/list");
            },
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(173, 173, 215, 238),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          margin: EdgeInsets.all(10),
        )
      ],
    ),
      body: ContainerAll(
        child: Center(
          child: Column(
            children: [
              FieldForm(
                label: 'Nome', 
                isPassword: false, 
                controller: controllerName,
                isForm: false,
                isEmail: false,
              ),
              FieldForm(
                label: 'Email', 
                isPassword: false, 
                controller: controllerEmail,
                isForm: false,
                isEmail: false,
              ),
              FieldForm(
                label: 'Telefone',
                isPassword: false,
                controller: controllerPhone,
                isForm: false,
                isEmail: false,
              ),
              FieldForm(
                label: 'Senha', 
                isPassword: false, 
                controller: controllerPassword,
                isForm: false,
                isEmail: false,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (){
                    Navigator.popAndPushNamed(context, "/create");
                  }, 
                  child: Text('Editar'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(123, 173, 122, 221)),
                    foregroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 229, 225, 225)),
                  )
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (){
                    userProvider.indexUser = null;
                    userProvider.users.removeAt(index!);
                    Navigator.popAndPushNamed(context, "/create");
                  }, 
                  child: Text('Deletar'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(146, 244, 67, 54)),
                    foregroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 229, 225, 225)),
                  )
                ),
              )
            ]
          )
        ),
      ),
    );
  }
}