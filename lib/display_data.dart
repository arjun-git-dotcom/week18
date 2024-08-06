import 'package:flutter/material.dart';
import 'package:frontend/models/model.dart';
import 'package:frontend/services/api.dart';

class DisplayData extends StatelessWidget {
  const DisplayData({super.key});

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
          
          FutureBuilder<List<Person>>(
            future:Api.getPerson(),
             
              builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
                if (snapshot.hasData) {
                  List<Person> data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(
                          Icons.person_2_rounded,
                          size: 35,
                        ),
                        title: Text('Name:${data[index].name}'),
                        subtitle: Text("phone:${data[index].phone}"),
                        trailing: Text('age:${data[index].age}'),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('NO DATA FOUND',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    
                  );
                }
              })
        ],
      ),
    );
  }
}
