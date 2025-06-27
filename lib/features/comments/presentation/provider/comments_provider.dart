import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/comments/domain/entities/comments_entity.dart';
import 'package:post_clean_arch/features/comments/domain/usecases/get_comments_usecase.dart';

@Injectable()
class CommentsProvider extends ChangeNotifier {
  final GetCommentsUsecase getCommentsUsecase;

  CommentsProvider(this.getCommentsUsecase);

  List<CommentsEntity> comments = [];

  bool isLoading = false;

  Future<void> fetchComments() async {
    isLoading = true;

    notifyListeners();

    comments = await getCommentsUsecase();

    isLoading = false;

    notifyListeners();
  }
}
