import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/Provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    print('login');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'Login Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.red,
              radius: 100,
              child: CircleAvatar(
                  backgroundImage:NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  radius: 90,
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: 'Password',),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<AuthProvider>(
                builder: (context, value, child){
                  return InkWell(
                    onTap: (){
                      value.login(emailController.text.toString(),
                          passwordController.text.toString());
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.red, borderRadius: BorderRadius.circular(10)),
                      child:  Center(
                          child: value.loading? const CircularProgressIndicator(color: Colors.white,): const Text('Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
