import 'package:cat_akademik_kepolisian/common/constants/constants.dart';
import 'package:cat_akademik_kepolisian/common/storage/shared_preferences_config.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthLocalDataSource {
  final SharedPreferencesConfig sp;

  const AuthLocalDataSource(this.sp);
  Future<DataState<bool>> saveToken(String token) async {
    try {
      final result = await sp.setString(Constants.tokenKey, token);
      return DataState.success(result);
    } catch (e) {
      return const DataState.error('Unknown Error', '999');
    }
  }
}
