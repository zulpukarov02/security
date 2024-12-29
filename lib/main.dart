import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(PrankAndGreetingApp());
}

class PrankAndGreetingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Привет, сестра!',
      home: PrankScreen(),
    );
  }
}

class PrankScreen extends StatefulWidget {
  @override
  _PrankScreenState createState() => _PrankScreenState();
}

class _PrankScreenState extends State<PrankScreen> {
  bool _showError = true;

  @override
  void initState() {
    super.initState();
    // Через 5 секунд переключаем экран на поздравление
    Timer(Duration(seconds: 5), () {
      setState(() {
        _showError = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _showError ? _buildErrorScreen() : _buildGreetingScreen(),
      ),
    );
  }

  Widget _buildErrorScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error, color: Colors.red, size: 100),
        SizedBox(height: 20),
        Text(
          'ОШИБКА: Что-то пошло не так!',
          style: TextStyle(fontSize: 24, color: Colors.red),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildGreetingScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '🎉 Ты самая красивая сестренка! 🎉',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.purple),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          'Ты самая лучшая и любимая! Пусть твои мечты сбываются!',
          style: TextStyle(fontSize: 24, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Сюрприз!'),
                content: Text('Ты заслуживаешь самого лучшего в этот день! ❤️'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Спасибо!'),
                  ),
                ],
              ),
            );
          },
          child: Text('Нажми сюда!'),
        ),
      ],
    );
  }
}
