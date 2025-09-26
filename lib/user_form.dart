import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/container_all.dart';
import 'package:projeto_final_flutter/field_form.dart';
import 'package:projeto_final_flutter/user.dart';
import 'package:projeto_final_flutter/user_provider.dart';
import 'user_provider.dart';


class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserForm();
}

class _UserForm extends State<UserForm> {
  String title = "Criar Usuario";

//guarda a informação de cada campo no formulario
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
	TextEditingController controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {

    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    int? index;
    if(userProvider.indexUser != null){//se for diferente de nulo ele guarda as informações preenchidas
      index = userProvider.indexUser;//dados que ja existem
      controllerName.text = userProvider.userSelected!.name;
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;
			controllerPhone.text = userProvider.userSelected!.phone;

      setState(() {
        this.title = "Edit User";//aqui muda a escrita do titulo no AppBar
      });
    }

    GlobalKey<FormState> _key = GlobalKey();

    void save(){
      final isValidate = _key.currentState?.validate();

      if(isValidate == false){
        return;
      }

      _key.currentState?.save();

      //instancia da classe user um novo usuario
      User user = User(
        name: controllerName.text,
        email: controllerEmail.text,
        password: controllerPassword.text,
				phone: controllerPhone.text,
      );
      if(index != null){
        //editar
        userProvider.users[index] = user;
      }else{
        int usersLength = userProvider.users.length;

        //salva um novo usuario
        userProvider.users.insert(usersLength,user);
      }
      //navega para a lista dos usuarios
      Navigator.popAndPushNamed(context, "/list");
    }

    return Scaffold( //Scaffold n tem child
    appBar: AppBar(
      title: Text(this.title),
      actions: [
        Container(//botão pra ver os usuarios cadastrados
          child: TextButton(
            child: Text('Lista de Usuários'),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/list");
            },
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(102, 176, 205, 236),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          margin: EdgeInsets.all(10),
        )
      ],
    ),
      body: ContainerAll(
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              children: [
                FieldForm(
                  label: 'Nome', 
                  isPassword: false, 
                  controller: controllerName,
                  isEmail: false,
                ),
                FieldForm(
                  label: 'Email', 
                  isPassword: false, 
                  controller: controllerEmail,
                  isEmail: true,
                ),
								FieldForm(
									label: 'Telefone',
									isPassword: false,
									controller: controllerPhone,
									isEmail: false,
								),
                FieldForm(
                  label: 'Senha', 
                  isPassword: true, 
                  controller: controllerPassword,
                  isEmail: false,
                ),
								const SizedBox(height: 10),
                SizedBox( 
                  width: double.infinity,
                  child: TextButton(
                    onPressed: save, 
                    child: Text('Salvar'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(146, 93, 123, 244)),
                      foregroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 229, 225, 225)),
                    )
                  ),
                ),
              ]
            ),
          )
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 48,
    
          child: ElevatedButton.icon(
            onPressed: () {
        // navega para a tela de configurações
              Navigator.pushNamed(context, "/settings");
            },
            icon: const Icon(Icons.settings),
            label: const Text("Configurações"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48), // botão com altura consistente
            ),
          ),
        ),
      ),
    );
  }
}