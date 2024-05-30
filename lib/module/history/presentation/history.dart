import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/utils/media_res.dart';
import 'package:flutter_application_1/module/history/controller/history_controller.dart';
import 'package:flutter_application_1/module/history/presentation/cubit/submitted_product_cubit.dart';
import 'package:flutter_application_1/module/history/presentation/cubit/submitted_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class History extends StatefulWidget {
  const History({super.key});
  static const routeName = '/history';
  @override
  State<History> createState() => HistoryState();
}

class HistoryState extends State<History> {
  List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<int> number = [0, 5, 10, 15, 20];
  final List<FlSpot> _dataspot = [
    const FlSpot(1, 3),
    const FlSpot(2, 10),
    const FlSpot(3, 4),
    const FlSpot(4, 7),
    const FlSpot(5, 2),
    const FlSpot(6, 14),
    // FlSpot(7, 19),
  ];

  final List<Color> gradientColors = [
    // const Color(0xFF000000).withOpacity(opacity),
    const Color(0xFF19FB9B).withOpacity(0.0),
    const Color(0xFF00FFA3).withOpacity(0.5),
  ];
  var data = [32, 77, 24];
  late var dataProduct;
  @override
  void initState() {
    super.initState();

    context.read<SubmittedProductCubit>().fetchSubmittedProduct();
  }

