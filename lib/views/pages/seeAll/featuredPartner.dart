import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/functions/filter_function.dart';
import 'package:tamang_food/views/widgets/seeAllTile.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

class FeaturedPartners extends StatelessWidget {
  const FeaturedPartners({super.key});

  @override
  Widget build(BuildContext context) {
    final aa = Provider.of<AllFilterFunction>(context);
    final featured_Partners = aa.Featured_Partners(context);
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Featured Partners',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: featured_Partners.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 12, mainAxisExtent: 350.sp),
          itemBuilder: (context, index) {
            return SeeAllTile(restmodel: featured_Partners[index]);
          },
        ),
      ),
    );
  }
}
