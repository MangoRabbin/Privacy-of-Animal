import 'package:privacy_of_animal/models/fake_profile_model.dart';
import 'package:privacy_of_animal/models/kakao_ml_model.dart';
import 'package:privacy_of_animal/models/real_profile_model.dart';
import 'package:privacy_of_animal/models/tag_list_model.dart';

class CurrentUser {
  String uid;
  RealProfileModel realProfileModel;
  TagListModel tagListModel;
  KakaoMLModel kakaoMLModel;
  FakeProfileModel fakeProfileModel;

  bool isDataFetched = false;

  CurrentUser() : 
    realProfileModel = RealProfileModel(), 
    tagListModel = TagListModel(tagTitleList: List<String>(), tagDetailList: List<String>()),
    fakeProfileModel = FakeProfileModel();
}