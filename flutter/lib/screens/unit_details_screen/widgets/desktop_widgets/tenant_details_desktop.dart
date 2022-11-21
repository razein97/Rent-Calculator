import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';

class TentantDetailsDesktop extends StatelessWidget {
  const TentantDetailsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                            leading: const Icon(BoxIcons.bx_user_circle),
                            title: const Text("Rohit Singh"),
                            subtitle: const Text('Phone Number: '),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(BoxIcons.bx_edit)),
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
                child: Column(children: const [
                  Text('Status'),
                  Text('Amenities'),
                  Text('Due: ')
                ]),
              )
            ]));
  }
}
