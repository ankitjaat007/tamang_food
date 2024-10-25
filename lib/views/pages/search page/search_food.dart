import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';
import 'package:tamang_food/views/widgets/serch%20widget/topCategories.dart';

import '../../../res/services/controller/all_controller.dart';
import '../../../res/helper/appservices.dart';
import '../../../res/helper/textStyle.dart';

class Search_food extends StatelessWidget {
  const Search_food({super.key});

  @override
  Widget build(BuildContext context) {
    final catmodel = Provider.of<AllController>(context).getallCategroy;
    final foodmodel = Provider.of<AllController>(context).getallFood;
    return Scaffold(
      appBar: EasySearchBar(
          onSuggestionTap: (data) {
            // App_Service.push_to_screen(
            //     Searchresults(
            //         foodModel: foodmodel
            //             .where((element) => element.food_name == data)
            //             .first),
            //     context);
            Navigator.pushNamed(context, RouteName.searchresults,
                arguments: foodmodel
                    .where((element) => element.food_name == data)
                    .first);
          },
          suggestions: foodmodel.map((e) => e.food_name).toList(),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Search'),
          onSearch: (p0) {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Categories',
                style: AppTextStyle.fs16Normal,
              ),
              App_Service.add_Height(10),
              GridView.builder(
                shrinkWrap: true,
                itemCount: catmodel.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 170.sp),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        // App_Service.push_to_screen(
                        //     ShowCategoriesFood(catmodel: catmodel[index]),
                        //     context);
                        Navigator.pushNamed(
                            context, RouteName.showCategoriesFood,
                            arguments: catmodel[index]);
                      },
                      child: Top_Categories(catmodel: catmodel[index]));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
