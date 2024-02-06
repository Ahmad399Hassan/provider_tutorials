import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    print('Hello World');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Example One')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, value,child){
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.value),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Center(child: Text('Box 1',style: TextStyle(fontSize: 20,color: Colors.white),)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Center(child: Text('Box 1',style: TextStyle(fontSize: 20,color: Colors.white),)),
                    ),
                  ),
                )
              ],
            );
          }),
          Column(
            children: [
              Consumer<ExampleOneProvider>(builder: (context, value,child){
                return Slider(
                    min: 0,
                    max: 1,
                  value: value.value, onChanged: (val){
                  value.setValue(val);
                  // setState((){
                  //
                  // });
                }
                );
              }
              ),
            ],
          )
        ],
      ),
    );
  }
}
