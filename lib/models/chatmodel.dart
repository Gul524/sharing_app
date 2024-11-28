class ChatModel {
  String? name;
  int? phone;
  List<Messages>? messages;

  ChatModel({this.name, this.phone, this.messages});

  ChatModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  String? type;
  String? message;
  String? time;
  String? date;

  Messages({this.type, this.message, this.time, this.date});

  Messages.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    time = json['time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    data['time'] = time;
    data['date'] = date;
    return data;
  }
}
