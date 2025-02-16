import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  // Define a class `FirebaseAuthService` to encapsulate Firebase authentication-related methods.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password:
              password); // Attempt to create a new user with the provided email and password using FirebaseAuth.
      return credential.user;
    } catch (e) {
      print("Some error occured");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    if (email != "" && password != "") {
      try {
        UserCredential credential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } catch (e) {}
    }
    return null;
  }
}
