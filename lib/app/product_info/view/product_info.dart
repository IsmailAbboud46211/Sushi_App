import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctors/app/Menu/model/food_model.dart';
import 'package:flutter_doctors/app/cart/data/model/shop_model.dart';
import 'package:flutter_doctors/core/extension/media_query.dart';
import 'package:flutter_doctors/core/extension/sized_box.dart';
import 'package:flutter_doctors/core/global/custom_button.dart';
import 'package:flutter_doctors/core/themes/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductInfo extends StatefulWidget {
  final FoodModel foodModel;
  const ProductInfo({super.key, required this.foodModel});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  //* quantity
  int currentQuantity = 0;

  //*  increment quantity
  void incrementQuantity() {
    setState(() {
      currentQuantity++;
    });
  }

  //* decrement quantity

  void decrementQuantity() {
    if (currentQuantity > 0) {
      setState(() {
        currentQuantity--;
      });
    }
  }

//* add to cart
  void addToCart() {
    if (currentQuantity > 0) {
      var shop = context.read<ShopModel>();
      shop.addToCaet(foodItem: widget.foodModel, quantity: currentQuantity);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfuly aded")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: AppColors.primaryColor,
        ),
        body: Column(
          children: [
            //* List view of product details
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  //* image
                  Image.asset(
                    widget.foodModel.imagePath,
                    height: 200,
                  ),
                  (context.height / 25).ph,
                  //*rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                      (context.height / 50).pw,
                      Text(
                        " ${widget.foodModel.rating}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  (context.height / 50).ph,
                  //* food name
                  Text(
                    " ${widget.foodModel.name}",
                    style: GoogleFonts.dmSerifDisplay(
                      color: AppColors.primaryColor,
                      fontSize: 28,
                    ),
                  ),
                  (context.height / 50).ph,
                  //* Descreption
                  const Text(
                    "Descreption",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "This classic roll is a crowd-pleaser for good reason. It features a generous filling of spicy tuna, a blend of fresh tuna mixed with a flavorful spicy mayo. 1  The roll is often topped with sriracha for an extra kick. 2  The combination of the spicy tuna, the cool cucumber, and the slightly sweet rice creates a delightful explosion of flavors in every bite. 3  This roll is a must-try for sushi enthusiasts .",
                    style: TextStyle(height: 2),
                  )
                ],
              ),
            )),

            Container(
              color: AppColors.primaryColor,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      //* price
                      Text(
                        "\$ ${widget.foodModel.price}",
                        style: TextStyle(
                          color: AppColors.fourthColor,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      //* quantity
                      //* minues button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.thirdColor.withAlpha(
                            100,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: AppColors.softWhite,
                          ),
                          onPressed: decrementQuantity,
                        ),
                      ),
                      //* Quantity count

                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            "$currentQuantity",
                            style: TextStyle(
                              color: AppColors.softWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      //* plus button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.thirdColor.withAlpha(
                            100,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: AppColors.softWhite,
                          ),
                          onPressed: incrementQuantity,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            //* add to cart button
            Container(
                color: AppColors.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: buildCustomButton(title: "Add to cart", context: context, onTap: () {}),
                )),
          ],
        ));
  }
}
