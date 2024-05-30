abstract class SubmittedProductState {}

class DataInitial extends SubmittedProductState {}

class DataLoading extends SubmittedProductState {}

class DataLoaded extends SubmittedProductState {
  final List<dynamic> data;
  DataLoaded(this.data);
}

class DataError extends SubmittedProductState {
  final String message;
  DataError(this.message);
}
