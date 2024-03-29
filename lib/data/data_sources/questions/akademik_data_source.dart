import 'package:cat_akademik_kepolisian/common/constants/constants.dart';
import 'package:cat_akademik_kepolisian/common/http_config/http_client.dart';
import 'package:cat_akademik_kepolisian/domain/entities/answer/answer_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/answer/answer_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_response_entity.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AkademikDataSource {
  final HttpClient client;

  const AkademikDataSource(this.client);

  Future<DataState<QuestionResponseEntity>> getAkademikQuestions() async {
    try {
      final result = await client.get(APIPath.akademik);
      return DataState.success(QuestionResponseEntity.fromJson(result.data));
    } on DioException catch (e) {
      return DataState.error('${e.message}', e.response?.statusCode.toString());
    } catch (e) {
      return const DataState.error('Unknown Error', '999');
    }
  }

  Future<DataState<AnswerResponseEntity>> submitAkademik(
      List<QuestionEntity> payload) async {
    try {
      final data = payload
          .map((e) {
            bool isAnswered = e.options.any((element) => element.isSelected);
            return QuestionAnsweredEntity(
                question: e.questionId,
                option: isAnswered
                    ? e.options.firstWhere((element) => element.isSelected).id
                    : '');
          })
          .where((element) => element.option.isNotEmpty)
          .toList();
      final result = await client.post(
        path: APIPath.submitAkademik,
        requestBody: AnswersEntity(answers: data).toJson(),
      );
      return DataState.success(AnswerResponseEntity.fromJson(result.data));
    } on DioException catch (e) {
      return DataState.error('${e.message}', e.response?.statusCode.toString());
    } catch (e) {
      return const DataState.error('Unknown Error', '999');
    }
  }
}
