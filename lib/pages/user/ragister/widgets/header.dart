import 'package:flutter/material.dart';
import '../../constant.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingM - 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(children: [
            Column(children: [
              Image(
                image: AssetImage('images/logo.jpg'),
                height: 70,
                width: 70,
              ),
            ]),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image(
                image: AssetImage('images/name.png'),
                height: 60,
                width: 180,
              ),
              Image(
                image: AssetImage('images/tagLine.png'),
                height: 30,
                width: 200,
              ),
            ]),
          ]),

          /* const SizedBox(height: kSpaceM),
          Text('Welcome to E-wishes',
            style: Theme.of(context).textTheme.headline5.copyWith(color: kBlack, fontWeight: FontWeight.bold),
          ),*/
          const SizedBox(height: kSpaceS),
          Text(
            'Register here if you do not have account in E-wishes',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: kBlack.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
}
