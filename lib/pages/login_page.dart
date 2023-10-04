import 'package:firebase_auth/firebase_auth.dart';
import 'package:firelesson/models/user_model.dart';
import 'package:firelesson/services/auth_services.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User? user;

  signIn() async {
    UserModel model = UserModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    AuthServices services = AuthServices();
    services.login(model).then((value) {
      setState(() {
        user = value;
      });
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: Column(
            children: [
              const SizedBox(height: 200),
              const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Emailni kiriting",
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Passwordni kiriting",
                ),
              ),
              const SizedBox(height: 48),
              MaterialButton(
                minWidth: 200,
                onPressed: signIn,
                color: Colors.black,
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
