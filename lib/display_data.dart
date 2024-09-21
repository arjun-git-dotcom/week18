import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/display_data_bloc.dart';
import 'package:frontend/bloc/person_bloc.dart';
import 'package:frontend/models/model.dart';


class DisplayData extends StatelessWidget {
  const DisplayData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DisplayDataBloc()..add(FetchData()),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.greenAccent])),
            ),
           BlocBuilder<DisplayDataBloc,DisplayDataState>(builder: (context,state){
               if (state.persons.isNotEmpty) {
                    
                    return ListView.builder(
                      itemCount: state.persons.length,
                      itemBuilder: (BuildContext context, int index) {
                            Person person = state.persons[index];
                        return ListTile(
                          leading: const Icon(
                            Icons.person_2_rounded,
                            size: 35,
                          ),
                          title: Text('Name:${person.name}'),
                          subtitle: Text("phone:${person.phone}"),
                          trailing: Text('age:${person.age}'),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'NO DATA FOUND',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
           })
                
               
                
          ],
        ),
      ),
    );
  }
}
