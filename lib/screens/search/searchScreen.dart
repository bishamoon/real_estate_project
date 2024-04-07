import 'package:flutter/material.dart';

import '../../componets/widgets/defaultsearchField.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            defaultSearchField(
                prefix: Image.asset(
                  "assets/img/search.png",
                ),
                suffix: GestureDetector(
                  onTap: () {
                    //go to filter page
                  },
                  child: Image.asset(
                    "assets/img/fliter.png",
                  ),
                ),
                width: 383,
                height: 57,
                hintText: 'ابحث عن شقة , منزل',
                controller: _searchController,
                onChanged: (s) {},
                validator: (s) {
                  return null;
                }),

                
          ],
        ),
      ),
     
    );
  }
}
