class CopyPersonEntity {
	String departmentName;
	String correctionTime;
	String companyName;
	String departmentId;
	String mobile;
	String workingCity;
	String companyId;
	String workNumber;
	CopyPersonPost post;
	dynamic createTime;
	String id;
	String timeOfEntry;
	String email;
	int formOfEmployment;
	int inServiceStatus;
	String username;

	CopyPersonEntity({this.departmentName, this.correctionTime, this.companyName, this.departmentId, this.mobile, this.workingCity, this.companyId, this.workNumber, this.post, this.createTime, this.id, this.timeOfEntry, this.email, this.formOfEmployment, this.inServiceStatus, this.username});

	CopyPersonEntity.fromJson(Map<String, dynamic> json) {
		departmentName = json['departmentName'];
		correctionTime = json['correctionTime'];
		companyName = json['companyName'];
		departmentId = json['departmentId'];
		mobile = json['mobile'];
		workingCity = json['workingCity'];
		companyId = json['companyId'];
		workNumber = json['workNumber'];
		post = json['post'] != null ? new CopyPersonPost.fromJson(json['post']) : null;
		createTime = json['createTime'];
		id = json['id'];
		timeOfEntry = json['timeOfEntry'];
		email = json['email'];
		formOfEmployment = json['formOfEmployment'];
		inServiceStatus = json['inServiceStatus'];
		username = json['username'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['departmentName'] = this.departmentName;
		data['correctionTime'] = this.correctionTime;
		data['companyName'] = this.companyName;
		data['departmentId'] = this.departmentId;
		data['mobile'] = this.mobile;
		data['workingCity'] = this.workingCity;
		data['companyId'] = this.companyId;
		data['workNumber'] = this.workNumber;
		if (this.post != null) {
      data['post'] = this.post.toJson();
    }
		data['createTime'] = this.createTime;
		data['id'] = this.id;
		data['timeOfEntry'] = this.timeOfEntry;
		data['email'] = this.email;
		data['formOfEmployment'] = this.formOfEmployment;
		data['inServiceStatus'] = this.inServiceStatus;
		data['username'] = this.username;
		return data;
	}
}

class CopyPersonPost {
	int postSort;
	String postName;
	String departmentId;
	String postCode;
	String id;
	String status;

	CopyPersonPost({this.postSort, this.postName, this.departmentId, this.postCode, this.id, this.status});

	CopyPersonPost.fromJson(Map<String, dynamic> json) {
		postSort = json['postSort'];
		postName = json['postName'];
		departmentId = json['departmentId'];
		postCode = json['postCode'];
		id = json['id'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['postSort'] = this.postSort;
		data['postName'] = this.postName;
		data['departmentId'] = this.departmentId;
		data['postCode'] = this.postCode;
		data['id'] = this.id;
		data['status'] = this.status;
		return data;
	}
}
