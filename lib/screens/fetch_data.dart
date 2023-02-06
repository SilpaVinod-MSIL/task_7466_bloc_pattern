import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_7466_bloc_pattern/bloc_logic/Fetchstate.dart';
import 'package:task_7466_bloc_pattern/screens/padding_style.dart';
import 'package:task_7466_bloc_pattern/screens/text_style.dart';

import '../bloc_logic/fetch_bloc.dart';
import '../bloc_logic/fetch_event.dart';

class FullData extends StatefulWidget {
  const FullData({Key? key}) : super(key: key);

  @override
  State<FullData> createState() => _FullDataState();
}

class _FullDataState extends State<FullData> {
  FetchBloc fetchbloc = FetchBloc();

  @override
  void initState() {
    fetchbloc.add(FetchDataEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => fetchbloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Fetch Data"),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<FetchBloc, FetchState>(
          builder: (context, state) {
            if (state is Initial) {
              return Center(
                child: Image.asset('assets/images.png'),
              );
            } else if (state is FetchData) {
              return ListView.builder(
                  itemCount: state.fetchData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                          color: Colors.white60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                              leading: Container(width: 30,height: 30,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.lightBlueAccent),
                                child: Center(
                                  child: TextUI(state.fetchData[index].id.toString(),Colors.black)),),
                              trailing: TextUI(state.fetchData[index].albumId.toString(),Colors.lightBlueAccent),
                              title: PaddingClass(state.fetchData[index].title.toUpperCase(),Colors.purple,FontWeight.bold,FontStyle.normal,TextDecoration.none),
                              subtitle: PaddingClass(state.fetchData[index].thumbnailUrl,Colors.blue,FontWeight.normal,FontStyle.italic,TextDecoration.underline),
                          )),
                    );
                  });
            } else {
              return const Center(child: Text("Data Not available"));
            }
          },
        ),
      ),
    );
  }
}
