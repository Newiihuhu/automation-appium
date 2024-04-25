import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential?> signIn(
    String email, String password, Function(String) onError) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  } on FirebaseAuthException catch (e) {
    onError(e.message ?? 'An error occurred');
    return null;
  }
}
