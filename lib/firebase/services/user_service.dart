
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {

  final CollectionReference users = 
    FirebaseFirestore.instance.collection('users');


  Future<bool> isPhoneNumberExists(String phoneNumber) async {
    final QuerySnapshot result = await users
    .where('phoneNumber', isEqualTo: phoneNumber)
    .get();

    return result.docs.isNotEmpty;
  }

  // CREATE : add a new user
  Future<void> addUser (
    User? user, 
    String name, 
    String surname, 
    String birthDate, 
    String gender
    ) async {
    await users.doc(user!.uid).set({
      'uid' : user.uid,
      'name': name,
      'surname': surname,
      'phoneNumber' : user.phoneNumber,
      'birthDate' : birthDate,
      'gender': gender
    });
  }
}