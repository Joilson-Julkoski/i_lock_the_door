import 'package:flutter/material.dart';
import 'package:i_lock_the_door/models/history.dart';
import 'package:i_lock_the_door/models/infos.dart';
import 'package:i_lock_the_door/services/infoService.dart';
import 'package:i_lock_the_door/utils/date.dart';
import 'package:i_lock_the_door/views/config.dart';
import 'package:i_lock_the_door/views/history.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  InfosDTO userInfos = InfosDTO(locked: true, history: [], events: []);

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Bom dia'; // Antes das 12h
    } else if (hour < 18) {
      return 'Boa tarde'; // Entre 12h e 18h
    } else {
      return 'Boa noite'; // Depois das 18h
    }
  }

  void getInfos() async {
    userInfos = await getInfosFromSection();
    print(userInfos.locked);
  }

  @override
  void initState() {
    super.initState();
    getInfos();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        // Coloque a lógica que precisa ser atualizada aqui
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ConfigView(userInfo: userInfos)),
                          )
                        },
                    icon: Icon(Icons.settings)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getGreeting(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  "Sua Porta está ${userInfos.locked ? 'Trancada' : "Aberta"}",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 20,
                  child: Image.asset(
                    'assets/images/ellipse.png',
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 20,
                  child: Image.asset(
                    'assets/images/ellipse.png',
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 80,
                  child: Image.asset(
                    'assets/images/ellipse.png',
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 280,
                  child: Image.asset(
                    'assets/images/${userInfos.locked ? 'doorClose' : "doorOpen"}.png',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                userInfos.locked = !userInfos.locked;
                userInfos.history.add(
                    HistoryDTO(locked: userInfos.locked, time: DateTime.now()));
                saveData(userInfos);
                setState(() {});
              },
              style: userInfos.locked
                  ? Theme.of(context).elevatedButtonTheme.style
                  : Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.secondary)),
              child: Wrap(
                spacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.key,
                      )),
                  Text(
                    "${userInfos.locked ? 'Destrancar' : "Trancar"} Porta",
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            userInfos.history.length > 0
                ? InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HistoryView(userInfo: userInfos)),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).colorScheme.surface,
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
                                Text(
                                    "Porta ${userInfos.locked ? 'trancada' : 'destrancada'}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(fontSize: 12)),
                                Text(formatTime(userInfos.history.last.time),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                Text(
                                  "Visualizar histórico",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 14,
                                          color: Color(0xFFFE8235),
                                          fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(20)),
                            Image.asset("assets/images/doc.png")
                          ]),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