  @override
  Widget build(BuildContext context) {
    // double tabBarHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Center(
            child: Text(
              "History",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                goToSearchScannedProduct(context);
              },
              icon: const Icon(Icons.search),
              color: Colors.white,
              iconSize: 30,
            ),
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            //item submitted
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TabBarView(children: [
                  topSubmittedItem(data: data),
                  //.////
                  topVerified(
                      number: number,
                      weekdays: weekdays,
                      dataspot: _dataspot,
                      gradientColors: gradientColors),
                ]),
              ),
            ),

            const TabBar(
              unselectedLabelColor: Color.fromRGBO(255, 255, 255, 0.7),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Color.fromRGBO(25, 251, 155, 1),
              // labelColor: Colors.red,
              labelStyle: TextStyle(color: Colors.white),
              tabs: [
                Tab(
                    icon: Text(
                  "Submmitted",
                  //  style: TextStyle(color: Colors.white70),
                )),
                Tab(
                    icon: Text(
                  "Verified",
                  //style: TextStyle(color: Colors.white70),
                ))
              ],
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  // Content for first tab
                  Container(
                    color: Color(0xFF171219),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<SubmittedProductCubit,
                              SubmittedProductState>(
                            builder: (context, state) {
                              if (state is DataLoading) {
                                return Expanded(
                                  child: ListView.builder(
                                    itemCount: 8,
                                    itemBuilder: (context, index) {
                                      return shimmerItem();
                                    },
                                  ),
                                );
                              }
                              if (state is DataLoaded) {
                                // print(state.data.toList());

                                Map<DateTime, List<Product>> groupedProducts =
                                    {};
                                state.data.forEach((product) {
                                  DateTime date = DateTime(
                                      product.createdAt.year,
                                      product.createdAt.month,
                                      product.createdAt.day);
                                  if (!groupedProducts.containsKey(date)) {
                                    groupedProducts[date] = [];
                                  }
                                  groupedProducts[date]?.add(product);
                                });
                                print("group product: " +
                                    groupedProducts.toString());
                                // Sort keys in descending order to render latest products first
                                var sortedKeys = groupedProducts.keys.toList()
                                  ..sort((a, b) => b.compareTo(a));
                                print("Sorted: " + sortedKeys.toString());
                                return Expanded(
                                  child: ListView.builder(
                                      // physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: sortedKeys.length,
                                      itemBuilder: (context, index) {
                                        DateTime date = sortedKeys[index];
                                        List<Product> productsForDay =
                                            groupedProducts[date]!;
                                        String month = '';
                                        switch (date.month) {
                                          case 1:
                                            month = 'JANUARY';
                                            break;
                                          case 2:
                                            month = 'FEBRUARY';
                                            break;
                                          case 3:
                                            month = 'MARCH';
                                            break;
                                          case 4:
                                            month = 'APRIL';
                                            break;
                                          case 5:
                                            month = 'MAY';
                                            break;
                                          case 6:
                                            month = 'JUN';
                                            break;
                                          case 7:
                                            month = 'JULY';
                                            break;
                                          case 8:
                                            month = 'AUGUST';
                                            break;
                                          case 9:
                                            month = 'SEPTEMBER';
                                            break;
                                          case 10:
                                            month = 'OCOTOBER';
                                            break;
                                          case 11:
                                            month = 'NOVEMBER';
                                            break;
                                          case 12:
                                            month = 'DECEMBER';
                                            break;
                                        }
                                        return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '${month} ${date.day},${date.year}',
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Color.fromRGBO(
                                                          96, 93, 105, 1)),
                                                ),
                                              ),
                                              ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  // reverse: true,
                                                  itemCount:
                                                      productsForDay.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final product =
                                                        productsForDay[index];
                                                    return
                                                        //Text("123");
                                                        itemSubmitted(
                                                            title: product.name
                                                                .toString(),
                                                            createdAt: product
                                                                .createdAt,
                                                            description: product
                                                                .description
                                                                .toString(),
                                                            image: product
                                                                .images![0]
                                                                .toString());
                                                  })
                                            ]);
                                      }),
                                );
                              } else {
                                return Container(
                                  color: Colors.white,
                                );
                              }
                            },
                          )
                          // FutureBuilder(
                          //     future: dataProduct,
                          //     builder: (context, snapshot) {
                          //       if (snapshot.connectionState ==
                          //           ConnectionState.waiting) {
                          //         return Center(
                          //             child: const CircularProgressIndicator());
                          //       } else if (snapshot.hasError) {
                          //         return Center(
                          //             child: Text('Error: ${snapshot.error}'));
                          //       } else {
                          //         final List<ProductModel> products =
                          //             snapshot.data as List<ProductModel>;

                          //         ///  print(snapshot.data[[index]]);
                          //         // return Container();
                          //         return Expanded(
                          //           child: ListView.builder(
                          //               itemCount: products.length,
                          //               itemBuilder: (context, index) {
                          //                 final product = products[index];
                          //                 //final product = snapshot.data![index];
                          //                 return itemSubmitted(
                          //                     title: product.name.toString(),
                          //                     createdAt: product.createdAt!,
                          //                     description:
                          //                         product.description.toString(),
                          //                     image:
                          //                         product.images![0].toString());
                          //               }),
                          //         );
                          //       }
                          //     }),
                          // itemSubmitted(),
                          // Text(
                          //   "JANUARY 28,2024",
                          //   style: TextStyle(
                          //       color: Color.fromRGBO(96, 93, 105, 1)),
                          // ),
                          // itemSubmitted(),
                          // itemSubmitted()
                        ],
                      ),
                    ),
                  ),

                  // Content for second tab
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "JANUARY 31,2024",
                            style: TextStyle(
                                color: Color.fromRGBO(96, 93, 105, 1)),
                          ),
                          itemVerified(),
                          itemVerified(),
                          Text(
                            "JANUARY 28,2024",
                            style: TextStyle(
                                color: Color.fromRGBO(96, 93, 105, 1)),
                          ),
                          itemVerified(),
                          itemVerified()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class shimmerItem extends StatelessWidget {
  const shimmerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 63, 62, 62)!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: 56.0.w,
          height: 56.0.h,
          color: Colors.white,
        ),
      ),
      title: Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 63, 62, 62)!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 16.0.h,
          color: Colors.white,
        ),
      ),
      subtitle: Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 63, 62, 62)!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 12.0.h,
          color: Colors.white,
        ),
      ),
    );
  }
}

