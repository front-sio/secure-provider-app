import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secureprovider/utils/formatters/formatter.dart';

class UserModel {

  final String id;
  String firstName;
  String lastName;
  String username;
  final String email;
  String phoneNumber;
  String profilePicture;


  UserModel({
    required this.id, 
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.username,
    required this.lastName,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';
  


  String get formattedPhoneNo => SecuriteFormatter.formatPhoneNumber(phoneNumber);


  static List<String> nameParts(fullName) => fullName.split(" ");


  static String generateUserName(fullName){
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = "$firstName$lastName";
    String usernameWithPrifix = "in_$camelCaseUserName";

    return usernameWithPrifix;
  }



  static UserModel  empty() => UserModel(id: '', email: '', username: '', phoneNumber: '', firstName: '', lastName: '', profilePicture: '');


  // convert to json
  Map<String, dynamic> toJson(){
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'UseName': username,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }


  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  if (document.data() != null) {
    final data = document.data()!;
    return UserModel(
      id: document.id, 
      email: data['email'] ?? "", 
      username: data['username'] ?? "", 
      phoneNumber: data['PhoneNumber'] ?? "", 
      firstName: data['FirstName'] ?? "", 
      lastName: data['LastName'] ?? "", 
      profilePicture: data['ProfilePicture'] ?? ""
    );
  } else {
    throw Exception('Failed to create UserModel from snapshot');
  }
}



}