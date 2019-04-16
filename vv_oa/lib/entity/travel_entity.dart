class TravelEntity {
	String reason;
	String amount;
	String targetCity;
	String startTimeType;
	String remark;
	String transportation;
	String endTimeType;
	String leaderId;
	String withMan;
	String strokeType;
	int days;
	String startTime;
	String durations;
	String endTime;
	String leaveCity;

	TravelEntity({this.reason, this.amount, this.targetCity, this.startTimeType, this.remark, this.transportation, this.endTimeType, this.leaderId, this.withMan, this.strokeType, this.days, this.startTime, this.durations, this.endTime, this.leaveCity});

	TravelEntity.fromJson(Map<String, dynamic> json) {
		reason = json['reason'];
		amount = json['amount'];
		targetCity = json['targetCity'];
		startTimeType = json['startTimeType'];
		remark = json['remark'];
		transportation = json['transportation'];
		endTimeType = json['endTimeType'];
		leaderId = json['leaderId'];
		withMan = json['withMan'];
		strokeType = json['strokeType'];
		days = json['days'];
		startTime = json['startTime'];
		durations = json['durations'];
		endTime = json['endTime'];
		leaveCity = json['leaveCity'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['reason'] = this.reason;
		data['amount'] = this.amount;
		data['targetCity'] = this.targetCity;
		data['startTimeType'] = this.startTimeType;
		data['remark'] = this.remark;
		data['transportation'] = this.transportation;
		data['endTimeType'] = this.endTimeType;
		data['leaderId'] = this.leaderId;
		data['withMan'] = this.withMan;
		data['strokeType'] = this.strokeType;
		data['days'] = this.days;
		data['startTime'] = this.startTime;
		data['durations'] = this.durations;
		data['endTime'] = this.endTime;
		data['leaveCity'] = this.leaveCity;
		return data;
	}
}