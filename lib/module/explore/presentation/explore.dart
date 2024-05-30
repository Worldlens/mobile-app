import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/media_res.dart';
import 'package:flutter_application_1/module/explore/controller/expore_controller.dart';
import 'package:flutter_application_1/values/enum.dart';
import 'package:flutter_application_1/core/widgets/modal_hide_item.dart';
import 'package:flutter_application_1/core/widgets/modal_share.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});
  static const routeName = '/explore';

  @override
  State<Explore> createState() => ExploreState();
}

class ExploreState extends State<Explore> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            goBack(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Center(
            child: Text(
          "Explore",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0.w),
            child: InkWell(
              onTap: () {
                moveToSearchPage(context);
              },
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: InkWell(
                onTap: () {
                  moveToTrendingItem();
                },
                child: Image.asset(MediaRes.exploreLaptop),
              ),
            ),
            Text(
              "Popular Categories",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                      onTap: () {
                        moveToBeverage();
                      },
                      child: Image.asset(MediaRes.exploreBeverage)),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        moveToFood();
                      },
                      child: Image.asset(MediaRes.exploreFood)),
                ),
              ],
            ),
            SizedBox(
              height: 7.w,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                      onTap: () {
                        moveToMusic();
                      },
                      child: Image.asset(MediaRes.exploreMusic)),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        moveToElectronic();
                      },
                      child: Image.asset(MediaRes.exploreElectronic)),
                ),
              ],
            ),
            SizedBox(
              height: 20.w,
            ),
            Text(
              "Electronic",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.w,
            ),
            Expanded(
                child: ListView.builder(
              padding: EdgeInsets.all(0.w),
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return item(
                  sub_title_country: "VietNam",
                  sub_title_manufacture: "ThanhPhoHoChiMinh",
                  selectedItem: selectedItem,
                  title: "Item aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$index ",
                );
              },
            ))
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}

class item extends StatelessWidget {
  const item(
      {super.key,
      required this.selectedItem,
      this.title,
      this.sub_title_country,
      this.sub_title_manufacture});
  final String? title;
  final SampleItem? selectedItem;
  final String? sub_title_country;
  final String? sub_title_manufacture;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      //padding: EdgeInsets.all(0),
      //width: double.infinity,
      child: ListTile(
        contentPadding: EdgeInsets.all(0.w),
        selectedColor: Colors.white,
        leading: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
            height: 70.h,
            width: 60.w,
            //color: Colors.white,
            child: Image.asset(MediaRes.exploreFan)),
        title: Row(
          children: [
            Flexible(
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.fade,
                title ?? "",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
                height: 20.h,
                width: 20.w,
                child: Image.asset(MediaRes.exploreTick))
          ],
        ),
        subtitle: RichText(
          text: TextSpan(
              text: '$sub_title_manufacture * ',
              style: const TextStyle(color: Color.fromRGBO(159, 158, 164, 1)),
              children: [
                TextSpan(
                  text: '$sub_title_country',
                  style:
                      const TextStyle(color: Color.fromRGBO(159, 158, 164, 1)),
                )
              ]),
        ),
        trailing: Padding(
          padding: EdgeInsets.only(bottom: 10.0.w),
          child: popupMenuButton(selectedItem: selectedItem),
        ),
      ),
    );
  }
}

class popupMenuButton extends StatelessWidget {
  const popupMenuButton({
    super.key,
    required this.selectedItem,
  });

  final SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      color: Color(0xFF291F2E),
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      initialValue: selectedItem,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          onTap: () {
            showModalHideItem(context);
          },
          value: SampleItem.itemOne,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 20.w,
              ),
              const Text(
                "Hide this item",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        PopupMenuItem<SampleItem>(
          onTap: () {
            showModalShare(context);
          },
          value: SampleItem.itemTwo,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.share, color: Colors.white),
              SizedBox(
                width: 20.w,
              ),
              const Text(
                "Share",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.flag, color: Colors.white),
              SizedBox(
                width: 20.w,
              ),
              const Text(
                "Report",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
