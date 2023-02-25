class Task {
  String? _taskId;
  String? _title;
  String? _description;
  String? _noOfVolunteers;

  Task(
      {String? taskId,
        String? title,
        String? description,
        String? noOfVolunteers}) {
    if (taskId != null) {
      this._taskId = taskId;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (noOfVolunteers != null) {
      this._noOfVolunteers = noOfVolunteers;
    }
  }

  String? get taskId => _taskId;
  set taskId(String? taskId) => _taskId = taskId;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get noOfVolunteers => _noOfVolunteers;
  set noOfVolunteers(String? noOfVolunteers) => _noOfVolunteers = noOfVolunteers;

  Task.fromJson(Map<String, dynamic> json) {
    _taskId = json['Task_id'];
    _title = json['Title'];
    _description = json['Description'];
    _noOfVolunteers = json['No_Of_Volunteers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Task_id'] = this._taskId;
    data['Title'] = this._title;
    data['Description'] = this._description;
    data['No_Of_Volunteers'] = this._noOfVolunteers;
    return data;
  }
}