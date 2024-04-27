import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

Future<bool> signUpUser(String email, String password, String name,
    Function(String) onError) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'name': name,
    });
    return true; // Return true on successful sign up
  } on FirebaseAuthException catch (e) {
    onError(e.message ?? 'An error occurred during sign up.');
    return false; // Return false on failure
  }
}

Future<bool> reauthenticateUser(
    String email, String password, Function(String) onError) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
  } on FirebaseAuthException catch (e) {
    onError(e.message ?? 'An error occurred during reauthentication.');
    return false;
  }
}

// Add this function to firebase.dart
Future<String?> fetchUserName(String uuid) async {
  DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection('users').doc(uuid).get();
  return userDoc.get('name');
}
