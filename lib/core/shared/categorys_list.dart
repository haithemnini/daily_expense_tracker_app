import 'package:flutter/material.dart';

import '../enum/categorys.dart';
import 'item_button.dart';

class CategorysList extends StatelessWidget {
  const CategorysList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: categorys.length,
      itemBuilder: (context, index) {
        final Categorys category = categorys[index];
        return _buildCategorysItem(context, category);
      },
    );
  }

  _buildCategorysItem(BuildContext context, Categorys category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ItemButton(
        text: category.name,
        icon: category.icon,
        iconColor: Colors.white,
        backgroundItem: Colors.transparent,
        backgroundIcon: category.backgroundIcon,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        onPressed: () => {},
      ),
    );
  }
}
