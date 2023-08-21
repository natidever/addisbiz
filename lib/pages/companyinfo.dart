import 'package:addisbiz/constants.dart';
import 'package:addisbiz/widgets/button.dart';
import 'package:addisbiz/widgets/customtextfield.dart';
import 'package:addisbiz/widgets/modifiedtextwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../entites/data.dart';
class CompanyInfo extends StatelessWidget {
   CompanyInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 228, 228, 1),
      appBar: AppBar(
        title: Text("Company name"),
      ),


      // body:Column(
      //   children: [
      //     Expanded(
      //       child: Container(
      //         width: double.infinity,
      //         height: MediaQuery.sizeOf(context).height*0.2,
      //         decoration: BoxDecoration(
      //
      //         ),
      //         child: Image(
      //           image: AssetImage('assets/addisbiz.jpg'),
      //           fit: BoxFit.fill,
      //
      //         ),
      //       ),
      //     ),
      //     Container(
      //       height: MediaQuery.sizeOf(context).height*0.7,
      //       width: double.infinity,
      //       decoration: BoxDecoration(
      //             color: Theme.of(context).backgroundColor,
      //           // color: Color.fromRGBO(230, 240, 236, 1),
      //         borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(50),
      //           topRight: Radius.circular(50),
      //         )
      //       ),
      //       child: Expanded(
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(vertical: 18.0),
      //           child: Column(
      //             children: [
      //
      //             Padding(
      //               padding: const EdgeInsets.only(bottom: 20.0),
      //               child: Text(
      //               "TANA TEXTILE INSDUSTRY",
      //               style: TextStyle(
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //               ),),
      //             ),
      //             Divider(color: Colors.black,),
      //
      //             Expanded(
      //               child: ListView.separated(itemBuilder: (context,index){
      //                   return ListTile(
      //                     leading: Icon(Icons.phone_android_rounded ,color: appBarColor,),
      //                     title: Text("+251913377671",
      //                      style: TextStyle(
      //                        color: Theme.of(context).colorScheme.secondary,
      //                      ),
      //                     ),
      //                     trailing:CustomButton(
      //                       callbackAction: () {  },
      //                       width: 50,
      //                       height: 20,
      //                       buttonColor: Colors.red,
      //                       buttonText: "call",
      //                       textColor: blackColor,
      //                     )
      //                   );
      //                 },
      //                   separatorBuilder: (BuildContext context, int index) {
      //                   return Divider( color: Colors.grey,);
      //                   },
      //                   itemCount: 7,),
      //             ),
      //             ],
      //           ),
      //         ),
      //       ),
      //         )
      //   ],
      // ),

      );

  }
}
