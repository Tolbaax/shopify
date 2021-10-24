
import 'package:firebase_auth/firebase_auth.dart';

class Auth
{
  FirebaseAuth auth = FirebaseAuth.instance;

  signUp(email,password)async
  {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    await auth.currentUser!.sendEmailVerification();
  }

  signIn(email,password)async
  {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
  forgetPassword(email)async
  {
    await auth.sendPasswordResetEmail(email: email);
  }
}