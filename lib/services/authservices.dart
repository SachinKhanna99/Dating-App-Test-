import 'package:firebase_auth/firebase_auth.dart';

class AuthServices
{
  final _auth=FirebaseAuth.instance;

  Stream<FirebaseUser> get currentuser{
    _auth.onAuthStateChanged;
  }

  Future<AuthResult>signInwithcredentials(AuthCredential credential){
    _auth.signInWithCredential(credential);
  }

  Future<void> logout(){
    _auth.signOut();
  }
}