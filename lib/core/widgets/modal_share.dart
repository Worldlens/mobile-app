import 'package:flutter/material.dart';

Future<void> showModalShare(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        height: 400,
        width: double.infinity,
        // color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                "Share to community",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Text(
                "Bring this product to your friends and family!",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      // return SizedBox(
                      //       height: 20,
                      //     ),
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(23, 18, 25, 1),
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.messenger),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Messenger",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
              )
            ],
          ),
        ),
      );
    },
  );
}
