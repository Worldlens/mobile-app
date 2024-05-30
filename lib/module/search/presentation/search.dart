import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/media_res.dart';
import 'package:flutter_application_1/core/widgets/modal_filter_product.dart';
import 'package:flutter_application_1/module/search/controller/search_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  static const routeName = '/search';
  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {
  TextEditingController search_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      goBack(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          search_controller.text = text;
                        });
                      },
                      controller: search_controller,
                      textAlign: TextAlign.start,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15),
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
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    // child: TextField(
                    //   onChanged: (text) {
                    //     setState(() {
                    //       search_controller.text = text;
                    //     });
                    //   },
                    //   controller: search_controller,
                    //   strutStyle: StrutStyle(height: 0.2.h),
                    //   // textAlign: TextAlign.justify,
                    //   style: const TextStyle(color: Colors.white),
                    //   decoration: InputDecoration(
                    //     suffixIcon: Container(
                    //       height: 15.h,
                    //       width: 15.w,
                    //       decoration: BoxDecoration(
                    //           color: const Color(0xFF605D69),
                    //           borderRadius: BorderRadius.circular(25.r)),
                    //       child: const Icon(
                    //         Icons.clear,
                    //         color: Colors.white70,
                    //       ),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(20.r),
                    //       // Border when clicked (focused)
                    //       borderSide: const BorderSide(
                    //           color:
                    //               Colors.transparent), // Set your focus color
                    //     ),
                    //     fillColor: const Color(
                    //         0xFF171219), // Set your desired color here
                    //     filled: true,

                    //     hintStyle: const TextStyle(color: Colors.white70),
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20.r)),
                    //     hintText: 'Enter a search term',
                    //   ),
                    // ),
                  ),
                ],
              ),
              search_controller.text.isEmpty
                  ? const MyNormallPage()
                  : const MySearchedProduct()
            ],
          ),
        ),
      ),
    );
  }
}

class MySearchedProduct extends StatefulWidget {
  const MySearchedProduct({super.key});

  @override
  State<MySearchedProduct> createState() => _MySearchedProductState();
}

class _MySearchedProductState extends State<MySearchedProduct> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  showFilteredProduct(context);
                },
                child: Image.asset(
                    height: 100.h, width: 100.w, MediaRes.searchFilter))
          ],
        ),
        Container(
          child: Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r)),
                              height: 60.h,
                              width: 60.w,
                              //color: Colors.white,
                              child: const FlutterLogo()),
                          title: Row(
                            children: [
                              const Text(
                                "Dreo Fans",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Image.asset(
                                  height: 20.h,
                                  width: 20.w,
                                  MediaRes.exploreTick)
                            ],
                          ),
                          subtitle: const Text(
                            "Dreo * China",
                            style: TextStyle(color: Colors.white70),
                          ),
                          trailing: const Icon(
                            Icons.clear,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    );
                  })),
        )
      ],
    ));
  }
}

class MyNormallPage extends StatefulWidget {
  const MyNormallPage({super.key});

  @override
  State<MyNormallPage> createState() => _MyNormallPageState();
}

class _MyNormallPageState extends State<MyNormallPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular",
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const poplarItem(),
                SizedBox(
                  width: 10.w,
                ),
                const poplarItem(),
                SizedBox(
                  width: 10.w,
                ),
                const poplarItem(),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            "Recent Reasearch",
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsetsDirectional.zero,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              if (index % 2 == 0) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Container(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r)),
                          height: 60.h,
                          width: 60.w,
                          //color: Colors.white,
                          child: const FlutterLogo()),
                      title: Row(
                        children: [
                          const Text(
                            "Dreo Fans",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Image.asset(
                              height: 20.h, width: 20.w, MediaRes.exploreTick)
                        ],
                      ),
                      subtitle: const Text(
                        "Dreo * China",
                        style: TextStyle(color: Colors.white70),
                      ),
                      trailing: const Icon(
                        Icons.clear,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Container(
                      child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Image.asset(
                        MediaRes.searchClock,
                        height: 30.h,
                        width: 30.w,
                      ),
                      SizedBox(width: 10.w),
                      const Text(
                        "12345",
                        style: TextStyle(color: Colors.white),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.clear,
                        color: Colors.white70,
                      )
                    ],
                  )),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}

class poplarItem extends StatelessWidget {
  const poplarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF605D69)),
          borderRadius: BorderRadius.circular(10.r)),
      height: 30.h,
      width: 130.w,
      child: const Padding(
        padding: EdgeInsets.only(right: 8.0, left: 8.0),
        child: Center(
          child: Text(
            "Bottle of water",
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
