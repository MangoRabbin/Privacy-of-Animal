import 'dart:async';

import 'package:privacy_of_animal/logics/firebase_api.dart';
import 'package:privacy_of_animal/utils/service_locator.dart';

class FindPasswordAPI {
  Future<FIND_PASSWORD_RESULT> findPassword(String email) async {
    try {
      await sl.get<FirebaseAPI>().auth.sendPasswordResetEmail(email: email);
    } catch(exception){
      return FIND_PASSWORD_RESULT.FAILURE;
    }
    return FIND_PASSWORD_RESULT.SUCCESS;
  }
}

enum FIND_PASSWORD_RESULT {
  SUCCESS,
  FAILURE
}