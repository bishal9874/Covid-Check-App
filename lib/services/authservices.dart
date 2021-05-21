// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:covidcheck/Screen/Auth/login.dart';
// import 'package:covidcheck/Screen/home.dart';
// import 'package:covidcheck/services/error_handler.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';

// class AuthService {
//   //Determine if the user is authicated.
//   // handleAuth() {
//   //   return StreamBuilder(
//   //     stream: FirebaseAuth.instance.authStateChanges(),
//   //     builder: (BuildContext context, snapshot) {
//   //       if (snapshot.hasData) {
//   //         return HomePage();
//   //       } else
//   //         return LoginScreen();
//   //     },
//   //   );
//   // }

//   // //user
//   // getCurrentUser() {
//   //   FirebaseAuth.instance.currentUser;
//   // }

//   //Sign out
//   signOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   //sign In
//   // signIn(String email, String password, String name, context) {
//   //   FirebaseAuth.instance
//   //       .signInWithEmailAndPassword(email: email, password: password)
//   //       .then((value) async {
//   //     print("signed in");
//   //     User user = FirebaseAuth.instance.currentUser;
//   //     await FirebaseFirestore.instance
//   //         .collection("user")
//   //         .doc(user.uid)
//   //         .set({'uid': user.uid, 'email': email, 'password': password});
//   //   }).catchError((e) {
//   //     ErrorHandler().errorDialog(context, e);
//   //   });
//   // }
//   //sign Up a new User

//   // signUp(String email, String password, String name, context) {
//   //   return FirebaseAuth.instance
//   //       .createUserWithEmailAndPassword(email: email, password: password)
//   //       .then((userCrads) async {
//   //     Navigator.of(context).pop();
//   //     User user = FirebaseAuth.instance.currentUser;
//   //     await FirebaseFirestore.instance.collection("user").doc(user.uid).set({
//   //       'uid': user.uid,
//   //       'name': name,
//   //       'email': email,
//   //       'password': password
//   //     });
//   //   }).catchError((e) {
//   //     ErrorHandler().errorDialog(context, e);
//   //   });
//   // }

//   //rest passsword
// resetPasswordLink(String email) {
//   return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
// }

// //   fbSignIn() async {
// //     final fb = FacebookLogin();

// // // Log in
// //     final res = await fb.logIn(permissions: [
// //       FacebookPermission.publicProfile,
// //       FacebookPermission.email,
// //     ]);

// // // Check result status
// //     switch (res.status) {
// //       case FacebookLoginStatus.success:
// //         // Logged in

// //         // Send access token to server for validation and auth
// //         final FacebookAccessToken accessToken = res.accessToken;
// //         final AuthCredential authCredential =
// //             FacebookAuthProvider.credential(accessToken.token);
// //         final result =
// //             await FirebaseAuth.instance.signInWithCredential(authCredential);

// //         // Get profile data
// //         final profile = await fb.getUserProfile();
// //         print('Hello, ${profile.name}! You ID: ${profile.userId}');

// //         // Get user profile image url
// //         final imageUrl = await fb.getProfileImageUrl(width: 100);
// //         print('Your profile image: $imageUrl');

// //         // Get email (since we request email permission)
// //         final email = await fb.getUserEmail();
// //         // But user can decline permission
// //         if (email != null) print('And your email is $email');

// //         break;
// //       case FacebookLoginStatus.cancel:
// //         // User cancel log in
// //         break;
// //       case FacebookLoginStatus.error:
// //         // Log in failed
// //         print('Error while log in: ${res.error}');
// //         break;
// //     }
// //   }
//  }
