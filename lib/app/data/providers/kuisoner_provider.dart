import 'package:detakapp/app/data/models/answer_model.dart';
import 'package:detakapp/app/data/models/kuisoner_model.dart';
import 'package:detakapp/core/values/keys/end_point_key.dart';
import 'package:detakapp/services/base_service.dart';

class KuisonerProvider extends BaseService {
  Future<KuisonerModel> getKuisonerList() async {
    var response = await get(EndPoint.question);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["status"] == false) {
        return Future.error(response.body["message"].toString());
      } else {
        return kuisonerModelFromJson(response.bodyString.toString());
      }
    }
  }

  Future<AnswerModel> answer({
    required List<String> answer,
    required String email,
  }) async {
    final body = {
      "email": email,
      "answer1": answer[0],
      "answer2": answer[1],
      "answer3": answer[2],
      "answer4": answer[3],
      "answer5": answer[4],
      "answer6": answer[5],
      "answer7": answer[6],
      "answer8": answer[7],
      "answer9": answer[8],
      "answer10": answer[9],
      "answer11": answer[10],
      "answer12": answer[11],
      "answer13": answer[12],
    };
    var response = await post(EndPoint.jawab, body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["status"] == false) {
        return Future.error(response.body["message"].toString());
      } else {
        return answerModelFromJson(response.bodyString.toString());
      }
    }
  }
}
