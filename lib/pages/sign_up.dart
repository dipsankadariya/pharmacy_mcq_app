import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcq_app/firebase_services/authentication.dart';
import 'package:mcq_app/firebase_services/formContainer.dart';
import 'package:mcq_app/pages/sign_in.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuthService _auth =
      FirebaseAuthService(); // Create an instance of `FirebaseAuthService` to handle authentication logic.

  //manage input from text fields.
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the `TextEditingController` instances to free up resources when the widget is removed.
    _userController.dispose();
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
            'Sign Up',
            style: TextStyle(fontSize: 25),
          )),
        ),
        body: Center(
          child: Column(
            children: [
              const Text('Sign Up'),
              const SizedBox(height: 30),
              FormContainer(
                controller: _userController,
                hintText: 'Username',
                isPasswordField: false,
              ),
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
                  onTap: _signUp,
                  child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      child: const Center(
                          child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )))),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(width: 2),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                          (route) => false);
                    },
                    child: const Text(
                      "Sign In",
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

  void _signUp() async {
    String username = _userController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      Navigator.pushNamed(context, '/home');
    } else {
      const ScaffoldMessenger(
        child: SnackBar(content: Text("Some Error Occured")),
      );
    }
  }
}
