import 'package:bloc/bloc.dart';
import 'package:task_7466_bloc_pattern/bloc_logic/Fetchstate.dart';
import '../data_class/model_class.dart';
import '../data_class/rest_api.dart';
import 'fetch_event.dart';


class FetchBloc extends Bloc<DataEvent, FetchState> {
  late List<ModelClass> resonsedata;
  ApiResponse resonse= ApiResponse();
  FetchBloc() : super(Initial()) {
    on<DataEvent>((event, emit) async{
      if (event is FetchDataEvent) {
        resonsedata = await resonse.fetchData();
          if (resonsedata.isEmpty) {
            emit(Error(msg: "No data available"));
          } else {
            emit(FetchData(fetchData: resonsedata));
          }
      }
    });
  }
}


