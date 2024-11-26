import 'package:flutter/material.dart';
import 'package:i_lock_the_door/models/infos.dart';
import 'package:i_lock_the_door/utils/date.dart';

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
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () => {Navigator.pop(context)},
                  icon: Icon(Icons.arrow_back_ios_new_rounded)),
            ],
          ),
          Text(
            "Seu histórico",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            "Da Semana",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
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
      list.add(Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFFF8500).withOpacity(0.11),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Última atualização",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w800)),
                  Text("Porta Trancada",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 12)),
                  Text(formatDateTime(e),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w500)),
                  Text(
                    "Visualizar histórico",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                        color: Color(0xFFFE8235),
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(20)),
              Image.asset("assets/images/doc.png")
            ]),
      ));
    }
    return list;
  }
}
