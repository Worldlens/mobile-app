import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showModalBottomSheetFunction(
    BuildContext context, Function(String) onOptionSelected) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Manufacture",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                strutStyle: StrutStyle(height: 0.2.h),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  // suffixIcon: Container(
                  //   height: 15.h,
                  //   width: 15.w,
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(25.r)),
                  //   child: const Icon(
                  //     Icons.clear,
                  //     color: Colors.white70,
                  //   ),
                  // ),

                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(20.r),
                  //   // Border when clicked (focused)
                  //   borderSide: const BorderSide(
                  //       color: Colors.transparent), // Set your focus color
                  // ),

                  // Set your desired color here
                  // filled: true,
                  hintStyle: TextStyle(color: Colors.white70),
                  hintText: 'Enter a search term',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: InkWell(
                  onTap: () {
                    onOptionSelected('Pepsico');
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pepsico",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("4.5K+", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: InkWell(
                  onTap: () {
                    onOptionSelected('Vinfast');
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Vinfast",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("4.5K+", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: InkWell(
                  onTap: () {
                    onOptionSelected('Toyota');
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Toyota",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("4.5K+", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),

              // ListTile(
              //   title: Text('Option 1'),
              //   onTap: () {
              //     onOptionSelected('Option 1');
              //     Navigator.pop(context); // Close the bottom sheet
              //   },
              // ),
              // ListTile(
              //   title: Text('Option 2'),
              //   onTap: () {
              //     onOptionSelected('Option 2');
              //     Navigator.pop(context); // Close the bottom sheet
              //   },
              // ),
              // ListTile(
              //   title: Text('Option 3'),
              //   onTap: () {
              //     onOptionSelected('Option 3');
              //     Navigator.pop(context); // Close the bottom sheet
              //   },
              // ),
            ],
          ),
        ),
      );
    },
  );
}
