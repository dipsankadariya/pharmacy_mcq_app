import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcq_app/firebase_services/authentication.dart';
import 'package:mcq_app/firebase_services/formContainer.dart';
import 'package:mcq_app/pages/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Sign In',
            style: TextStyle(fontSize: 25),
          )),
        ),
        body: Center(
          child: Column(
            children: [
              const Text('Log In'),
              const SizedBox(height: 30),
              FormContainer(
                controller: _emailController,
                hintText: 'Email',
                isPasswordField: false,
              ),
              const SizedBox(height: 30),
              FormContainer(
                controller: _passwordController,
                hintText: 'Password',
                isPasswordField: true,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                  child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      child: const Center(
                          child: Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )))),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't you have an account?"),
                  const SizedBox(width: 2),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()),
                          (route) => false);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
    } else {}
  }
}
