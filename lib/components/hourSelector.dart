import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HourSelector extends StatefulWidget {
  const HourSelector({super.key});

  @override
  State<HourSelector> createState() => _HourSelectorState();
}

class _HourSelectorState extends State<HourSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Text("INSIRA O HORÁRIO"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '00', // Exemplo de valor padrão
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  Text("Hora")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '00', // Exemplo de valor padrão
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  Text("Minuto")
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  InkWell(
                    child: Container(child: Text("AM")),
                  ),
                  InkWell(
                    child: Container(child: Text("PM")),
                  )
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: Text("Cancelar")),
            TextButton(onPressed: () {}, child: Text("Ok"))
          ],
        )
      ]),
    );
  }
}
