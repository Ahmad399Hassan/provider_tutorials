import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/Provider/count_provider.dart';
import 'package:provider_tutorials/Provider/example_one_provider.dart';
import 'package:provider_tutorials/Provider/favourite_provider.dart';
import 'package:provider_tutorials/Provider/theme_changer_provider.dart';
import 'package:provider_tutorials/Screen/count_example.dart';
import 'package:provider_tutorials/Screen/example_one.dart';
import 'package:provider_tutorials/home_screen.dart';
import 'package:provider_tutorials/statefull_widget.dart';
import 'package:provider_tutorials/why_provider.dart';
import 'Screen/Favourite/favourite_screen.dart';
import 'Screen/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CountProvider()),
        ChangeNotifierProvider(create: (_)=> ExampleOneProvider()),
        ChangeNotifierProvider(create: (_)=> FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_)=> ThemerChanger(),)
      ],
        child: Builder(builder: (BuildContext context){
          final themeChange = Provider.of<ThemerChanger>(context);
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeChange.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red,
              primaryColor: Colors.red
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
                primarySwatch: Colors.purple

            ),
            home:  const DarkThemeScreen(),
          );
        }),
    );
  }
}
