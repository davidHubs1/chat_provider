import 'package:chat_provider_ia/model/yes_no_model.dart';
import 'package:chat_provider_ia/provider/message.dart';
import 'package:dio/dio.dart';

class GetYesNoModel {
  final _dio = Dio();

  Future<Message> yesAnswer() async {
    final responde = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJson(responde.data);
    return yesNoModel.toMessageEntity();
  }
}
