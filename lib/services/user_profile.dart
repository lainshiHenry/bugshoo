UserProfile currentUser;

class UserProfile {
  String uID;
  String firstName;
  String lastName;
  String emailAddress;
  List<String> authorizedProject;

  UserProfile({
    this.uID,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.authorizedProject,
  });
}
