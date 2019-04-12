class CommonResponse {
	int code;
	String data;
	bool success;
	String message;
	dynamic status;
	String currentAuthority;

	CommonResponse({this.code, this.data, this.success, this.message, this.status, this.currentAuthority});

	CommonResponse.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		data = json['data'];
		success = json['success'];
		message = json['message'];
		status = json['status'];
		currentAuthority = json['currentAuthority'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['data'] = this.data;
		data['success'] = this.success;
		data['message'] = this.message;
		data['status'] = this.status;
		data['currentAuthority'] = this.currentAuthority;
		return data;
	}
}
