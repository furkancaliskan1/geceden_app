import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  // login page'de telefon numarasına otp kodu gönderilir ve verify edilir.
  // eğer verify işlemi başarılı bir şekilde gerçekleştiyse bu numara database'e eklenir. Daha sonra register page'e yönlendirilir.
  // 


  // get collection of users

  final CollectionReference users = 
    FirebaseFirestore.instance.collection('users');

  // CREATE : add a new user
  Future addUser(String phoneNumber) async {
    return users.add({
      'phoneNumber': phoneNumber
    });
  }



}