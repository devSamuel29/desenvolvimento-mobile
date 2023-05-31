// import 'package:flutter/material.dart';
// import 'package:bugetbuddy/Models/UserModel.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:uuid/uuid.dart';

// class DbContext extends ChangeNotifier {
//   final firebaseFirestore = FirebaseFirestore.instance;
//   Uuid generateId = Uuid();
//   UserModel? userModel;

//   login(String email, String pwd) async {
//     try {
//       bool isRegistred = false;
//       QuerySnapshot query = await firebaseFirestore.collection("User").get();
//       query.docs.forEach((doc) {
//         if (!(doc.get(userModel!.email) == email &&
//             doc.get(userModel!.pwd) == pwd)) {
//           throw DbContextException("Usuário não encontrado");
//         }
//         // _auth.signInWithEmailAndPassword(email: email, password: pwd);
//         // notifyListeners();
//       });
//     } on FirebaseException catch (e) {
//       throw DbContextException(e.toString());
//     }
//   }

//   register(String name, String lastname, String email, String pwd,
//       String bday) async {
//     try {
//       bool isRegistred = false;
//       QuerySnapshot query = await firebaseFirestore.collection("User").get();
//       query.docs.forEach((doc) {
//         if (doc.get("email") == email) {
//           throw DbContextException("Email já está em uso");
//         }
//         isRegistred = true;
//       });
//       if (isRegistred) {
//         String id = generateId.v1();
//         userModel = UserModel(
//             name: name,
//             lastname: lastname,
//             email: email,
//             pwd: pwd,
//             bday: bday);

//         await firebaseFirestore.collection("User").doc().set({
//           "name": userModel!.name,
//           "lastname": userModel!.lastname,
//           "email": userModel!.email,
//           "pwd": userModel!.pwd,
//           "bday": userModel!.bday
//         });

//         // _auth.createUserWithEmailAndPassword(
//         //     email: userModel!.email, password: userModel!.pwd);
//         // SnackBar(content: Text("Usuário cadastrado com sucesso!"));
//         // notifyListeners();
//       }
//     } on FirebaseException catch (e) {
//       throw DbContextException(e.toString());
//     }
//   }

//   update(id) async {
//     try {} on FirebaseException catch (e) {
//       throw DbContextException(e.toString());
//     }
//   }

//   delete(id) async {
//     try {} on FirebaseException catch (e) {
//       throw DbContextException(e.toString());
//     }
//   }

//   // logout() async {
//   //   await _auth.signOut();
//   //   notifyListeners();
//   // }
// }

// class DbContextException implements Exception {
//   String message;
//   DbContextException(this.message);
// }

// class TestExcpetion implements Exception {
//   String message;
//   TestExcpetion(this.message);
// }
