import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/Provider/favourite_provider.dart';
import 'package:provider_tutorials/Screen/Favourite/myfavourite_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItem= [];

  @override
  Widget build(BuildContext context) {
    print('Hello');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Favourite App'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyFavouriteScreen()));
            },
              child: const Icon(Icons.favorite,color: Colors.white,)),
          const SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                  itemBuilder: (context, index){
                    return Consumer<FavouriteItemProvider>(builder: (context, value, child){
                      return Card(
                        elevation: 5,
                        surfaceTintColor: Colors.red,
                        shadowColor: Colors.black,
                        child: ListTile(
                          onTap: (){
                            if(value.selectedItem.contains(index)){
                              value.removeItem(index);
                            }else {
                              value.addItem(index);
                            }
                          },
                          title: Text('Items '+index.toString()),
                          trailing: Icon(
                              value.selectedItem.contains(index)? Icons.favorite: Icons.favorite_outline_rounded),
                        ),
                      );
                    });
}
              ),

          )
        ],
      ),
    );
  }
}
