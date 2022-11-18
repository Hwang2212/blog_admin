import 'package:Blog_web/models/models.dart';

class StagingCategory {
  static List<CategoryModel> categoryList = [
    const CategoryModel(
      id: 1,
      activated: 1,
      description: "AI is Artificial Intelligience",
      name: 'AI',
    ),
    const CategoryModel(
      id: 2,
      activated: 2,
      description: "Cryptocurrency is a decentralised coin",
      name: 'Cryptocurrency',
    ),
    const CategoryModel(
      id: 3,
      activated: 1,
      description: "Data Science is DS",
      name: 'Data Science',
    ),
    const CategoryModel(
      id: 4,
      activated: 2,
      description: "BLockchain is a tool for web 3",
      name: 'BlockChain',
    ),
  ];
}
