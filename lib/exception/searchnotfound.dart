import 'package:flutter/cupertino.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            width: 150,
            height: 150,
            image: AssetImage('assets/searchnotfound.png'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.center,
            'Your search did\'t match any of our data \n Make sure that all words are spelled correctly.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
