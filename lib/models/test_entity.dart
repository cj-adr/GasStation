class TestEntity {
	String path;
	String data;
	String errCode;
	bool success;
	TestThrowable throwable;
	String errMsg;

	TestEntity({this.path, this.data, this.errCode, this.success, this.throwable, this.errMsg});

	TestEntity.fromJson(Map<String, dynamic> json) {
		path = json['path'];
		data = json['data'];
		errCode = json['errCode'];
		success = json['success'];
		throwable = json['throwable'] != null ? new TestThrowable.fromJson(json['throwable']) : null;
		errMsg = json['errMsg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['path'] = this.path;
		data['data'] = this.data;
		data['errCode'] = this.errCode;
		data['success'] = this.success;
		if (this.throwable != null) {
      data['throwable'] = this.throwable.toJson();
    }
		data['errMsg'] = this.errMsg;
		return data;
	}
}

class TestThrowable {
	String localizedMessage;
	TestThrowableCause cause;
	List<TestThrowableStacktrace> stackTrace;
	List<String> suppressed;
	String message;

	TestThrowable({this.localizedMessage, this.cause, this.stackTrace, this.suppressed, this.message});

	TestThrowable.fromJson(Map<String, dynamic> json) {
		localizedMessage = json['localizedMessage'];
		cause = json['cause'] != null ? new TestThrowableCause.fromJson(json['cause']) : null;
		if (json['stackTrace'] != null) {
			stackTrace = new List<TestThrowableStacktrace>();(json['stackTrace'] as List).forEach((v) { stackTrace.add(new TestThrowableStacktrace.fromJson(v)); });
		}
		suppressed = json['suppressed']?.cast<String>();
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['localizedMessage'] = this.localizedMessage;
		if (this.cause != null) {
      data['cause'] = this.cause.toJson();
    }
		if (this.stackTrace != null) {
      data['stackTrace'] =  this.stackTrace.map((v) => v.toJson()).toList();
    }
		data['suppressed'] = this.suppressed;
		data['message'] = this.message;
		return data;
	}
}

class TestThrowableCause {
	String localizedMessage;
	String cause;
	List<TestThrowableCauseStacktrace> stackTrace;
	List<String> suppressed;
	String message;

	TestThrowableCause({this.localizedMessage, this.cause, this.stackTrace, this.suppressed, this.message});

	TestThrowableCause.fromJson(Map<String, dynamic> json) {
		localizedMessage = json['localizedMessage'];
		cause = json['cause'];
		if (json['stackTrace'] != null) {
			stackTrace = new List<TestThrowableCauseStacktrace>();(json['stackTrace'] as List).forEach((v) { stackTrace.add(new TestThrowableCauseStacktrace.fromJson(v)); });
		}
		suppressed = json['suppressed']?.cast<String>();
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['localizedMessage'] = this.localizedMessage;
		data['cause'] = this.cause;
		if (this.stackTrace != null) {
      data['stackTrace'] =  this.stackTrace.map((v) => v.toJson()).toList();
    }
		data['suppressed'] = this.suppressed;
		data['message'] = this.message;
		return data;
	}
}

class TestThrowableCauseStacktrace {
	String fileName;
	bool nativeMethod;
	String methodName;
	String className;
	int lineNumber;

	TestThrowableCauseStacktrace({this.fileName, this.nativeMethod, this.methodName, this.className, this.lineNumber});

	TestThrowableCauseStacktrace.fromJson(Map<String, dynamic> json) {
		fileName = json['fileName'];
		nativeMethod = json['nativeMethod'];
		methodName = json['methodName'];
		className = json['className'];
		lineNumber = json['lineNumber'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['fileName'] = this.fileName;
		data['nativeMethod'] = this.nativeMethod;
		data['methodName'] = this.methodName;
		data['className'] = this.className;
		data['lineNumber'] = this.lineNumber;
		return data;
	}
}

class TestThrowableStacktrace {
	String fileName;
	bool nativeMethod;
	String methodName;
	String className;
	int lineNumber;

	TestThrowableStacktrace({this.fileName, this.nativeMethod, this.methodName, this.className, this.lineNumber});

	TestThrowableStacktrace.fromJson(Map<String, dynamic> json) {
		fileName = json['fileName'];
		nativeMethod = json['nativeMethod'];
		methodName = json['methodName'];
		className = json['className'];
		lineNumber = json['lineNumber'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['fileName'] = this.fileName;
		data['nativeMethod'] = this.nativeMethod;
		data['methodName'] = this.methodName;
		data['className'] = this.className;
		data['lineNumber'] = this.lineNumber;
		return data;
	}
}
