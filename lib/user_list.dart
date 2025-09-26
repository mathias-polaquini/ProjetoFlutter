import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/container_all.dart';
import 'package:projeto_final_flutter/user.dart';
import 'package:projeto_final_flutter/user_provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    List<User> users = userProvider.users;

    int usersLength = users.length;

    //Scaffold é tipo o esqueleto da aplicação
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        leading: BackButton(
          onPressed: (){
            userProvider.indexUser = null;
            Navigator.popAndPushNamed(context, "/create");
          },
        ),
      ),
      body: ContainerAll(
        child: ListView.builder(
            itemCount: usersLength,
          itemBuilder: (BuildContext contextBuilder, indexBuilder) =>
            Container( //coloca nesse container cada item da lista ou seja cada usuario
              child:  ListTile(
                title: Text(users[indexBuilder].name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: (){
                        userProvider.userSelected = users[indexBuilder];
                        userProvider.indexUser = indexBuilder;
                        Navigator.popAndPushNamed(context, "/create");
                      },
                      icon: Icon(Icons.edit)// o icone da canetinha
                    ),
                    IconButton(
                      onPressed: (){
                        userProvider.userSelected = users[indexBuilder];
                        userProvider.indexUser = indexBuilder;
                        Navigator.popAndPushNamed(context, "/view");
                      },
                      icon: Icon(Icons.visibility, color: const Color.fromARGB(175, 33, 149, 243),)// o icone da canetinha
                    ),
                    IconButton(
                      onPressed: (){
                        userProvider.indexUser = null;
                        userProvider.users.removeAt(indexBuilder);
                        Navigator.popAndPushNamed(context, "/create");
                      },
                      icon: Icon(Icons.delete, color: const Color.fromARGB(190, 254, 119, 9),)// o icone da canetinha
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1))
              ),
            )
        ),
      ),
    );
  }
}