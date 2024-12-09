import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_lock_the_door/utils/date.dart';

class HourSelector extends StatefulWidget {
  final Function onChange;
  const HourSelector({super.key, required this.onChange});

  @override
  State<HourSelector> createState() => _HourSelectorState();
}

class _HourSelectorState extends State<HourSelector> {
  TextEditingController hour = TextEditingController(text: "00");
  TextEditingController minutes = TextEditingController(text: "00");
  bool isAm = true;
  DateTime time = DateTime.now();

  void handleChange() {
    time = updateTime(time, int.tryParse(hour.text) ?? 0, int.tryParse(minutes.text) ?? 0);
    widget.onChange(time);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "INSIRA O HORÁRIO",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Color(0xFF707070), fontSize: 11, letterSpacing: 2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    child: TextField(
                      controller: hour,
                      onChanged: (e) => handleChange(),
                      style: TextStyle(
                        height: 3,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '00', // Exemplo de valor padrão
                        // contentPadding:
                        //     EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                      ),
                      keyboardType: TextInputType.number, // Ajuste para números
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Apenas números
                        LengthLimitingTextInputFormatter(
                            2), // Limitar a 2 caracteres
                      ],
                    ),
                  ),
                  Text(
                    "Hora",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Color(0xFF707070),
                        ),
                  )
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Container(
                    child: TextField(
                      controller: minutes,
                      onChanged: (e) => handleChange(),
                      style: TextStyle(
                        height: 3,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '00', // Exemplo de valor padrão
                        // contentPadding:
                        //     EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                      ),
                      keyboardType: TextInputType.number, // Ajuste para números
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Apenas números
                        LengthLimitingTextInputFormatter(
                            2), // Limitar a 2 caracteres
                      ],
                    ),
                  ),
                  Text(
                    "Minuto",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Color(0xFF707070),
                        ),
                  )
                ],
              ),
            ),
            SizedBox(width: 16),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      isAm = true;
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                          color: isAm ? Color(0xFFDADCE0) : null,
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200)),
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.all(8),
                      child: Text("AM"),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      isAm = false;
                    }),
                    child: Container(
                        color: !isAm ? Color(0xFFDADCE0) : null,
                        padding: EdgeInsets.all(8),
                        child: Text("PM")),
                  )
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
