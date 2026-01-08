import 'package:flutter/material.dart';
import 'package:a11/home.dart';
import 'account.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String savedUser = '';
  static String savedPass = '';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void login() {
    if (userController.text == HomeScreen.savedUser &&
        passController.text == HomeScreen.savedPass &&
        userController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const Homee()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('اسم المستخدم أو كلمة المرور خطأ')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول',)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NewAccount()),
                );
              },
              child: const Text('New Account'),
            ),
          ],
        ),
      ),
    );
  }
}