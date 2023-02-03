import '../data_class/model_class.dart';

abstract class FetchState {}

class Initial extends FetchState {}

class FetchData extends FetchState {
  final List<ModelClass> fetchData;

  FetchData({
    required this.fetchData,
  });
}

class Error extends FetchState {
  final String msg;
  Error({required this.msg});
}