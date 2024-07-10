part of 'books_cubit.dart';

class BooksState {
  final FormzSubmissionStatus status;
  final String msg;
  final List<BookResponse> bookResponse;
  const BooksState(
      {this.status = FormzSubmissionStatus.initial,
      this.msg = '',
      this.bookResponse = const []});
  List<Object?> get props => [status, msg, bookResponse];

  BooksState copyWith(
          {FormzSubmissionStatus? status,
          String? msg,
          List<BookResponse>? bookResponse}) =>
      BooksState(
          status: status ?? this.status,
          msg: msg ?? this.msg,
          bookResponse: bookResponse ?? this.bookResponse);
}
