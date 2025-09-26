import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/login_page.dart';
import 'package:projeto_final_flutter/user_form.dart';
import 'package:projeto_final_flutter/user_list.dart';
import 'package:projeto_final_flutter/user_provider.dart';
import 'package:projeto_final_flutter/user_view.dart';
import 'package:projeto_final_flutter/splash_page.dart';
import 'package:projeto_final_flutter/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

    void _toggleTheme(){
      setState((){
        _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      });
    }

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        title: 'Trabalho final CRUD',
        theme: ThemeData(//o ThemeData é a classe usada para definir o tema visual da sua aplicação, Ele controla cores, fontes,estilos de botões, icones espaçamento e outros aspectos visuais
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(173, 0, 196, 186)),
          //brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          //brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 5, 0, 63)),
        ),
        themeMode: _themeMode,//aplica o tama atual
        home: const SplashPage(), //aqui faz com que a tela inicial seja sempre a tela de login
        routes:{
          "/create":(_) => UserForm(),
          "/list":(_) => UserList(),
          "/view": (_) => UserView(),
          "/login": (_) => const LoginPage(),
          "/settings":(_) => SettingsPage(
            onToggleTheme: _toggleTheme, 
            themeMode: _themeMode
          ),//lista de usuario
        },
      ),
    );
  }
}