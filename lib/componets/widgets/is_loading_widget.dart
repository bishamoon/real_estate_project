import 'package:flutter/material.dart';

class IsLoadingWidget extends StatelessWidget {
  const IsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(),
        ),
        SizedBox(
          height: 20,
        ),
        Text("جاري التحميل...")
      ],
    );
  }
}
