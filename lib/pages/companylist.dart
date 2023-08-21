import 'package:addisbiz/constants.dart';
import 'package:addisbiz/widgets/modifiedtextwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/customtextfield.dart';

class CompanyList extends StatelessWidget {
  const CompanyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Company name"),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
              color: Theme.of(context).errorColor,
                // color:appBarColor,
              ),
              child: Padding(
                padding:  EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: CustomTextField(
                  hintText: "Search in categories",
                ),
              ),
            ),

                SizedBox(height: 20,),

            Container(
              height: MediaQuery.sizeOf(context).height,

              child: ListView.separated(itemBuilder: (context,index){

                //FIRST  -----------------------------------------DESIGN-----------------------


               // return Padding(
               //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
               //   child: Row(
               //     // crossAxisAlignment: CrossAxisAlignment.start,
               //     children: [
               //
               //       CircleAvatar(
               //         backgroundImage:AssetImage('assets/headerimage4.jpg'),
               //         radius: 35,
               //       ),
               //
               //       SizedBox(width: 20,),
               //      Flexible(
               //        child: ModifiedTextWidget(
               //          text: "Sayat cosmotics importer plc and the only importer of rather ",
               //           // style: TextStyle(
               //           //
               //           // ),
               //
               //        ),
               //      )
               //
               //     ],
               //   ),
               // );


                //----------------------------Second ------------------------//  Design-----------



                // return Card(
                //
                //     child: Row(
                //         // crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //
                //           CircleAvatar(
                //             backgroundImage:AssetImage('assets/headerimage4.jpg'),
                //             radius: 35,
                //           ),
                //
                //           SizedBox(width: 20,),
                //          Flexible(
                //            child: ModifiedTextWidget(
                //              text: "Sayat cosmotics importer plc and the only importer of rather ",
                //               // style: TextStyle(
                //               //
                //               // ),
                //
                //            ),
                //          )
                //
                //         ],
                //       ),
                // );


       ////----------------------------THIRD DESIGN--------------------------------------

                return Card(
              color: Theme.of(context).backgroundColor,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "/companyinfo");
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft:Radius.circular(10),
                          ),
                          child: Image(
                            fit: BoxFit.cover,
                            width:100,
                              height: 90,
                              image:AssetImage('assets/headerimage4.jpg')
                          ),
                        ),
                      SizedBox(width: 15,),

                        Expanded(

                          child: Column(


                            children: [
                              ModifiedTextWidget(
                              text: 'Erkab transist and Consultancy service ',
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 2,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButton(
                                    callbackAction: (){},
                                    buttonText: "Addis ababa",
                                    buttonColor: buttonColor,
                                    textColor: blackColor,
                                    width: 89,
                                    height:20,
                                  ),
                                  CustomButton(
                                    callbackAction: (){},
                                    buttonText: "+2519 1337 7471",
                                    buttonColor: buttonColor,
                                    textColor: blackColor,
                                    width: 150,
                                    height:20,
                                  )

                                ],
                              )

                            ],
                          ),
                        )


                      ],
                    ),
                  ),

                );










              }, separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey,
                  thickness: 0.1,); },
                itemCount:20,),
            )
          ],
        ),
      ),
    );
  }
}
