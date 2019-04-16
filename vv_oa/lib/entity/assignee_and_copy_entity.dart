class AssigneeAndCopyEntity {
	List<AssigneeAndCopyCopytolist> copyToList;
	List<AssigneeAndCopyAssigneevo> assigneeVos;

	AssigneeAndCopyEntity({this.copyToList, this.assigneeVos});

	AssigneeAndCopyEntity.fromJson(Map<String, dynamic> json) {
		if (json['copyToList'] != null) {
			copyToList = new List<AssigneeAndCopyCopytolist>();
			(json['copyToList'] as List).forEach((v) { copyToList.add(new AssigneeAndCopyCopytolist.fromJson(v)); });
		}
		if (json['assigneeVos'] != null) {
			assigneeVos = new List<AssigneeAndCopyAssigneevo>();
			(json['assigneeVos'] as List).forEach((v) { assigneeVos.add(new AssigneeAndCopyAssigneevo.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.copyToList != null) {
      data['copyToList'] = this.copyToList.map((v) => v.toJson()).toList();
    }
		if (this.assigneeVos != null) {
      data['assigneeVos'] = this.assigneeVos.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class AssigneeAndCopyCopytolist {
	String departmentName;
	String correctionTime;
	String companyName;
	String departmentId;
	String mobile;
	String workingCity;
	String companyId;
	String workNumber;
	AssigneeAndCopyCopytolistPost post;
	dynamic createTime;
	String id;
	String timeOfEntry;
	String email;
	int formOfEmployment;
	int inServiceStatus;
	String username;

	AssigneeAndCopyCopytolist({this.departmentName, this.correctionTime, this.companyName, this.departmentId, this.mobile, this.workingCity, this.companyId, this.workNumber, this.post, this.createTime, this.id, this.timeOfEntry, this.email, this.formOfEmployment, this.inServiceStatus, this.username});

	AssigneeAndCopyCopytolist.fromJson(Map<String, dynamic> json) {
		departmentName = json['departmentName'];
		correctionTime = json['correctionTime'];
		companyName = json['companyName'];
		departmentId = json['departmentId'];
		mobile = json['mobile'];
		workingCity = json['workingCity'];
		companyId = json['companyId'];
		workNumber = json['workNumber'];
		post = json['post'] != null ? new AssigneeAndCopyCopytolistPost.fromJson(json['post']) : null;
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

class AssigneeAndCopyCopytolistPost {
	int postSort;
	String postName;
	String departmentId;
	String postCode;
	String id;
	String status;

	AssigneeAndCopyCopytolistPost({this.postSort, this.postName, this.departmentId, this.postCode, this.id, this.status});

	AssigneeAndCopyCopytolistPost.fromJson(Map<String, dynamic> json) {
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

class AssigneeAndCopyAssigneevo {
	int level;
	dynamic approveOpinion;
	dynamic agreeOrNot;
	String userName;
	String userId;

	AssigneeAndCopyAssigneevo({this.level, this.approveOpinion, this.agreeOrNot, this.userName, this.userId});

	AssigneeAndCopyAssigneevo.fromJson(Map<String, dynamic> json) {
		level = json['level'];
		approveOpinion = json['approveOpinion'];
		agreeOrNot = json['agreeOrNot'];
		userName = json['userName'];
		userId = json['userId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['level'] = this.level;
		data['approveOpinion'] = this.approveOpinion;
		data['agreeOrNot'] = this.agreeOrNot;
		data['userName'] = this.userName;
		data['userId'] = this.userId;
		return data;
	}
}
