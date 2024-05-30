import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/media_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showFilteredProduct(BuildContext context) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r))),
            height: 400.h,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Filter',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      const tag(
                        name: "Trending",
                        index: 0,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const tag(
                        name: "Popular",
                        index: 1,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const tag(
                        name: "New",
                        index: 2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Category',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.white70),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Wrap(
                    runSpacing: 10.h,
                    children: [
                      const categoryTag(
                        name: "Trending",
                        index: 0,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const categoryTag(
                        name: "Popular",
                        index: 1,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const categoryTag(name: "New", index: 2),
                      SizedBox(
                        width: 10.w,
                      ),
                      const categoryTag(name: "New", index: 3),
                      SizedBox(
                        width: 10.w,
                      ),
                      const categoryTag(name: "New", index: 4),
                      SizedBox(
                        width: 10.w,
                      ),
                      const categoryTag(name: "New", index: 5),
                      SizedBox(
                        width: 10.w,
                      ),
                      const categoryTag(name: "New", index: 6),
                      SizedBox(
                        width: 10.w,
                      ),
                      const categoryTag(name: "New", index: 7),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Manufacture',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.white70),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Wrap(
                    runSpacing: 10.h,
                    children: [
                      const manufactureTag(name: "VietNam"),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(25, 251, 155, 1))),
                          onPressed: () {},
                          child: const Text(
                            "APPLY FILTER",
                            style: TextStyle(color: Colors.black),
                          ))),
                ],
              ),
            ),
          ),
        );
      });
}

class tag extends StatefulWidget {
  const tag({
    super.key,
    required this.name,
    required this.index,
  });
  final String name;
  final int index;

  @override
  State<tag> createState() => _tagState();
}

class _tagState extends State<tag> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.15),
              border: Border.all(color: Colors.white70),
              borderRadius: BorderRadius.circular(10.r)),
          height: 30,
          //width: 130,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  widget.name,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class categoryTag extends StatelessWidget {
  const categoryTag({super.key, required this.name, required this.index});
  final String name;
  final int index;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.15),
            border: Border.all(color: Colors.white70),
            borderRadius: BorderRadius.circular(10.r)),
        height: 30,
        //width: 130,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                name,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class manufactureTag extends StatelessWidget {
  const manufactureTag({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.15),
            border: Border.all(color: Colors.white70),
            borderRadius: BorderRadius.circular(10.r)),
        height: 30,
        //width: 130,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Image.asset(height: 20.h, width: 20.w, MediaRes.searchVnFlag),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    name,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
