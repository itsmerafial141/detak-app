import 'dart:convert';

import 'package:detakapp/app/modules/kusioner/models/answer_model.dart';
import 'package:detakapp/app/modules/kusioner/models/kuisoner_model.dart';
import 'package:get/get.dart';

class KuisonerProvider extends GetConnect {
  final url = 'https://detak.bgskr-project.my.id';
  Future<KuisonerModel> getKuisonerList() async {
    final response = await get("$url/api/sadari/question");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["status"] != false) {
        return kuisonerModelFromJson(response.bodyString.toString());
      } else {
        return Future.error(
          response.body["message"].toString(),
        );
      }
    }
  }

  Future<AnswerModel> answer({
    required List<String> answer,
    required String email,
  }) async {
    final body = json.encode({
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
    });
    final response = await post(
      "$url/api/sadari/jawab",
      body,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["status"] != false) {
        return answerModelFromJson(response.bodyString.toString());
      } else {
        return Future.error(
          response.body["message"].toString(),
        );
      }
    }
  }
}
