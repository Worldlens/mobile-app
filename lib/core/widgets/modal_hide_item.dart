import 'package:flutter/material.dart';

Future<void> showModalHideItem(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        height: 400,
        width: 400,
        // color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                "Confirmation",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Are you sure you want to hide ",
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const Text("Dreo Fans?",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              const Text("You won`t be able to see this item in the future.",
                  style: TextStyle(fontSize: 14, color: Colors.white70)),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Adjust Item visibility",
                style: TextStyle(
                    decorationThickness: 2,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromRGBO(25, 251, 155, 1),
                    color: Color.fromRGBO(25, 251, 155, 1)),
              ),
              const SizedBox(
                height: 20,
              ),
              // ElevatedButton(
              //   child: const Text('Close BottomSheet'),
              //   onPressed: () => Navigator.pop(context),
              // ),
              Center(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.white),
                        color: Colors.transparent),
                    child: const Center(
                      child: Text(
                        "NO,KEEP THIS ITEM SHOWN",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromRGBO(25, 251, 155, 1)),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "YES, HIDE THIS ITEM",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ),
            ],
          ),
        ),
      );
    },
  );
}
