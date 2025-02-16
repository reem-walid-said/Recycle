import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // // SignIn with Google (still under developed)
  // signInWithGoogle() async {
  //   try{
  //     GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //     GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //     AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );
  //
  //     UserCredential userCredential = await _auth.signInWithCredential(credential);
  //
  //     return userCredential;
  //   }catch(e){
  //     if(e.toString().contains("network error"))return "Network connection error";
  //     return null;
  //   }
  //
  // }

  // SignIn with Email & Password
  signInWithEmailAndPassword({
    required email,
    required password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result;
    } catch (e) {
      print(e.toString());
      if (e.toString().contains("network error"))
        return "Network connection error";
      return e.toString().split("] ")[1];
    }
  }

  // SignUp with Email & Password
  signUpWithEmailAndPassword({
    email,
    password,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result;
    } catch (e) {
      print(e.toString());
      if (e.toString().contains("network error"))
        return "Network connection error";
      return e.toString().split("] ")[1];
    }
  }

  // Forget Password

  // SignOut
  signOut() async {
    //await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
