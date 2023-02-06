import '../data_class/fetch_data.dart';

abstract class FetchState {}

class Initial extends FetchState {}

class FetchData extends FetchState {
  final List<FetchUIData> fetchData;

  FetchData({
    required this.fetchData,
  });
}

class Error extends FetchState {
  final String msg;
  Error({required this.msg});
}