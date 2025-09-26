import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  const SettingsPage({super.key, required this.onToggleTheme, required this.themeMode});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDark;

  @override
  void initState() {
    super.initState();
    _isDark = widget.themeMode == ThemeMode.dark;
  }

  void _onSwitchChanged(bool value) {
    setState(() => _isDark = value);
    // chama a função que está no MyApp para alternar o tema
    widget.onToggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Tema escuro'),
              value: _isDark,
              onChanged: _onSwitchChanged,
              secondary: const Icon(Icons.brightness_3),
            ),

            const SizedBox(height: 20),

            // opcional: botão pra voltar
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Voltar'),
            ),
            const SizedBox(height: 400),
            Text("Mathias E. Polaquin"),
            const SizedBox(height: 8),
            Text("Matricula: 203259"),
            const SizedBox(height: 8),
            Text("Analise e Desenvolvimento de Sistemas"),
          ],
        ),
      ),
    );
  }
}
