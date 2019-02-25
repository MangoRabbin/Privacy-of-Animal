
import 'package:privacy_of_animal/logics/current_user.dart';
import 'package:privacy_of_animal/logics/database_helper.dart';
import 'package:privacy_of_animal/logics/firebase_api.dart';
import 'package:privacy_of_animal/utils/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:privacy_of_animal/resources/strings.dart';
import 'package:privacy_of_animal/logics/notification_helper.dart';

class NotificationAPI {
  
  Future<void> setFriendsRequest(bool value) async {
    SharedPreferences prefs = await sl.get<DatabaseHelper>().sharedPreferences;
    prefs.setBool(friendsRequestNotification, value);
    sl.get<CurrentUser>().friendsRequestNotification = value;
    if(value) {
      sl.get<CurrentUser>().friendsRequestStream = sl.get<FirebaseAPI>().getFirestore()
          .collection(firestoreUsersCollection).document(sl.get<CurrentUser>().uid)
          .collection(firestoreFriendsSubCollection).where(firestoreFriendsField, isEqualTo: false)
          .snapshots();
      sl.get<CurrentUser>().friendsRequestStream.listen((data) async{
        await sl.get<NotificationHelper>().showFriendsRequestNotification(data);
      });
    } else {
      sl.get<CurrentUser>().friendsRequestStream = Stream.empty();
    }
  }

  Future<void> setMessages(bool value) async {
    SharedPreferences prefs = await sl.get<DatabaseHelper>().sharedPreferences;
    prefs.setBool(messageNotification, value);
    sl.get<CurrentUser>().messageNotification = value;
    if(value) {
      sl.get<CurrentUser>().messagesStream = sl.get<FirebaseAPI>().getFirestore()
          .collection(firestoreFriendsMessageCollection)
          .where(firestoreChatUsersField, arrayContains: sl.get<CurrentUser>().uid)
          .snapshots();
    } else {
      sl.get<CurrentUser>().friendsRequestStream = Stream.empty();
    }
  }
}