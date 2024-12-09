import 'package:flutter/material.dart';
import 'package:i_lock_the_door/components/header.dart';
import 'package:i_lock_the_door/components/hourSelector.dart';
import 'package:i_lock_the_door/consts.dart';
import 'package:i_lock_the_door/models/event.dart';
import 'package:i_lock_the_door/services/infoService.dart';

class EventRegisterView extends StatefulWidget {
  const EventRegisterView({super.key});

  @override
  State<EventRegisterView> createState() => _EventRegisterViewState();
}

class _EventRegisterViewState extends State<EventRegisterView> {
  List<int> _selectedDays = [];
  TextEditingController name = TextEditingController(text: "");
  DateTime? time = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                title: "Digite o nome do seu",
                darkTitle: "Compromisso",
                backCallback: () => Navigator.pop(context),
              ),

              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Nome do lembrete",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 30), // Espaço entre os elementos

              Text(
                "Quando?",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF573926),
                    ),
              ),

              SizedBox(height: 10), // Espaço entre o título e os botões

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: daysNamed.entries.map((e) => dayOption(e.key)).toList()
              ),

              SizedBox(height: 30), // Espaço entre os elementos

              Text(
                "Que horas?",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF573926),
                    ),
              ),

              SizedBox(height: 10), // Espaço antes do HourSelector

              HourSelector(
                onChange: (e) {
                  time = e;
                  print(e);
                },
              ),

              SizedBox(height: 30), // Espaço antes do botão

              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await saveEvent(EventDTO(
                        days: _selectedDays, time: time!, name: name.text));
                    Navigator.pop(context);
                  },
                  child: Text("Salvar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dayOption(String key) {
    String value = key[0].toUpperCase(); 
    return InkWell(
      onTap: () {
        if (_selectedDays.contains(key)) {
          _selectedDays.remove(key);
          setState(() {});
          return;
        }

        _selectedDays.add(daysNamed[key]!["order"]!);
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
              : Color(0xFFFEF3E7),
        ),
        child: Center(
          child: Text(value),
        ),
      ),
    );
  }
}
