import 'package:flutter/material.dart';
import 'package:rapid_pass/models/categories.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (_, index) {
          var category = categories[index];
          return Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  category.name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                // Sub Category
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 0,
                  ),
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: category.subcategories.length,
                  itemBuilder: (context, subIndex) {
                    final subcategory = category.subcategories[subIndex];
                    return GestureDetector(
                      onTap: () {
                        print('Tapped');
                      },
                      child: Card(
                        color: Theme.of(context).colorScheme.primary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 54,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(subcategory.icon),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              subcategory.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}