class topSubmittedItem extends StatelessWidget {
  const topSubmittedItem({
    super.key,
    required this.data,
  });

  final List<int> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(children: [
            Positioned(
                child: SizedBox(
              height: 60.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(fit: BoxFit.fill, MediaRes.ellipse2),
              ),
            )),
            Container(
              height: 60.h,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.white70)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<SubmittedProductCubit, SubmittedProductState>(
                      builder: (context, state) {
                        if (state is DataLoaded) {
                          return Text(
                            state.data.length.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp),
                          );
                        } else {
                          return Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 63, 62, 62)!,
                            highlightColor: Colors.grey[100]!,
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.sp),
                            ),
                          );
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "ITEMS SUBMITTED",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: const Color.fromRGBO(159, 158, 164, 1)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 30.h,
          ),
          //line chart custom
          SizedBox(
            height: 15.h,
            child: Row(children: [
              Expanded(
                flex: data[0],
                child: Container(
                  color: const Color.fromRGBO(25, 251, 155, 1),
                ),
              ),
              Expanded(
                flex: data[1],
                child: Container(
                  color: const Color.fromRGBO(156, 75, 219, 1),
                ),
              ),
              Expanded(
                flex: data[2],
                child: Container(
                  color: const Color.fromRGBO(96, 93, 105, 1),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              const Icon(
                size: 15,
                Icons.square,
                color: Color.fromRGBO(25, 251, 155, 1),
              ),
              Text(
                " Verified",
                style: TextStyle(color: Colors.white, fontSize: 17.sp),
              ),
              const Spacer(),
              Text("(${data[0]} items)",
                  style: const TextStyle(color: Colors.white)),
              const Icon(
                Icons.arrow_right,
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              const Icon(
                size: 15,
                Icons.square,
                color: Color.fromRGBO(156, 75, 219, 1),
              ),
              Text(
                " Being Verified",
                style: TextStyle(color: Colors.white, fontSize: 17.sp),
              ),
              const Spacer(),
              Text("(${data[1]} items)",
                  style: const TextStyle(color: Colors.white)),
              const Icon(
                Icons.arrow_right,
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              const Icon(
                size: 15,
                Icons.square,
                color: Color.fromRGBO(96, 93, 105, 1),
              ),
              Text(
                " Not Verified",
                style: TextStyle(color: Colors.white, fontSize: 17.sp),
              ),
              const Spacer(),
              Text("(${data[2]} items)",
                  style: const TextStyle(color: Colors.white)),
              const Icon(
                Icons.arrow_right,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}

class topVerified extends StatelessWidget {
  const topVerified({
    super.key,
    required this.number,
    required this.weekdays,
    required List<FlSpot> dataspot,
    required this.gradientColors,
  }) : _dataspot = dataspot;

  final List<int> number;
  final List<String> weekdays;
  final List<FlSpot> _dataspot;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Positioned(
                child: SizedBox(
              height: 60.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(fit: BoxFit.fill, MediaRes.ellipse3),
              ),
            )),
            Container(
              height: 60.h,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.white70)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "512",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "YOU VERIFIED",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: const Color.fromRGBO(159, 158, 164, 1)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Items Verification Stats",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: const Color(0xff353339))),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, bottom: 15, right: 10),
                child: linechart(
                    number: number,
                    weekdays: weekdays,
                    data: _dataspot,
                    gradientColors: gradientColors),
              ),
            ),
          )
          //line chart custom
        ],
      ),
    );
  }
}

