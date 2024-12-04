import 'package:flutter/material.dart';
import 'package:i_lock_the_door/components/header.dart';
import 'package:i_lock_the_door/components/hourSelector.dart';

class EventRegisterView extends StatefulWidget {
  const EventRegisterView({super.key});

  @override
  State<EventRegisterView> createState() => _EventRegisterViewState();
}

class _EventRegisterViewState extends State<EventRegisterView> {
  List<String> _selectedDays = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(children: [
            Header(
              title: "Digite o nome do seu",
              darkTitle: "Compromisso",
              backCallback: () => Navigator.pop(context),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Nome do lembrete", border: OutlineInputBorder()),
            ),
            Text(
              "Quando?",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.w600, color: Color(0xFF573926)),
            ),
            Row(
              children: [
                dayOption("segunda", "S"),
                dayOption("terca", "T"),
                dayOption("quarta", "Q"),
                dayOption("quinta", "Q"),
                dayOption("sexta", "S"),
                dayOption("sabado", "S"),
                dayOption("domingo", "D"),
              ],
            ),
            Text(
              "Que horas?",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.w600, color: Color(0xFF573926)),
            ),
            HourSelector()
          ]),
        ),
      ),
    );
  }

  Widget dayOption(String key, String value) {
    return InkWell(
      onTap: () {
        if (_selectedDays.contains(key)) {
          _selectedDays.remove(key);
          setState(() {});
          return;
        }
        _selectedDays.add(key);
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.all(5),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(180),
            color: _selectedDays.contains(key)
                ? Theme.of(context).primaryColor
                : Color(0xFFFEF3E7)),
        child: Center(child: Text(value)),
      ),
    );
  }
}
