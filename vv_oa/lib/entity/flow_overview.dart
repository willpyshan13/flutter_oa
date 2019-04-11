class FlowOverview{
  List<FlowOverviewData> rows;
  int page;
  int pageSize;
  int total;
  FlowOverview(this.rows ,this.page,this.pageSize,this.total);
  FlowOverview.fromJson(Map<String, dynamic> json)
      : rows = json['rows'],
        page = json['page'],
        pageSize = json['pagesize'],
        total = json['total'];
  Map<String,dynamic> toJson() =>{
    'rows': rows,
    'pagesize': pageSize,
    'page': page,
    'total': total,
  };
}

class FlowOverviewData{
  int id;
  String createTime;
  String updateTime;
  int userId;
  String title;
  String summary;
  String type;
  String status;
  String processInstanceId;

  FlowOverviewData(this.id, this.createTime, this.updateTime, this.userId,
      this.title, this.summary, this.type, this.status, this.processInstanceId);

  FlowOverviewData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createTime = json['createTime'],
        updateTime = json['updateTime'],
        title = json['title'],
        summary = json['summary'],
        type = json['type'],
        status = json['status'],
        processInstanceId = json['processInstanceId'],
        userId = json['userId'];

}