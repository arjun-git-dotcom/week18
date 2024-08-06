import 'package:flutter/material.dart';
import 'package:frontend/services/api.dart';

class Createpage extends StatelessWidget {
  const Createpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController ageController = TextEditingController();

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
                Container(
                    margin: const EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                        controller: nameController,
                        decoration:
                            const InputDecoration(hintText: 'Enter name'))),
                Container(
                    margin: const EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                        controller: ageController,
                        decoration:
                            const InputDecoration(hintText: 'Enter  age'))),
                Container(
                    margin: const EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                        controller: phoneController,
                        decoration:
                            const InputDecoration(hintText: 'Enter phone'))),
                ElevatedButton(
                    onPressed: () {
                      var jsondata = {
                        'name': nameController.text,
                        'phone': phoneController.text,
                        'age': ageController.text
                      };
                      Api.addPerson(jsondata);
                      Navigator.pop(context);
                    },
                    child: const Text('submit'))
              ])),
        ],
      ),
    );
  }
}
