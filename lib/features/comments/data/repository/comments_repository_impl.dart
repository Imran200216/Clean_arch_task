import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/comments/data/datasources/comments_remote_datasource.dart';
import 'package:post_clean_arch/features/comments/domain/entities/comments_entity.dart';
import 'package:post_clean_arch/features/comments/domain/repository/comments_repository.dart';


@LazySingleton(as: CommentsRepository)
class CommentsRepositoryImpl implements CommentsRepository {
  final CommentsRemoteDatasource commentsRemoteDatasource;

  CommentsRepositoryImpl(this.commentsRemoteDatasource);

  @override
  Future<List<CommentsEntity>> getComments() async {
    return await commentsRemoteDatasource.fetchComments();
  }
}
