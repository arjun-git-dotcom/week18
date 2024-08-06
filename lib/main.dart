import 'package:flutter/material.dart';
import 'package:frontend/create.dart';
import 'package:frontend/display_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.greenAccent])),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 10,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white54),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black)),
                  label: const Text('CREATE'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Createpage()));
                  },
                  icon: const Icon(
                    Icons.create,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.black)),
                      label: const Text('READ'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DisplayData()));
                      },
                      icon: const Icon(
                        Icons.get_app,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
