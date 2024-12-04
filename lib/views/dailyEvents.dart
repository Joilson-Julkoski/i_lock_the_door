import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:i_lock_the_door/components/eventsCard.dart';
import 'package:i_lock_the_door/components/header.dart';
import 'package:i_lock_the_door/models/infos.dart';
import 'package:i_lock_the_door/views/eventRegister.dart';

class DailyEventsView extends StatefulWidget {
  final InfosDTO userInfo;
  const DailyEventsView({super.key, required this.userInfo});

  @override
  State<DailyEventsView> createState() => _DailyEventsViewState();
}

class _DailyEventsViewState extends State<DailyEventsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              title: "Agendar seus",
              darkTitle: "Lembretes Diários",
              backCallback: () => Navigator.pop(context),
              text: "Configure horários de saída",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...mountEvents(),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      dashPattern: [12, 8],
                      padding: EdgeInsets.all(6),
                      color: Color(0xFFFE8235),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventRegisterView()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          height: 120,
                          width: double.infinity,
                          child: Center(
                            child: Icon(
                              Icons.add_rounded,
                              color: Color(0xFFFE8235),
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> mountEvents() {
    List<Widget> list = [];

    for (var e in widget.userInfo.events) {
      list.add(EventCard(event: e));
    }
    return list;
  }
}
