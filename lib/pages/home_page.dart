import 'package:firelesson/services/auth_services.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  static const id = '/home';

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Successfully registered!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            minWidth: 200,
            onPressed: () {
              AuthServices services = AuthServices();
              services.logout(context);
            },
            color: Colors.black,
            child: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
