import 'package:addisbiz/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Company extends StatelessWidget {
  const Company({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        children: [
          SafeArea(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image1.jpg'),
                )

              ),

            ),

          ),//for the image/logo
          SizedBox(height: 40,),


          Container(
            child: Text("Nano plc",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
          ),

          SizedBox(height: 10,),
          
          Expanded(
            child: Container(
             
              margin: EdgeInsets.all(40),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 220, 222, 1),
                borderRadius: BorderRadius.circular(14),
              ),

                child:Column(
                  children: [
                    ListTile(
                      leading:Icon( Icons.phone_android),
                      title: Text("+2519 2544 4412",

                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 238, 1)
                        ),
                      ),

                    ),
                    ListTile(
                      leading:Icon( Icons.phone),
                      title: Text("+2519 2544 4412",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 238, 1)
                        ),
                      ),

                    ),
                    ListTile(
                      leading:Icon( Icons.email_outlined),
                      title: Text("info@southerational.com",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 238, 1)
                      ),
                      ),

                    ),
                    ListTile(
                      leading:Icon( CupertinoIcons.globe),
                      title: Text("info@southerrational.com",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 238, 1)
                        ),
                      ),

                    ),

                  ],
                ),

            ),
          )// for company info
        ],
      ),
    );
  }
}
