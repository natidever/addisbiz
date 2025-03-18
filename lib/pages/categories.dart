import 'package:flutter/material.dart';
import 'package:addisbiz/pages/homepage.dart';
import 'package:shimmer/shimmer.dart';

import '../entites/api.dart';
import '../entites/data.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Data> categoryList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 238, 238),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: FutureBuilder<List<Data>>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // debugPrint("Waiting state ");
              return shimmerLoadingCategories();
            }
            if (snapshot.hasData) {
              // debugPrint("Future got the snapshot data ");
              categoryList = snapshot.data!;
              return GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  // debugPrint("Before Future ");
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/page1", arguments: {
                        'children': categoryList[index].children,
                        'parentAlias': categoryList[index].alias,
                        'icon': resourceList[index].sectorIcon,
                      });
                    },
                    child: AspectRatio(
                      aspectRatio: 5 / 7,
                      child: Container(
                        // height: itemHeight,
                        // width: itemWidth,
                        decoration: BoxDecoration(
                          //================
                          // color: Theme.of(context).backgroundColor,
                          //===================================
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              width: 50,
                              height: 50,
                              image: AssetImage(
                                resourceList[index].sectorIcon ??
                                    "Default path",
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                categoryList[index].businessSectorName ??
                                    "Addis Biz",
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              );
            } else if (snapshot.hasError) {
              print("error has ===========================================");
              return Text("error .=========================================..");
            } else {
              return Container(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.yellow,
                ),
              );
            }
          },
          future: getCategories(),
        ),
      ),
    );
  }

  shimmerLoadingCategories() {
    return Shimmer.fromColors(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                //================
                // color: Theme.of(context).backgroundColor,
                //===================================
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
          itemCount: 20,
        ),
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}
