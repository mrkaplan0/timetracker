import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/pages/auth/register_page.dart';
import 'package:timetracker/utils/consts.dart';

class LoginPage extends ConsumerWidget {
  late String _password, _email;
  final String _invalidPassword =
      "Das Passwort muss mindestens 6 Zeichen lang sein";
  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width > 600 ? 300 : 20),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                  const Text('Anmelden', style: MyConsts.myBigTitleTextStyle),

                  TextFormField(
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: Icon(Icons.mail_outline_rounded),
                      ),
                    ),
                    validator: (value) {
                      _email = value!;
                      return value.contains('@')
                          ? null
                          : 'Bitte eine gültige E-Mail-Adresse eingeben';
                    },

                    onSaved: (String? value) {
                      _email = value!;
                    },

                    keyboardType: TextInputType.emailAddress,
                  ),

                  TextFormField(
                    focusNode: focusNode2,
                    decoration: const InputDecoration(
                      labelText: 'Passwort',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: Icon(Icons.lock_outline_rounded),
                      ),
                    ),
                    validator: (value) {
                      _password = value!;
                      return value.length < 6 ? _invalidPassword : null;
                    },

                    onSaved: (String? gelenSifre) {
                      _password = gelenSifre!;
                    },

                    obscureText: true,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      // Handle login logic here
                    },
                    child: const Text('Anmelden'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text("Registrieren"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
