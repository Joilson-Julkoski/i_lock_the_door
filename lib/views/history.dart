import 'package:flutter/material.dart';
import 'package:i_lock_the_door/components/header.dart';
import 'package:i_lock_the_door/components/historyCard.dart';
import 'package:i_lock_the_door/models/infos.dart';

class HistoryView extends StatefulWidget {
  final InfosDTO userInfo;
  const HistoryView({super.key, required this.userInfo});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
              title: "Seu histórico",
              darkTitle: "Da Semana",
              backCallback: () => Navigator.pop(context)),
          Expanded(
            child:
                SingleChildScrollView(child: Column(children: mountHistory())),
          )
        ],
      ),
    );
  }

  List<Widget> mountHistory() {
    List<Widget> list = [];

    for (var e in widget.userInfo.history.reversed) {
      list.add(HistoryCard(history: e));
    }
    return list;
  }
}
