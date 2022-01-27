import 'package:flash_chat/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flash_chat/components/RoundedButton.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter the email',
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter the password',
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                title: 'Register',
                onPressed: () async {
                  showLoadingHud(context, 'Registering');
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    showSuccessHud(context, 'Registering');
                  } catch (e) {
                    print(e);
                    showErrorHud(context, 'Registering');
                  }
                },
                color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
