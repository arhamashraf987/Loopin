
class UsersModel {
  final String name;
  final String image;
  final String userName;
  final bool isSent;
  final bool isAccepted;

  const UsersModel({required this.name, required this.image, required this.userName, required this.isSent, required this.isAccepted,});
   UsersModel copyWith({
    String? name,
    String? image,
    String? userName,
    bool? isSent,
    bool? isAccepted,
  }) {
    return UsersModel(
      name: name ?? this.name,
      image: image ?? this.image,
      userName: userName ?? this.userName,
      isSent: isSent ?? this.isSent,
      isAccepted: isAccepted ?? this.isAccepted,
    );
  }
} 