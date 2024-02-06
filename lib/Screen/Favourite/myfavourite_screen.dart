import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/Provider/favourite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider= Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('My Favourite App'),
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
                itemCount: favouriteProvider.selectedItem.length,
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
