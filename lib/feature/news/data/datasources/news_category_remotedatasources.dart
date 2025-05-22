import 'package:news_app/core/errors/serverException.dart';
import 'package:news_app/core/services/APi/app_network.dart';
import 'package:news_app/feature/news/data/model/news_category_Model.dart';
import 'package:dio/dio.dart';

abstract class NewscategoryRemoteDataSources {
  Future<List<NewsCategoryModel>> NewsCategoryList({required String category});
}

class NewsCategoryRemotedatasourcesImpl extends NewscategoryRemoteDataSources {
  final dio = Dio();
  @override
  Future<List<NewsCategoryModel>> NewsCategoryList({
    required String category,
  }) async {
    try {
      final response = await dio.get(
        "${AppNetwork.news_api}?category=$category&apiKey=${AppNetwork.new_api_key}",
        // queryParameters: {
        //   'category': category,
        //   'apiKey': AppNetwork.new_api_key,
        //   'country': 'us', // optional but usually needed for this API
        // },
      );
      if (response.statusCode == 200) {
        print(
          "${AppNetwork.news_api}?category=$category&apiKey=${AppNetwork.new_api_key}---------------APPppp${AppNetwork.new_api_key}",
        );
        print("SUCCCCCCCCCCCCESSSSS ${category}");
        final List<dynamic> payload = response.data['articles'];
        print("PAYYLOOADD $payload");
        return payload
            .map((e) => NewsCategoryModel.fromJson(e))
            .toList(); // ✅ Return the actual response data
      } else {
        print("Failed with status code: ${response.statusCode}");
        return [];
      }
    } on DioException catch (e) {
      print("Error fetching news: $e");
      throw ServerException(message: e.toString());
    }
  }
}
