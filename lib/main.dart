import 'package:flutter/material.dart';

void main() {
  runApp(const MessageApp());
}

class MessageApp extends StatelessWidget {
  const MessageApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showedMessage = false;

  void _showMessage() {
    setState(() {
      _showedMessage = true;
    });
  }

  void _restartApp() {
    setState(() {
      _showedMessage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Message App'),
            backgroundColor: Theme.of(context).primaryColorLight),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _showedMessage
                    ? '¡Saludos usuario!'
                    : 'Mi primera aplicación con Flutter',
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              if (!_showedMessage)
                ElevatedButton(
                    onPressed: _showMessage,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: const Text(
                      'Mostrar Mensaje',
                      style: TextStyle(color: Colors.white),
                    ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _restartApp,
          child: const Icon(Icons.sync),
        ));
  }
}
