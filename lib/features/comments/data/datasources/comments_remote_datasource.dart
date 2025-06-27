import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/core/network/api_service.dart';
import 'package:post_clean_arch/features/comments/data/models/comments_model.dart';


@lazySingleton
class CommentsRemoteDatasource {
  final ApiService apiService;

  CommentsRemoteDatasource(this.apiService);

  Future<List<CommentsModel>> fetchComments() async {
    final response = await apiService.getUsers();
    final data = response.data['comments'] as List;
    return data.map((json) => CommentsModel.fromJson(json)).toList();
  }
}
