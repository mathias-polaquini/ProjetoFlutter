import 'package:flutter/cupertino.dart';
import 'package:projeto_final_flutter/user.dart';
//salvar os usuarios na variavel Users

class UserProvider extends InheritedWidget { //inheritedWidget carrega os dados para árvore interna dos widgets qualquer widget filho que precisa dos usuarios pode acessar
  final Widget child;//o child é quem vai receber os dados do userProvider
  List<User> users =[];//guarda os usuarios
  User? userSelected;// guarda um usuario especifico
  int? indexUser;//posição do usuario na lista

  UserProvider( //construtor da clase que exige que passe um child 
    {
      required this.child,
    }
  ): super(child: child);// pra saber quem é o filho que vai levar os dados

  static UserProvider? of(BuildContext context){// Permite que qualquer widget filho consiga pegar os dados do UserProvider
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();// a variavel context carrega esses dados
  }

  bool updateShouldNotify(UserProvider widget){//mudanças na lista de usuario atualiza os widgets
    return true;
  }
}