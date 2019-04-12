class ExtraWorkEntity {
	List<String> copyTo;
	int extraWorkType;
	String extraWorkReason;
	String extraWorkEndTime;
	String extraWorkStartTime;
	int extraWorkHours;

	ExtraWorkEntity({this.copyTo, this.extraWorkType, this.extraWorkReason, this.extraWorkEndTime, this.extraWorkStartTime, this.extraWorkHours});

	ExtraWorkEntity.fromJson(Map<String, dynamic> json) {
		copyTo = json['copyTo'].cast<String>();
		extraWorkType = json['extraWorkType'];
		extraWorkReason = json['extraWorkReason'];
		extraWorkEndTime = json['extraWorkEndTime'];
		extraWorkStartTime = json['extraWorkStartTime'];
		extraWorkHours = json['extraWorkHours'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['copyTo'] = this.copyTo;
		data['extraWorkType'] = this.extraWorkType;
		data['extraWorkReason'] = this.extraWorkReason;
		data['extraWorkEndTime'] = this.extraWorkEndTime;
		data['extraWorkStartTime'] = this.extraWorkStartTime;
		data['extraWorkHours'] = this.extraWorkHours;
		return data;
	}
}
