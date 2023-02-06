import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_7466_bloc_pattern/bloc_logic/Fetchstate.dart';

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
                                  child: textUI(state.fetchData[index].id.toString(),Colors.black)),),
                              trailing: textUI(state.fetchData[index].albumId.toString(),Colors.lightBlueAccent),
                              title: textPadding(state.fetchData[index].title.toUpperCase(),Colors.purple,FontWeight.bold,FontStyle.normal,TextDecoration.none),
                              subtitle: textPadding(state.fetchData[index].thumbnailUrl,Colors.blue,FontWeight.normal,FontStyle.italic,TextDecoration.underline),
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

  textPadding(String text, Color colorText, FontWeight weight, FontStyle styleText, TextDecoration decorationText) {
    return Padding(
      padding:
      const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        text,
        style: TextStyle(
            decoration: decorationText,
            fontSize: 15,
            color: colorText,
            fontWeight: weight,
            fontStyle: styleText),
      ),
    );
  }

  textUI(String text, Color col) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: col),
    );
  }
}
