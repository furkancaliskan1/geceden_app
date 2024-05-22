
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {

  // login page'de telefon numarasına otp kodu gönderilir ve verify edilir.
  // eğer verify işlemi başarılı bir şekilde gerçekleştiyse bu numara database'e eklenir. Daha sonra register page'e yönlendirilir.
  // 


  // get collection of users

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