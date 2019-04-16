class StartGoutBillEntity {
	String goutReason;
	String goutEndTime;
	int goutHours;
	String goutStartTime;
	String leaderId;

	StartGoutBillEntity({this.goutReason, this.goutEndTime, this.goutHours, this.goutStartTime, this.leaderId});

	StartGoutBillEntity.fromJson(Map<String, dynamic> json) {
		goutReason = json['goutReason'];
		goutEndTime = json['goutEndTime'];
		goutHours = json['goutHours'];
		goutStartTime = json['goutStartTime'];
		leaderId = json['leaderId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['goutReason'] = this.goutReason;
		data['goutEndTime'] = this.goutEndTime;
		data['goutHours'] = this.goutHours;
		data['goutStartTime'] = this.goutStartTime;
		data['leaderId'] = this.leaderId;
		return data;
	}
}
