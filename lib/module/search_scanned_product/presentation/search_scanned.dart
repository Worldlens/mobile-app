import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/search_scanned_product/controller/search_scanned_product.dart';

class SearchScannedProduct extends StatefulWidget {
  const SearchScannedProduct({super.key});
  static const routeName = '/search_scanned_product';
  @override
  State<SearchScannedProduct> createState() => SearchScannedProductState();
}

class SearchScannedProductState extends State<SearchScannedProduct> {
  int selectedIndex = 0;
  int selectedIndexTimeRange = 0;
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
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Container(
          color: Colors.transparent,
          height: 40,
          child: TextField(
            textAlign: TextAlign.start,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    )),
                hintStyle: const TextStyle(color: Color(0XFF605D69)),
                hintText: "Enter a search terms",
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.clear,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                filled: true,
                fillColor: const Color(0xFF171219),
                // focusColor: Colors.yellow,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  poppularItem(
                    0,
                    'All',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  poppularItem(1, 'Verified'),
                  const SizedBox(
                    width: 10,
                  ),
                  poppularItem(2, 'Submmitted'),
                  const SizedBox(
                    width: 10,
                  ),
                  poppularItem(3, 'Not Verified'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Time Range",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  timeRangeItem(0, 'All Time'),
                  const SizedBox(
                    width: 10,
                  ),
                  timeRangeItem(1, '7D'),
                  const SizedBox(
                    width: 10,
                  ),
                  timeRangeItem(2, '10D'),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Recent Reasearch",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      width: 60,
                      //color: Colors.white,
                      child: const FlutterLogo()),
                  title: const Row(
                    children: [
                      Text(
                        "Dreo Fans",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.greenAccent,
                      )
                    ],
                  ),
                  subtitle: const Text(
                    "Dreo * China",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(Icons.connecting_airports_sharp),
                );
              },
            )),
          ],
        ),
      ),
    );
  }

  Widget poppularItem(int index, String text) {
    return InkWell(
        onTap: () => setState(() => selectedIndex = index),
        child: Container(
          decoration: BoxDecoration(
              color: selectedIndex == index
                  ? const Color.fromRGBO(25, 251, 155, 1)
                  : const Color.fromRGBO(255, 255, 255, 0.15),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          height: 30,
          //width: 130,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  text,
                  style: selectedIndex == index
                      ? const TextStyle(color: Colors.black)
                      : const TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
        ));
  }

  Widget timeRangeItem(int index, String text) {
    return InkWell(
        onTap: () => setState(() => selectedIndexTimeRange = index),
        child: Container(
          decoration: BoxDecoration(
              color: selectedIndexTimeRange == index
                  ? const Color.fromRGBO(25, 251, 155, 1)
                  : const Color.fromRGBO(255, 255, 255, 0.15),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          height: 30,
          //width: 130,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  text,
                  style: selectedIndexTimeRange == index
                      ? const TextStyle(color: Colors.black)
                      : const TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
        ));
  }
}
