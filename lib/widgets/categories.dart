import 'package:flutter/material.dart';
import 'package:dijitalimyemek/constanst.dart';
import 'package:dijitalimyemek/models/category.dart';
import 'package:dijitalimyemek/screens/breakfast.dart'; // BreakfastScreen import edin

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.currentCat,
    required this.onCategorySelected, // Yeni parametre
  });

  final String currentCat;
  final void Function(String) onCategorySelected; // Yeni parametre

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          catgories.length,
              (index) => GestureDetector(
            onTap: () {
              final selectedCategory = catgories[index];
              onCategorySelected(selectedCategory); // Kategori seçildiğinde çağrılacak
              if (selectedCategory == 'Breakfast') { // 'Breakfast' kategorisine tıklanırsa
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BreakfastScreen()), // BreakfastScreen'e yönlendir
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: currentCat == catgories[index] ? kprimaryColor : Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                catgories[index],
                style: TextStyle(
                  color: currentCat == catgories[index]
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
