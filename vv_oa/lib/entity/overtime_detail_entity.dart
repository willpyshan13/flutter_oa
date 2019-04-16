class OvertimeDetailEntity {
	String summary;
	String processInstanceId;
	int flowOverviewId;
	String extraWorkEndTime;
	String updateTime;
	dynamic remark;
	String extraWorkStartTime;
	String title;
	String type;
	String userId;
	String extraWorkHours;
	List<OvertimeDetailCopytolist> copyToList;
	int extraWorkType;
	String extraWorkReason;
	String createTime;
	dynamic extraWorkDays;
	int id;
	String assignee;
	dynamic taskId;
	String status;
	List<OvertimeDetailAssigneevo> assigneeVos;

	OvertimeDetailEntity({this.summary, this.processInstanceId, this.flowOverviewId, this.extraWorkEndTime, this.updateTime, this.remark, this.extraWorkStartTime, this.title, this.type, this.userId, this.extraWorkHours, this.copyToList, this.extraWorkType, this.extraWorkReason, this.createTime, this.extraWorkDays, this.id, this.assignee, this.taskId, this.status, this.assigneeVos});

	OvertimeDetailEntity.fromJson(Map<String, dynamic> json) {
		summary = json['summary'];
		processInstanceId = json['processInstanceId'];
		flowOverviewId = json['flowOverviewId'];
		extraWorkEndTime = json['extraWorkEndTime'];
		updateTime = json['updateTime'];
		remark = json['remark'];
		extraWorkStartTime = json['extraWorkStartTime'];
		title = json['title'];
		type = json['type'];
		userId = json['userId'];
		extraWorkHours = json['extraWorkHours'];
		if (json['copyToList'] != null) {
			copyToList = new List<OvertimeDetailCopytolist>();
			(json['copyToList'] as List).forEach((v) { copyToList.add(new OvertimeDetailCopytolist.fromJson(v)); });
		}
		extraWorkType = json['extraWorkType'];
		extraWorkReason = json['extraWorkReason'];
		createTime = json['createTime'];
		extraWorkDays = json['extraWorkDays'];
		id = json['id'];
		assignee = json['assignee'];
		taskId = json['taskId'];
		status = json['status'];
		if (json['assigneeVos'] != null) {
			assigneeVos = new List<OvertimeDetailAssigneevo>();
			(json['assigneeVos'] as List).forEach((v) { assigneeVos.add(new OvertimeDetailAssigneevo.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['summary'] = this.summary;
		data['processInstanceId'] = this.processInstanceId;
		data['flowOverviewId'] = this.flowOverviewId;
		data['extraWorkEndTime'] = this.extraWorkEndTime;
		data['updateTime'] = this.updateTime;
		data['remark'] = this.remark;
		data['extraWorkStartTime'] = this.extraWorkStartTime;
		data['title'] = this.title;
		data['type'] = this.type;
		data['userId'] = this.userId;
		data['extraWorkHours'] = this.extraWorkHours;
		if (this.copyToList != null) {
      data['copyToList'] = this.copyToList.map((v) => v.toJson()).toList();
    }
		data['extraWorkType'] = this.extraWorkType;
		data['extraWorkReason'] = this.extraWorkReason;
		data['createTime'] = this.createTime;
		data['extraWorkDays'] = this.extraWorkDays;
		data['id'] = this.id;
		data['assignee'] = this.assignee;
		data['taskId'] = this.taskId;
		data['status'] = this.status;
		if (this.assigneeVos != null) {
      data['assigneeVos'] = this.assigneeVos.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class OvertimeDetailCopytolist {
	String departmentName;
	String correctionTime;
	String companyName;
	String departmentId;
	String mobile;
	String workingCity;
	String companyId;
	String workNumber;
	OvertimeDetailCopytolistPost post;
	dynamic createTime;
	String id;
	String timeOfEntry;
	String email;
	int formOfEmployment;
	int inServiceStatus;
	String username;

	OvertimeDetailCopytolist({this.departmentName, this.correctionTime, this.companyName, this.departmentId, this.mobile, this.workingCity, this.companyId, this.workNumber, this.post, this.createTime, this.id, this.timeOfEntry, this.email, this.formOfEmployment, this.inServiceStatus, this.username});

	OvertimeDetailCopytolist.fromJson(Map<String, dynamic> json) {
		departmentName = json['departmentName'];
		correctionTime = json['correctionTime'];
		companyName = json['companyName'];
		departmentId = json['departmentId'];
		mobile = json['mobile'];
		workingCity = json['workingCity'];
		companyId = json['companyId'];
		workNumber = json['workNumber'];
		post = json['post'] != null ? new OvertimeDetailCopytolistPost.fromJson(json['post']) : null;
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

class OvertimeDetailCopytolistPost {
	int postSort;
	String postName;
	String departmentId;
	String postCode;
	String id;
	String status;

	OvertimeDetailCopytolistPost({this.postSort, this.postName, this.departmentId, this.postCode, this.id, this.status});

	OvertimeDetailCopytolistPost.fromJson(Map<String, dynamic> json) {
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

class OvertimeDetailAssigneevo {
	int level;
	dynamic approveOpinion;
	dynamic agreeOrNot;
	String userName;
	String userId;

	OvertimeDetailAssigneevo({this.level, this.approveOpinion, this.agreeOrNot, this.userName, this.userId});

	OvertimeDetailAssigneevo.fromJson(Map<String, dynamic> json) {
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
