import 'package:app_geceden/firebase/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static String verifyId = "";
  static final FirestoreService _firestoreService = FirestoreService();

  static Future sendOTP({
    required String phoneController,
    required Function errorStep,
    required Function nextStep
    }) async {
    await _firebaseAuth.verifyPhoneNumber(
      timeout: const Duration(seconds: 30),
      phoneNumber: phoneController,
      verificationCompleted: (phoneAuthCredential) async {
      
      }, 
      verificationFailed: (e) async {

      }, 
      codeSent: (verificationId, forceResendingToken) async {
        verifyId = verificationId;
        nextStep();
      }, 
      codeAutoRetrievalTimeout: (verificationId) async {
        errorStep();
      }
    );
  }

  
  static Future loginWithOtp({required String otp, required String phoneController}) async {
    final credential = PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
    bool isPhoneNumberExists = await _firestoreService.isPhoneNumberExists(phoneController);

    try {
      final user = await _firebaseAuth.signInWithCredential(credential);

      if (user.user != null){
        if (!isPhoneNumberExists){
          return 'register_page';
        }
        return 'home_page';
      }
      else {
        return 'false';
      }
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }
  
  //cikis yap
  static Future logout () async {
    await _firebaseAuth.signOut();
  }

  // kullanıcı durumunu kontrol et
  static Future<bool> isLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }

}