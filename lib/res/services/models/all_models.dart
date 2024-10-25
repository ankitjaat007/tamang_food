class ResturentModel {
  String rest_name,
      rest_banner,
      rest_address,
      rest_location,
      delevery_time,
      rest_type;
  List<String> rest_image, rest_tastService;
  int rest_id, food_id;
  double rest_rating;
  bool free_delivery;
  ResturentModel(
      this.rest_id,
      this.food_id,
      this.rest_name,
      this.rest_banner,
      this.rest_address,
      this.rest_location,
      this.rest_rating,
      this.delevery_time,
      this.free_delivery,
      this.rest_image,
      this.rest_tastService,
      this.rest_type);
  ResturentModel.fromModelList(Map<String, dynamic> json)
      : rest_id = json['rest_id'] ?? 0,
        food_id = json['food_id'] ?? 0,
        rest_name = json['rest_name'] ?? "",
        rest_banner = json['rest_banner'] ?? "",
        rest_address = json['rest_address'] ?? "",
        rest_location = json['rest_location'] ?? "",
        rest_rating = json['rest_rating'] ?? 0.0,
        delevery_time = json['delevery_time'] ?? "",
        free_delivery = json['free_delivery'] ?? false,
        rest_image = (json['rest_image'] as List) == Null
            ? []
            : (json['rest_image'] as List).map((e) => e.toString()).toList(),
        rest_tastService = ((json['rest_tastService'] ?? []) as List)
            .map((e) => e.toString())
            .toList(),
        rest_type = json['rest_type'] ?? "";
}

// =================================
// food model
class FoodModel {
  int rest_id, food_id, cat_id, price, food_delivery;
  double food_rating;
  String food_name, food_img, description, food_tast, food_type;
  List<String> top_Cookied, bottom_Cookied;

  FoodModel(
      this.rest_id,
      this.food_id,
      this.cat_id,
      this.food_name,
      this.food_img,
      this.description,
      this.food_tast,
      this.price,
      this.food_rating,
      this.food_type,
      this.top_Cookied,
      this.bottom_Cookied,
      this.food_delivery);
  FoodModel.fromModelList(Map<String, dynamic> json)
      : rest_id = json['rest_id'] ?? 0,
        food_id = json['food_id'] ?? 0,
        cat_id = json['cat_id'] ?? 0,
        food_delivery = json['food_delivery'] ?? 0,
        food_name = json['food_name'] ?? '',
        food_img = json['food_img'] ?? '',
        description = json['description'] ?? '',
        food_tast = json['food_tast'] ?? '',
        price = json['price'] ?? 0,
        food_rating = json['food_rating'] ?? 0,
        food_type = json['food_type'] ?? '',
        top_Cookied = ((json['top_Cookied'] ?? []) as List)
            .map((e) => e.toString())
            .toList(),
        bottom_Cookied = ((json['bottom_Cookied'] ?? []) as List)
            .map((e) => e.toString())
            .toList();
}

// =================================
// category model
class CategoryModel {
  int cat_id;
  String category_name, cat_img;
  CategoryModel(this.cat_id, this.category_name, this.cat_img);
  CategoryModel.fromModelList(Map<String, dynamic> json)
      : cat_id = json['cat_id'] ?? 0,
        category_name = json['category_name'] ?? '',
        cat_img = json['cat_img'] ?? '';
}

// =============
class OrderModel {
  int? orderquantity;
  int? price;
  FoodModel? fmodel;
  OrderModel(
      {required this.orderquantity, required this.price, required this.fmodel});
}

// =================================
// user model
class UserModel {
  String name, email, password;
  UserModel(this.name, this.email, this.password);

  UserModel.fromModelList(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        email = json['email'] ?? "",
        password = json['password'] ?? "";
}

// ================================================
// ================================================
// ================================================
// ------fireBase model
// ================================================
// ================================================
class AdmissionModel {
  String? name, studentClass, fullAddress, dob, studentid;
  int? phoneNumber;
  AdmissionModel({
    this.name,
    this.studentClass,
    this.fullAddress,
    this.phoneNumber,
    this.studentid,
    this.dob,
  });
  Map<String, dynamic> tomap() {
    return {
      "name": name,
      "studentClass": studentClass,
      "fullAddress": fullAddress,
      "phoneNumber": phoneNumber,
      "dob": dob,
    };
  }

  AdmissionModel.fromjson(Map<String, dynamic> json, this.studentid)
      : name = json['name'],
        studentClass = json['studentClass'],
        fullAddress = json['fullAddress'],
        phoneNumber = json['phoneNumber'],
        dob = json['dob'];
}
