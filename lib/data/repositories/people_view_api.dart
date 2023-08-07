import 'package:dio/dio.dart';
import 'package:dreambit/data/models/person.dart';
import 'package:dreambit/services/log_helper.dart';

class PeopleViewApi {
  PeopleViewApi(this._dio);

  final Dio _dio;

  Future<Person?> getPerson({
    required String nationalityCode,
    required String gender,
  }) async {
    try {
      final response = await _dio.get('', queryParameters: {
        'gender': gender,
        'nat': nationalityCode,
      });
      return Person.fromJson(response.data['results'][0]);
    } catch (e) {
      logError('Error while getting person: $e');
      return null;
    }
  }
}
