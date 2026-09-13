import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Home/models/active_user_model.dart';
import 'package:convo_sphere/features/Home/models/friends_model.dart';

class HomeController extends  GetxController {
  final RxList<FriendsModel> selectedgroup = <FriendsModel>[].obs;
final RxList<FriendsModel> activeUsers = <FriendsModel>[].obs;
final RxList<UsersModel> addUsers = <UsersModel>[
  const UsersModel(name: "Arham", image: AppImages.profile4, userName: "aesthetical_arham", isSent: false, isAccepted: false),
  const UsersModel(name: "Gabriel", image: AppImages.frnd2, userName: "itx_gabriel", isSent: true, isAccepted: false),
  const UsersModel(name: "Damon", image: AppImages.frnd1, userName: "Damon_here", isSent: true, isAccepted: true)
].obs;
final RxList<FriendsModel> friends = <FriendsModel>[
  const FriendsModel(name: "Damon", image: AppImages.frnd1, timeStamp: "yesterday", isAudio: false, isActive: true),
  const FriendsModel(name: "Arham", image: AppImages.profile4, timeStamp: "Today", isAudio: false, isActive: true),
  const FriendsModel(name: "Gabriel", image: AppImages.frnd2, timeStamp: "3d ago", isAudio: true, isActive: false),
  const FriendsModel(name: "Maya", image: AppImages.profile2, timeStamp: "1h ago", isAudio: false, isActive: true),
  const FriendsModel(name: "Jhon", image: AppImages.profile1, timeStamp: "8d ago", isAudio: false, isActive: false),
  const FriendsModel(name: "Leo", image: AppImages.profile3, timeStamp: "1w ago", isAudio: true, isActive: false),
].obs;
@override
  void onInit() {
    super.onInit();
    syncActiveUsers();
  }

  void syncActiveUsers() {
    activeUsers.assignAll(friends.where((f) =>f.isActive)); 
  }
  void selectgroup(FriendsModel friend) {
   final exists = selectedgroup.any((f)=>f.name==friend.name);
   if(exists) {
    selectedgroup.removeWhere((f)=>f.name==friend.name);
   } else {
    selectedgroup.add(friend);
   }
  }

}