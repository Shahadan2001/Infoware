import 'package:api_repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  final UserRepository userRepository;
  BooksCubit(this.userRepository) : super(const BooksState()) {
    _init();
  }
  _init() {
    getBookDetails();
  }

  Future<void> getBookDetails() async {
    if (state.status == FormzSubmissionStatus.inProgress) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    var result = await userRepository.getBookDetails();
    if (result.isNotEmpty) {
      emit(state.copyWith(
          status: FormzSubmissionStatus.success, bookResponse: result));
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
