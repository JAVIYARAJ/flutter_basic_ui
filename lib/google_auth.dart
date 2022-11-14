import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignProvider{

  final googleSign=GoogleSignIn();

  //contain all info about user like image,name,email
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user=> _user!;

  Future googleLogin() async{

    //this show google sign in pop up and get user detail.
    final googleUser=await googleSign.signIn();

    if(googleUser==null) return;
    _user=googleUser;

    //authenticate user
    final googleAuth=await googleUser.authentication;


    final credential=GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

  }

  Future logout() async{
    await googleSign.disconnect();
    FirebaseAuth.instance.signOut();
}
}