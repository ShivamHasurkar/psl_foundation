import 'package:psl_foundation/Data/task.dart';

class ActivityModel {
  String? _activityId;
  String? _title;
  String? _description;
  String? _activityType;
  String? _date;
  String? _location;
  String? _whatsappChatLink;
  String? _activityOwner;
  String? _notificationDuration;
  String? _livesTouched;
  String? _imageURL;
  List<Task>? _task;
  List? _registeredEmployees = [];
  List? _like = [];

  ActivityModel(
      {String? activityId,
      String? title,
      String? description,
      String? activityType,
      String? date,
      String? location,
      String? whatsappChatLink,
      String? activityOwner,
      String? notificationDuration,
      String? livesTouched,
        String? imageURL,
      List<Task>? task,
      List? registeredEmployees,
      List? like}) {
    if (activityId != null) {
      this._activityId = activityId;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (activityType != null) {
      this._activityType = activityType;
    }
    if (date != null) {
      this._date = date;
    }
    if (location != null) {
      this._location = location;
    }
    if (whatsappChatLink != null) {
      this._whatsappChatLink = whatsappChatLink;
    }
    if (activityOwner != null) {
      this._activityOwner = activityOwner;
    }
    if (notificationDuration != null) {
      this._notificationDuration = notificationDuration;
    }
    if (livesTouched != null) {
      this._livesTouched = livesTouched;
    }
    if (imageURL != null) {
      this._imageURL = imageURL;
    }
    if (task != null) {
      this._task = task;
    }
    if (registeredEmployees != null) {
      this._registeredEmployees = registeredEmployees;
    }
    if (like != null) {
      this._like = like;
    }
  }

  String? get activityId => _activityId;
  set activityId(String? activityId) => _activityId = activityId;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get activityType => _activityType;
  set activityType(String? activityType) => _activityType = activityType;
  String? get date => _date;
  set date(String? date) => _date = date;
  String? get location => _location;
  set location(String? location) => _location = location;
  String? get whatsappChatLink => _whatsappChatLink;
  set whatsappChatLink(String? whatsappChatLink) =>
      _whatsappChatLink = whatsappChatLink;
  String? get activityOwner => _activityOwner;
  set activityOwner(String? activityOwner) => _activityOwner = activityOwner;
  String? get notificationDuration => _notificationDuration;
  set notificationDuration(String? notificationDuration) =>
      _notificationDuration = notificationDuration;
  String? get livesTouched => _livesTouched;
  set livesTouched(String? livesTouched) => livesTouched = livesTouched;
  String? get imageURL => _imageURL;
  set imageURL(String? imageURL) => _imageURL = imageURL;
  List<Task>? get task => _task;
  set task(List<Task>? task) => _task = task;
  List? get registeredEmployees => _registeredEmployees;
  set registeredEmployees(List? registeredEmployees) =>
      _registeredEmployees = registeredEmployees!;
  List? get like => _like;
  set like(List? like) => _like = like!;
  ActivityModel.fromJson(Map<String, dynamic> json) {
    _activityId = json['Activity_Id'];
    _title = json['Title'];
    _description = json['Description'];
    _activityType = json['Activity_Type'];
    _date = json['Date'];
    _location = json['Location'];
    _whatsappChatLink = json['Whatsapp_Chat_Link'];
    _activityOwner = json['Activity_Owner'];
    _notificationDuration = json['Notification_Duration'];
    _livesTouched = json['Lives_Touched'];
    _imageURL = json['ImageURL'];
    _registeredEmployees = json['Registered_Employees'];
    if (json['Task'] != null) {
      _task = <Task>[];
      json['Task'].forEach((v) {
        _task!.add(new Task.fromJson(v));
      });
      _like = json['Like'].cast<int>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Activity_Id'] = this._activityId;
    data['Title'] = this._title;
    data['Description'] = this._description;
    data['Activity_Type'] = this._activityType;
    data['Date'] = this._date;
    data['Location'] = this._location;
    data['Whatsapp_Chat_Link'] = this._whatsappChatLink;
    data['Activity_Owner'] = this._activityOwner;
    data['Notification_Duration'] = this._notificationDuration;
    data['Lives_Touched'] = this._livesTouched;
    data['ImageURL'] = this._imageURL;
    data['Registered_Employees'] = this._registeredEmployees;
    if (this._task != null) {
      data['Task'] = this._task!.map((v) => v.toJson()).toList();
    }
    data['Like'] = this._like;
    return data;
  }

  void addToList(List<Task> value) {
    if(value[0].title != Null) {
      task = value;
    }
  }
}
