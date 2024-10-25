import 'package:flutter/material.dart';
import 'package:tamang_food/auth/boarding_page.dart';
import 'package:tamang_food/auth/login/Forgot_page/Forgot_Password.dart';
import 'package:tamang_food/auth/welcome_page.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';
import 'package:tamang_food/views/firebase%20work/sir_class.dart';
import 'package:tamang_food/views/pages/account_setting/Payment%20Methods/Payment_Methods.dart';

import '../../auth/login/Forgot_page/Reset_email.dart';
import '../../auth/login/sign_in/Sign_in.dart';
import '../../auth/login/sign_up/confirm_number.dart';
import '../../auth/login/sign_up/enter_Address.dart';
import '../../auth/login/sign_up/login_number.dart';
import '../../auth/login/sign_up/sign_up.dart';
import '../../views/Navigation_Bar/Navigation_bar.dart';
import '../../views/firebase work/my school/schoolHomepage.dart';
import '../../views/pages/account_setting/AddSocialAccounts.dart';
import '../../views/pages/account_setting/Change_Password.dart';
import '../../views/pages/account_setting/Locations.dart';
import '../../views/pages/account_setting/Payment Methods/card_list.dart';
import '../../views/pages/account_setting/Profile_Information.dart';
import '../../views/pages/account_setting/RefertoFriends.dart';
import '../../views/pages/filterPage.dart';
import '../../views/pages/search page/Searchresults.dart';
import '../../views/pages/search page/search_food.dart';
import '../../views/pages/search page/showCategorieFood.dart';
import '../../views/pages/seeAll/bestPick.dart';
import '../../views/pages/seeAll/featuredPartner.dart';

class AppRoutes {
  static Route<dynamic> getRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.welcome_page:
        return MaterialPageRoute(
          builder: (context) => Welcome_page(),
        );
      case RouteName.boarding_page:
        return MaterialPageRoute(
          builder: (context) => Boarding_page(),
        );
      case RouteName.sign_In_page:
        return MaterialPageRoute(
          builder: (context) => Sign_In_page(),
        );
      case RouteName.forgot_Password_page:
        return MaterialPageRoute(
          builder: (context) => Forgot_Password_page(),
        );
      case RouteName.resetEmail_page:
        return MaterialPageRoute(
          builder: (context) => ResetEmail_page(),
        );
      case RouteName.sign_up_page:
        return MaterialPageRoute(
          builder: (context) => Sign_up_page(),
        );
      case RouteName.login_number_page:
        return MaterialPageRoute(
          builder: (context) => Login_number_page(),
        );
      case RouteName.confirm_number_page:
        return MaterialPageRoute(
          builder: (context) => Confirm_number_page(),
        );
      case RouteName.enter_address_page:
        return MaterialPageRoute(
          builder: (context) => Enter_address_page(),
        );
      case RouteName.bottom_navigationBar:
        {
          dynamic model = setting.arguments;
          return MaterialPageRoute(
              builder: (context) => Bottom_navigationBar(restModel: model));
        }
      case RouteName.filterPage:
        return MaterialPageRoute(
          builder: (context) => FilterPage(),
        );
      case RouteName.featuredPartners:
        return MaterialPageRoute(
          builder: (context) => FeaturedPartners(),
        );
      case RouteName.bestPick:
        return MaterialPageRoute(
          builder: (context) => BestPick(),
        );
      case RouteName.profile_Information:
        return MaterialPageRoute(
          builder: (context) => Profile_Information(),
        );
      case RouteName.change_Password:
        return MaterialPageRoute(
          builder: (context) => Change_Password(),
        );
      case RouteName.payment_Methods:
        return MaterialPageRoute(
          builder: (context) => Payment_Methods(),
        );
      case RouteName.card_list:
        return MaterialPageRoute(
          builder: (context) => Card_list(),
        );
      case RouteName.locations_page:
        return MaterialPageRoute(
          builder: (context) => Locations_page(),
        );
      case RouteName.add_Social_Accounts:
        return MaterialPageRoute(
          builder: (context) => Add_Social_Accounts(),
        );
      case RouteName.refer_to_Friends:
        return MaterialPageRoute(
          builder: (context) => Refer_to_Friends(),
        );
      case RouteName.search_food:
        return MaterialPageRoute(
          builder: (context) => Search_food(),
        );
      case RouteName.searchresults:
        {
          dynamic model = setting.arguments;
          return MaterialPageRoute(
            builder: (context) => Searchresults(foodModel: model),
          );
        }
      case RouteName.showCategoriesFood:
        {
          dynamic model = setting.arguments;
          return MaterialPageRoute(
            builder: (context) => ShowCategoriesFood(catmodel: model),
          );
        }
      // =============================================================
      // =============================================================
      // =============================================================
      // =============================================================
      case RouteName.sir_class:
        return MaterialPageRoute(
          builder: (context) => UserFormView(),
        );
      case RouteName.school_homepage:
        return MaterialPageRoute(
          builder: (context) => School_homepage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Align(
              alignment: Alignment.center,
              child: Text(
                "No Routes",
              ),
            ),
          ),
        );
    }
  }
}
