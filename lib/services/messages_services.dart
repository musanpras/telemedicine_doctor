part of 'services.dart';

class MessagesServices {
  late SharedPreferences sharedPreferences;

  Future<List<MessagesModels>> getQuickMessages() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'quick-messages');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['quick_messages'];
      List<MessagesModels> quickMessages = [];
      for (var item in data) {
        quickMessages.add(MessagesModels.fromJson(item));
      }

      return quickMessages;
    } else {
      throw Exception('Gagal Dapatkan Data');
    }
  }

  Future<MessagesModels> addQuickMessage({
    String? title,
    String? desc,
  }) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'quick-message');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };
    var body = jsonEncode({
      'title': title,
      'detail': desc,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      MessagesModels addQuick = MessagesModels.fromJson(data);

      return addQuick;
    } else {
      throw Exception('Gagal Tambah Data');
    }
  }

  Future<MessagesModels> getDataQuickMessage(id) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'quick-message/$id');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      late MessagesModels dataQuickMessage = MessagesModels.fromJson(data);

      return dataQuickMessage;
    }
    throw Exception('Gagal Dapatkan Data');
  }
}
