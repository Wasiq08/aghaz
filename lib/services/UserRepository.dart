import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  //Sign in with email and password
  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //Signup with email and password
  Future<void> signUp({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //Sign out
  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }

  //Checking if user is Sign in or not
  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  //Getting the User
  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }

  Future<FirebaseUser> user() async {
    return (await _firebaseAuth.currentUser());
  }

  Future<String> getCompleteUser() async {
    return (await _firebaseAuth.currentUser()).uid;
  }
}
