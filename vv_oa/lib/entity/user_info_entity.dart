class UserInfoEntity {
	int code;
	UserInfoData data;
	bool success;
	String message;
	dynamic status;
	dynamic currentAuthority;

	UserInfoEntity({this.code, this.data, this.success, this.message, this.status, this.currentAuthority});

	UserInfoEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		data = json['data'] != null ? new UserInfoData.fromJson(json['data']) : null;
		success = json['success'];
		message = json['message'];
		status = json['status'];
		currentAuthority = json['currentAuthority'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['success'] = this.success;
		data['message'] = this.message;
		data['status'] = this.status;
		data['currentAuthority'] = this.currentAuthority;
		return data;
	}
}

class UserInfoData {
	dynamic nation;
	dynamic sex;
	String mobile;
	dynamic wechat;
	List<UserInfoDataPermissionlist> permissionList;
	dynamic title;
	dynamic bloodType;
	String userId;
	String companyId;
	dynamic postalAddress;
	dynamic post;
	String workNumber;
	dynamic constellation;
	dynamic qrCodeStr;
	dynamic domicile;
	dynamic nativePlace;
	String company;
	dynamic politicalOutlook;
	dynamic department;
	String email;
	dynamic maritalStatus;
	dynamic age;
	String username;
	dynamic residenceCardCity;

	UserInfoData({this.nation, this.sex, this.mobile, this.wechat, this.permissionList, this.title, this.bloodType, this.userId, this.companyId, this.postalAddress, this.post, this.workNumber, this.constellation, this.qrCodeStr, this.domicile, this.nativePlace, this.company, this.politicalOutlook, this.department, this.email, this.maritalStatus, this.age, this.username, this.residenceCardCity});

	UserInfoData.fromJson(Map<String, dynamic> json) {
		nation = json['nation'];
		sex = json['sex'];
		mobile = json['mobile'];
		wechat = json['wechat'];
		if (json['permissionList'] != null) {
			permissionList = new List<UserInfoDataPermissionlist>();
			(json['permissionList'] as List).forEach((v) { permissionList.add(new UserInfoDataPermissionlist.fromJson(v)); });
		}
		title = json['title'];
		bloodType = json['bloodType'];
		userId = json['userId'];
		companyId = json['companyId'];
		postalAddress = json['postalAddress'];
		post = json['post'];
		workNumber = json['workNumber'];
		constellation = json['constellation'];
		qrCodeStr = json['qrCodeStr'];
		domicile = json['domicile'];
		nativePlace = json['nativePlace'];
		company = json['company'];
		politicalOutlook = json['politicalOutlook'];
		department = json['department'];
		email = json['email'];
		maritalStatus = json['maritalStatus'];
		age = json['age'];
		username = json['username'];
		residenceCardCity = json['residenceCardCity'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['nation'] = this.nation;
		data['sex'] = this.sex;
		data['mobile'] = this.mobile;
		data['wechat'] = this.wechat;
		if (this.permissionList != null) {
      data['permissionList'] = this.permissionList.map((v) => v.toJson()).toList();
    }
		data['title'] = this.title;
		data['bloodType'] = this.bloodType;
		data['userId'] = this.userId;
		data['companyId'] = this.companyId;
		data['postalAddress'] = this.postalAddress;
		data['post'] = this.post;
		data['workNumber'] = this.workNumber;
		data['constellation'] = this.constellation;
		data['qrCodeStr'] = this.qrCodeStr;
		data['domicile'] = this.domicile;
		data['nativePlace'] = this.nativePlace;
		data['company'] = this.company;
		data['politicalOutlook'] = this.politicalOutlook;
		data['department'] = this.department;
		data['email'] = this.email;
		data['maritalStatus'] = this.maritalStatus;
		data['age'] = this.age;
		data['username'] = this.username;
		data['residenceCardCity'] = this.residenceCardCity;
		return data;
	}
}

class UserInfoDataPermissionlist {
	String enVisible;
	String code;
	int isBasePre;
	String menuUrl;
	String name;
	String description;
	String pid;
	String id;
	int type;
	String international;

	UserInfoDataPermissionlist({this.enVisible, this.code, this.isBasePre, this.menuUrl, this.name, this.description, this.pid, this.id, this.type, this.international});

	UserInfoDataPermissionlist.fromJson(Map<String, dynamic> json) {
		enVisible = json['enVisible'];
		code = json['code'];
		isBasePre = json['isBasePre'];
		menuUrl = json['menuUrl'];
		name = json['name'];
		description = json['description'];
		pid = json['pid'];
		id = json['id'];
		type = json['type'];
		international = json['international'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['enVisible'] = this.enVisible;
		data['code'] = this.code;
		data['isBasePre'] = this.isBasePre;
		data['menuUrl'] = this.menuUrl;
		data['name'] = this.name;
		data['description'] = this.description;
		data['pid'] = this.pid;
		data['id'] = this.id;
		data['type'] = this.type;
		data['international'] = this.international;
		return data;
	}
}
