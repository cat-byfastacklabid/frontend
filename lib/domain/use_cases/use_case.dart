import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';

class EmptyParams {}

abstract class UseCase<Return, Params> {
  Future<DataState<Return>> call(Params params);
}
