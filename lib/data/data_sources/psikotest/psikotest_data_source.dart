import 'package:cat_akademik_kepolisian/common/constants/constants.dart';
import 'package:cat_akademik_kepolisian/common/http_config/http_client.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_response_entity.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PsikotestDataSource {
  final HttpClient client;

  const PsikotestDataSource(this.client);
  Future<DataState<QuestionResponseEntity>> getPsikotestQuestions() async {
    try {
      final result = await client.get(APIPath.psikotest);
      return DataState.success(QuestionResponseEntity.fromJson(result.data));
    } on DioException catch (e) {
      return DataState.error('${e.message}', e.response?.statusCode.toString());
    } catch (e) {
      return const DataState.error('Unknown Error', '999');
    }
  }

  Future<DataState<bool>> submitPsikotest() async {
    return const DataState.success(true);
  }
}
