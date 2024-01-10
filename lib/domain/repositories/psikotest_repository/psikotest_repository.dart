import 'package:cat_akademik_kepolisian/domain/entities/questions/response_entity.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';

abstract class PsikotestRespository {
  Future<DataState<ResponseEntity>> getPsikotestQuestions();
}
