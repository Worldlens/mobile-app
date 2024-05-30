import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/settings/controller/setting_controller.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  static const routeName = '/settings';

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              goBack(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Center(
          child: Text(
            "Settings",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              size: 30,
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              function(
                leadingIcon: Icons.account_circle,
                trailingIcon: Icons.arrow_right_alt_outlined,
                title: "Account Settings",
              ),
              const SizedBox(
                height: 20,
              ),
              function(
                leadingIcon: Icons.notifications_active_rounded,
                trailingIcon: Icons.arrow_right_alt_outlined,
                title: "Notifications",
              ),
              const SizedBox(
                height: 20,
              ),
              function(
                leadingIcon: Icons.account_circle,
                trailingIcon: Icons.arrow_right_alt_outlined,
                title: "Security & Privacy",
              ),
              const SizedBox(
                height: 20,
              ),
              function(
                leadingIcon: Icons.audiotrack,
                trailingIcon: Icons.arrow_right_alt_outlined,
                title: "Support",
              ),
              const SizedBox(
                height: 20,
              ),
              function(
                leadingIcon: Icons.book_sharp,
                trailingIcon: Icons.arrow_right_alt_outlined,
                title: "Terms & Conditions",
              ),
              const SizedBox(
                height: 20,
              ),
              function(
                leadingIcon: Icons.info_rounded,
                trailingIcon: Icons.arrow_right_alt_outlined,
                title: "Abouts",
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Version 0.0.1",
                  style: TextStyle(color: Color.fromRGBO(96, 93, 105, 1)),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset("./assets/images/effects/ellipse2.png")))
      ]),
    );
  }
}

class function extends StatelessWidget {
  function(
      {super.key,
      required this.leadingIcon,
      required this.trailingIcon,
      required this.title}) {
    // TODO: implement function
  }

  var leadingIcon;
  var trailingIcon;
  var title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(23, 18, 25, 1),
          borderRadius: BorderRadius.circular(10)),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              leadingIcon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Spacer(),
            Icon(
              trailingIcon,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
