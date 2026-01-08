import 'package:flutter/material.dart';
import 'home_account.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({super.key});

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void saveAccount() {
    HomeScreen.savedUser = userController.text;
    HomeScreen.savedPass = passController.text;

    Navigator.pop(context); // يرجع للهوم سكرين
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Account')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(labelText: 'New Username'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'New Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveAccount,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}