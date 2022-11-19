import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';

class TentantDetailsDesktop extends StatelessWidget {
  const TentantDetailsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeHelper.displayWidth! * 1,
        height: SizeHelper.displayHeight! * 0.4,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.amber,
                width: SizeHelper.displayWidth! * 0.6,
                height: SizeHelper.displayHeight,
                child: Column(children: [
                  const Text('Tenant Info'),
                  Expanded(
                    child: ListView(
                      children: [
                        Card(
                          child: ListTile(
                            leading: FaIcon(FontAwesomeIcons.circleUser),
                            title: Text("Rohit Singh"),
                            subtitle: Text('Phone Number: '),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: FaIcon(FontAwesomeIcons.penToSquare)),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
              Container(
                color: Colors.red,
                width: SizeHelper.displayWidth! * 0.4,
                height: SizeHelper.displayHeight,
                child: Column(children: [
                  const Text('Status'),
                  Text('Amenities'),
                  const Text('Due: ')
                ]),
              )
            ]));
  }
}
