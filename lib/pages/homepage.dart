import 'package:addisbiz/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import  'package:addisbiz/widgets/navbar.dart';
import 'package:addisbiz/constants.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      drawer: NavBar(),
      body: CustomScrollView(
        slivers: [
          //for the image
          SliverAppBar(
            centerTitle: false,
            expandedHeight: 300,
            pinned: false,
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                  image:AssetImage('assets/image2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //---search bar--

          SliverAppBar(
            bottom: PreferredSize(preferredSize:Size.fromHeight(-10),child:SizedBox()),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            // pinned: true,
            flexibleSpace: CustomTextField(
              hintText: "Search",
            ),
          ),

          //---grid layout for categories
          SliverGrid(

              delegate:SliverChildBuilderDelegate(
                childCount: 30,
                  (BuildContext context,int index){
                    return Padding(
                       padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Container(
                        width: 40,
                        height: 40,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),

                      ),
                    );
                  }
              ) ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 3,
                crossAxisSpacing: 4,
              ))


        ],

      ),




        );
  }
}