class itemSubmitted extends StatelessWidget {
  const itemSubmitted({
    required this.title,
    required this.createdAt,
    required this.description,
    required this.image,
    super.key,
  });
  final String title;
  final DateTime? createdAt;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int differenceInDays = now.difference(createdAt!).inDays;
    return ListTile(
      isThreeLine: true,
      leading: Image.network(
        image,
        fit: BoxFit.fill,
        height: 50.h,
        width: 50.w,
        errorBuilder: (context, error, stackTrace) {
          // Return a placeholder widget when an error occurs
          return Image.asset(
              height: double.infinity,
              MediaRes
                  .exploreFan); // You can replace this with any widget you want
        },
      ),
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: Image.asset(MediaRes.exploreTick)))
        ],
      ),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          maxLines: 1,
          '$description',
          style: const TextStyle(color: Color(0XFF9F9EA4)),
        ),
        Text(
          maxLines: 1,
          '$differenceInDays days ago',
          style: const TextStyle(color: Color(0xFF605D69)),
        ),
      ]),
      trailing: const Padding(
        padding: EdgeInsets.only(top: 15),
        child: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
    );
  }
}

class itemVerified extends StatelessWidget {
  const itemVerified({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: const FlutterLogo(
        size: 50,
      ),
      title: Row(
        children: [
          const Text(
            "Mirinda Grape Soda",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Spacer(),
          Image.asset(
            MediaRes.historyUserCheck,
            height: 16.h,
            width: 16.w,
          ),
          const Padding(padding: EdgeInsets.only(right: 3)),
          const Text(
            "31/100",
            style:
                TextStyle(fontSize: 14, color: Color.fromRGBO(156, 75, 219, 1)),
          )
        ],
      ),
      subtitle: const Text(
        "Pepsico * Germany\n2 days ago",
        style: TextStyle(color: Color.fromRGBO(159, 158, 164, 1)),
      ),
      trailing: const Padding(
        padding: EdgeInsets.only(top: 15),
        child: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
    );
  }
}

class linechart extends StatelessWidget {
  const linechart({
    super.key,
    required this.number,
    required this.weekdays,
    required List<FlSpot> data,
    required this.gradientColors,
  }) : _data = data;

  final List<int> number;
  final List<String> weekdays;
  final List<FlSpot> _data;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 20,
        titlesData: FlTitlesData(
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30, // Adjust reserved space as needed
                getTitlesWidget: (value, meta) {
                  int index = value.toInt(); // Get the data point value

                  // Check if value is in desiredValues list
                  if (number.contains(index)) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(
                        index.toString(), // Convert value to string
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    // Return an empty widget to hide the title for non-matching values
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: const Text(''),
                    );
                  }
                },
              ),
            ),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              getTitlesWidget: (value, meta) {
                int index = value.toInt(); // Wrap to weekdays.length
                switch (value) {
                  case 1:
                  case 2:
                  case 3:
                  case 4:
                  case 5:
                  case 6:
                  case 7:
                    return SideTitleWidget(
                      space: 5,
                      // angle: 0.1,
                      axisSide: meta.axisSide,
                      child: Text(
                        weekdays[index - 1],
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    );
                  default:
                    return Container();
                }
              },
              showTitles: true,
            ))),

        borderData: FlBorderData(
            show: true,
            border: const Border(
                left: BorderSide(color: Color(0xFF605D69)),
                bottom: BorderSide(color: Color(0xFF605D69)))),
        gridData: FlGridData(
            drawVerticalLine: false,
            show: true,
            getDrawingHorizontalLine: (v) {
              return const FlLine(color: Color(0xFF605D69));
            }),

        lineBarsData: [
          LineChartBarData(
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                strokeWidth: 1.5,
                radius: 8, // Change the radius to make the dot bigger
                color: const Color(0xFF19FB9B), // Set the color of the dot
                //strokeWidth: , // Set the width of the dot's border
                strokeColor: const Color(
                    0xFF000000), // Set the color of the dot's border
              ),
            ),
            spots: _data,
            isCurved: false,
            color: const Color(0xFF19FB9B),
            barWidth: 1,
            belowBarData: BarAreaData(
              cutOffY: 5,
              show: true,
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: gradientColors),
            ),
          ),
        ],
        // gridData: FlGridData(
        //   getDrawingHorizontalLine:

        //    getDrawingVerticalLine:
        // ),
      ),
    );
  }
}
