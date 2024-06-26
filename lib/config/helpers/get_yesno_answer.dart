import 'package:dio/dio.dart';
import 'package:primera_app/domain/entities/message.dart';
import 'package:primera_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer{
  final _dio = Dio();

  Future<Message> getAnswer() async {

    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    return Message(
      text: yesNoModel.answer,
      fromWho: FromWho.others,
      imageUrl: yesNoModel.image
    );
  }

}