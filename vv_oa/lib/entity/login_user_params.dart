class LoginUserParams{
  String passWord;
  String workNumber;
  bool autoLogin;

  LoginUserParams(this.passWord, this.workNumber, this.autoLogin);

  Map<String,dynamic> toJson() =>{
    'passWord': passWord,
    'autoLogin': autoLogin,
    'workNumber': workNumber,
  };
}