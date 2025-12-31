import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/*
LIGHTWEIGHT AUTH
 */

class GoogleAuthService {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn.instance;

  final _googleSignIncopy = GoogleSignIn.instance.initialize(
    serverClientId:
        '878112193729-8n4hruc6m8e6aqevbn3ji7tsil4r8fou.apps.googleusercontent.com',
    clientId: '',
  );

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    //
    final account = await _googleSignIn.authenticate();
    //if(account == null) return null;

    // Obtain the auth details from the request
    final accessToken = account.authentication;
    final idToken = account.authentication.idToken;
    //if (accessToken == null || idToken == null) return null;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      //accessToken: accessToken,
      idToken: idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
