// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/pages/auth/register_page.dart';
import 'package:timetracker/providers/auth_provider.dart';
import 'package:timetracker/utils/consts.dart';

class LoginPage extends ConsumerWidget {
  late String _password, _email;
  final RegExp _emailRegex = RegExp(
    r'^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$',
    caseSensitive: false,
  );
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
                    initialValue: "a@e.com",
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
                      final v = (value ?? '').trim();
                      if (v.isEmpty) {
                        return 'Bitte eine gültige E-Mail-Adresse eingeben';
                      }
                      if (!_emailRegex.hasMatch(v)) {
                        return 'Bitte eine gültige E-Mail-Adresse eingeben';
                      }
                      return null; // valid
                    },

                    onSaved: (String? value) {
                      _email = (value ?? '').trim();
                    },

                    keyboardType: TextInputType.emailAddress,
                  ),

                  TextFormField(
                    initialValue: "password",
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
                      final v = (value ?? '').trim();
                      if (v.isEmpty || v.length < 6) {
                        return _invalidPassword;
                      } else {
                        return null;
                      }
                    },

                    onSaved: (String? gelenSifre) {
                      _password = (gelenSifre ?? '').trim();
                    },

                    obscureText: true,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      _login(context, ref);
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

  void _login(BuildContext context, WidgetRef ref) async {
    try {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        var authService = ref.read(authServiceProvider);
        var (user, token) = await authService.login(
          email: _email,
          password: _password,
        );

        if (token.isEmpty || user == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login fehlgeschlagen. Bitte versuchen Sie es erneut.',
              ),
            ),
          );
          return;
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Willkommen ${user.name}!')));
          // Navigate to home or another page after successful login
          if (user.role == 'admin') {
            Navigator.pushReplacementNamed(context, '/admin_dashboard');
          } else if (user.role == 'user') {
            Navigator.pushReplacementNamed(context, '/user_dashboard');
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bitte füllen Sie alle Felder aus')),
        );
      }
    } catch (e) {
      print('Login error: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ein Fehler ist aufgetreten: $e')));
    }
  }
}
