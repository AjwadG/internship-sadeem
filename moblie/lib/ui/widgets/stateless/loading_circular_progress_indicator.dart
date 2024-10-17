import 'package:flutter/material.dart';

class LoadingCircularProgressIndicator extends StatelessWidget {
  const LoadingCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, //70.0,
      height: MediaQuery.of(context).size.height, //70.0,
      child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            child: Center(
                child: Container(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            )),
          )),
    );
  }
}
