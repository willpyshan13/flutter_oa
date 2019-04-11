class User{
  String passWord;
  String workNumber;

  User(this.passWord ,this.workNumber);

  Map<String,dynamic> toJson() =>{
    'passWord': passWord,
    'workNumber': workNumber,
  };
}