class FlowOverviewEntity {
	int total;
	int pagesize;
	int page;
	List<FlowOverviewRow> rows;

	FlowOverviewEntity({this.total, this.pagesize, this.page, this.rows});

	FlowOverviewEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		pagesize = json['pagesize'];
		page = json['page'];
		if (json['rows'] != null) {
			rows = new List<FlowOverviewRow>();
			(json['rows'] as List).forEach((v) { rows.add(new FlowOverviewRow.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		data['pagesize'] = this.pagesize;
		data['page'] = this.page;
		if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class FlowOverviewRow {
	String summary;
	String processInstanceId;
	String createTime;
	String updateTime;
	int id;
	String title;
	String type;
	String userId;
	String status;

	FlowOverviewRow({this.summary, this.processInstanceId, this.createTime, this.updateTime, this.id, this.title, this.type, this.userId, this.status});

	FlowOverviewRow.fromJson(Map<String, dynamic> json) {
		summary = json['summary'];
		processInstanceId = json['processInstanceId'];
		createTime = json['createTime'];
		updateTime = json['updateTime'];
		id = json['id'];
		title = json['title'];
		type = json['type'];
		userId = json['userId'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['summary'] = this.summary;
		data['processInstanceId'] = this.processInstanceId;
		data['createTime'] = this.createTime;
		data['updateTime'] = this.updateTime;
		data['id'] = this.id;
		data['title'] = this.title;
		data['type'] = this.type;
		data['userId'] = this.userId;
		data['status'] = this.status;
		return data;
	}
}
