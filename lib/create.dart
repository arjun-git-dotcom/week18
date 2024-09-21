import 'package:flutter/material.dart';
import 'package:frontend/bloc/person_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Createpage extends StatefulWidget {
  const Createpage({super.key});

  @override
  State<Createpage> createState() => _CreatepageState();
}

class _CreatepageState extends State<Createpage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return BlocProvider(
      create: (context) => PersonBloc(),
      child: Scaffold(
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
            Center(child: BlocBuilder<PersonBloc, PersonState>(
              builder: (context, state) {
                final bloc = BlocProvider.of<PersonBloc>(context);
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 70, right: 70),
                          child: TextField(
                            controller: nameController,
                            decoration:
                                const InputDecoration(hintText: 'Enter name'),
                            onChanged: (value) {
                              bloc.add(NameChanged(value));
                            },
                          )),
                      Container(
                        margin: const EdgeInsets.only(left: 70, right: 70),
                        child: TextField(
                          controller: ageController,
                          decoration:
                              const InputDecoration(hintText: 'Enter  age'),
                          onChanged: (value) {
                            bloc.add(AgeChanged(value));
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 70, right: 70),
                        child: TextField(
                          controller: phoneController,
                          decoration:
                              const InputDecoration(hintText: 'Enter phone'),
                          onChanged: (value) {
                            bloc.add(PhoneChanged(value));
                          },
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            bloc.add(SubmitForm());
                            Navigator.pop(context);
                          },
                          child: state.isSubmitting?const CircularProgressIndicator():const Text('Submit'))
                    ]);
              },
            )),
          ],
        ),
      ),
    );
  }
}
