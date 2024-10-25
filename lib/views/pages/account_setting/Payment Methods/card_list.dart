import 'package:flutter/material.dart';
import 'package:tamang_food/res/components/listTile/comanListTile.dart';
import 'package:tamang_food/res/dummyData.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

class Card_list extends StatelessWidget {
  const Card_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Payment Methods', context: context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ...List.generate(
                DummyData().cardList.length,
                (index) => ComanListTile(
                      leadingImg: DummyData().cardList[index]['iconImg'],
                      title: DummyData().cardList[index]['title'],
                      subtitle: DummyData().cardList[index]['subtitle'],
                      tralingicon: Icons.arrow_forward_ios,
                    ))
          ],
        ),
      ),
    );
  }
}
