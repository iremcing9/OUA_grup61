import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecipeHomePage(),
      routes: {
        '/detail': (context) => RecipeDetailPage(),
        '/category': (context) => CategoryPage(),
      },
    );
  }
}

class RecipeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yemek Tarifleri'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tarif ara..',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: CategoryCard(
                    title: 'Ana Yemek',
                    subtitle: 'Düşük Kalorili',
                    color: Colors.orange,
                    icon: Icons.restaurant,
                    onTap: () {
                      Navigator.pushNamed(context, '/category',
                          arguments: 'Ana Yemek');
                    },
                  ),
                ),
                Flexible(
                  child: CategoryCard(
                    title: 'Ara Öğün',
                    subtitle: 'Atıştırmalık',
                    color: Colors.green,
                    icon: Icons.cookie,
                    onTap: () {
                      Navigator.pushNamed(context, '/category', arguments: 'Ara Öğün');
                    },
                  ),
                ),
                Flexible(
                  child: CategoryCard(
                    title: 'Kahvaltı',
                    subtitle: '',
                    color: Colors.blue,
                    icon: Icons.breakfast_dining,
                    onTap: () {
                      Navigator.pushNamed(context, '/category', arguments: 'Kahvaltı');
                    },
                  ),
                ),
              ],
            ),
            RecipeCard(
              title: 'Brokoli Çorbası',
              prepTime: '15min',
              cookTime: '25min',
              calories: '120cal',
              servings: '4',
              imageUrl: 'https://www.kevserinmutfagi.com/wp-content/uploads/2013/07/brokoli_corbasi1-1.jpg',
            ),
            RecipeCard(
              title: 'Yeşil Mercimek Salatası',
              prepTime: '10min',
              cookTime: '20min',
              calories: '115cal',
              servings: '4',
              imageUrl: 'https://cdn.ye-mek.net/App_UI/Img/out/650/2018/04/yesil-mercimek-salatasi-resimli-yemek-tarifi(7).jpg',
            ),
            RecipeCard(
              title: 'Chia Tohumlu Yaprak Sarma',
              prepTime: '20min',
              cookTime: '40min',
              calories: '200cal',
              servings: '6',
              imageUrl: 'https://diyetio.com/wp-content/uploads/2020/11/Chia-Tohumlu-Yaprak-Sarma-2-640x475.jpg',
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Tarifler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Alışveriş Listesi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoriler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Ayarlar',
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  CategoryCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 120,
        child: Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String prepTime;
  final String cookTime;
  final String calories;
  final String servings;
  final String imageUrl;

  RecipeCard({
    required this.title,
    required this.prepTime,
    required this.cookTime,
    required this.calories,
    required this.servings,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: RecipeDetailArguments(
            title: title,
            imageUrl: imageUrl,
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Text('Haz. Sür.: $prepTime')),
                        Flexible(child: Text('Pişme Sür.: $cookTime')),
                        Flexible(child: Text('Kalori: $calories')),
                        Flexible(child: Text('Kişilik: $servings')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RecipeDetailArguments args =
    ModalRoute.of(context)!.settings.arguments as RecipeDetailArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(args.imageUrl),
            // Add more details about the recipe here
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                args.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Additional details can go here
          ],
        ),
      ),
    );
  }
}

class RecipeDetailArguments {
  final String title;
  final String imageUrl;

  RecipeDetailArguments({
    required this.title,
    required this.imageUrl,
  });
}

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String category = ModalRoute.of(context)!.settings.arguments as String;

    // Dummy data for category recipes
    final List<RecipeCard> categoryRecipes = [
      RecipeCard(
        title: '$category Recipe 1',
        prepTime: '10min',
        cookTime: '20min',
        calories: '100cal',
        servings: '2',
        imageUrl: 'https://example.com/category_recipe_1.jpg',
      ),
      RecipeCard(
        title: '$category Recipe 2',
        prepTime: '15min',
        cookTime: '25min',
        calories: '150cal',
        servings: '4',
        imageUrl: 'https://example.com/category_recipe_2.jpg',
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(category),
        ),
        body: ListView(
            children: categoryRecipes,
            ),
        );
    }
}