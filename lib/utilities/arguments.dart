class DetailedBugArguments {
  final String bugID;
  final String description;
  final String timestamp;
  final String projectName;

  DetailedBugArguments(
      {this.bugID, this.description, this.timestamp, this.projectName});
}

class AllBugsByProjectArguments {
  final String projectName;
  AllBugsByProjectArguments(this.projectName);
}
