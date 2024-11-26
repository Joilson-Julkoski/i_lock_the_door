import 'package:flutter/material.dart';
import 'package:i_lock_the_door/models/infos.dart';
import 'package:i_lock_the_door/views/history.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ConfigView extends StatefulWidget {
  final InfosDTO userInfo;

  const ConfigView({super.key, required this.userInfo});

  @override
  State<ConfigView> createState() => _ConfigViewState();
}

class _ConfigViewState extends State<ConfigView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 400,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Programar horário",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 400,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              // TODO: fazer com q esse user info venha de um provider
                              builder: (context) => HistoryView(
                                    userInfo: widget.userInfo,
                                  )),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.description,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Histórico",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        launchUrlString('https://github.com/Joilson-Julkoski/');
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Image.asset("assets/images/github.png"),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        launchUrlString(
                            'https://www.linkedin.com/in/joilson-julkoski/');
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Image.asset("assets/images/Linkedin.png"),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        launchUrlString('https://github.com/Joilson-Julkoski/');
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Image.asset("assets/images/external-link.png"),
                      ),
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
