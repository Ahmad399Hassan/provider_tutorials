import 'package:flutter/material.dart';

class StateFullWidget extends StatefulWidget {
  const StateFullWidget({super.key});

  @override
  State<StateFullWidget> createState() => _StateFullWidgetState();
}

class _StateFullWidgetState extends State<StateFullWidget> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('StateFull Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(DateTime.now().toString(),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          Container(
            child:  Center(child: Text(counter.toString(),style: const TextStyle(fontSize: 50),)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          counter++;
          print(counter);
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );

  }
}
