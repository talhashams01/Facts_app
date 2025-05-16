// import 'package:facts_app/data/facts_data.dart';
// import 'package:facts_app/models/fact.dart';
// import 'package:facts_app/services/favorite_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:card_swiper/card_swiper.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key, required List facts});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Fact> randomFacts = [];
//   final List<Color> cardColors = [
//     Colors.deepPurple.shade400,
//     Colors.indigo.shade400,
//     Colors.teal.shade400,
//     Colors.orange.shade400,
//     Colors.pink.shade400,
//     Colors.blue.shade400,
//   ];

//   @override
//   void initState() {
//     super.initState();
//     randomFacts = List.from(allFacts)..shuffle();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        backgroundColor: const Color.fromRGBO(245, 242, 242, 1),
//        appBar: AppBar(title: Text('Factopedia'),
//        backgroundColor: Colors.white,
//        ),
//       body: SafeArea(
//         child: Swiper(
//           itemCount: randomFacts.length,
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             final fact = randomFacts[index];
//             final cardColor = cardColors[index % cardColors.length];

//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: cardColor,
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 6, horizontal: 12),
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.3),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           fact.category,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     Text(
//                       fact.text,
//                       style: const TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             fact.isFavorite
//                                 ? Icons.favorite
//                                 : Icons.favorite_border,
//                             color:
//                                 fact.isFavorite ? Colors.red : Colors.white,
//                           ),
//                           onPressed: () async {
//                             setState(() {
//                               fact.isFavorite = !fact.isFavorite;
//                             });
//                             await FavoriteService.toggleFavorite(fact.text);
//                           },
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.copy, color: Colors.white),
//                           onPressed: () async {
//                             await Clipboard.setData(
//                                 ClipboardData(text: fact.text));
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text("Copied to clipboard")),
//                             );
//                           },
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.share, color: Colors.white),
//                           onPressed: () async {
//                             await Share.share(fact.text);
//                           },
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


// import 'package:facts_app/data/facts_data.dart';
// import 'package:facts_app/models/fact.dart';
// import 'package:facts_app/provider/category_preference_provider.dart';
// import 'package:facts_app/services/favorite_service.dart';
// import 'package:facts_app/provider/font_size_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:card_swiper/card_swiper.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key, required List facts});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Fact> randomFacts = [];
//   final List<Color> cardColors = [
//     Colors.deepPurple.shade400,
//     Colors.indigo.shade400,
//     Colors.teal.shade400,
//     Colors.orange.shade400,
//     Colors.pink.shade400,
//     Colors.blue.shade400,
//   ];

//   @override
//   void initState() {
//     super.initState();
//     randomFacts = List.from(allFacts)..shuffle();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//     final categoryProvider = Provider.of<CategoryPreferenceProvider>(context, listen: false);
//     final allowedFacts = allFacts
//         .where((fact) => categoryProvider.selectedCategories.contains(fact.category))
//         .toList();
//     setState(() {
//       randomFacts = allowedFacts..shuffle();
//     });
//   });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final fontSize = Provider.of<FontSizeProvider>(context).fontSize;

//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(245, 242, 242, 1),
//       appBar: AppBar(
//         title: const Text('Factopedia'),
//         backgroundColor: Colors.white,
//       ),
//       body: SafeArea(
//         child: Consumer<CategoryPreferenceProvider>(
//         builder: (context, categoryProvider, _) {
//           final filteredFacts = allFacts
//               .where((fact) => categoryProvider.selectedCategories.contains(fact.category))
//               .toList();
//             filteredFacts.shuffle();
        
//       return  Swiper(
//           itemCount: randomFacts.length,
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             final fact = randomFacts[index];
//             final cardColor = cardColors[index % cardColors.length];

//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: cardColor,
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 6, horizontal: 12),
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.3),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           fact.category,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     Text(
//                       fact.text,
//                       style: TextStyle(
//                         fontSize: fontSize,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             fact.isFavorite
//                                 ? Icons.favorite
//                                 : Icons.favorite_border,
//                             color: fact.isFavorite ? Colors.red : Colors.white,
//                           ),
//                           onPressed: () async {
//                             setState(() {
//                               fact.isFavorite = !fact.isFavorite;
//                             });
//                             await FavoriteService.toggleFavorite(fact.text);
//                           },
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.copy, color: Colors.white),
//                           onPressed: () async {
//                             await Clipboard.setData(
//                                 ClipboardData(text: fact.text));
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text("Copied to clipboard")),
//                             );
//                           },
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.share, color: Colors.white),
//                           onPressed: () async {
//                             await Share.share(fact.text);
//             },
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             );
//         },
//         );
//         },
//     ),
//     )
//     );
//   }
// }



// import 'package:facts_app/data/facts_data.dart';
// //import 'package:facts_app/models/fact.dart';
// import 'package:facts_app/services/favorite_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:card_swiper/card_swiper.dart';
// import '../provider/category_preference_provider.dart';
// import '../provider/font_size_provider.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   final List<Color> cardColors = const [
//     Color(0xFF7E57C2),
//     Color(0xFF5C6BC0),
//     Color(0xFF26A69A),
//     Color(0xFFFFA726),
//     Color(0xFFEC407A),
//     Color(0xFF42A5F5),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(245, 242, 242, 1),
//       appBar: AppBar(
//         title: const Text('Factopedia'),
//         backgroundColor: Colors.white,
//       ),
//       body: SafeArea(
//         child: Consumer2<CategoryPreferenceProvider, FontSizeProvider>(
//           builder: (context, categoryProvider, fontProvider, _) {
//             final filteredFacts = allFacts
//                 .where((fact) => categoryProvider.selectedCategories.contains(fact.category))
//                 .toList()
//               ..shuffle();

//             if (filteredFacts.isEmpty) {
//               return const Center(child: Text("No facts match your selected categories."));
//             }

//             return Swiper(
//               itemCount: filteredFacts.length,
//               scrollDirection: Axis.vertical,
//               itemBuilder: (context, index) {
//                 final fact = filteredFacts[index];
//                 final cardColor = cardColors[index % cardColors.length];

//                 return Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: cardColor,
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     padding: const EdgeInsets.all(24),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//                             decoration: BoxDecoration(
//                               color: Colors.black.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Text(
//                               fact.category,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         Text(
//                           fact.text,
//                           style: TextStyle(
//                             fontSize: fontProvider.fontSize,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const Spacer(),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 fact.isFavorite ? Icons.favorite : Icons.favorite_border,
//                                 color: fact.isFavorite ? Colors.red : Colors.white,
//                               ),
//                               onPressed: () async {
//                                 fact.isFavorite = !fact.isFavorite ;
//                                 fact.isFavorite ? Colors.red : Colors.white;
//                                 await FavoriteService.toggleFavorite(fact.text);
                                 
//                               },
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.copy, color: Colors.white),
//                               onPressed: () async {
//                                 await Clipboard.setData(ClipboardData(text: fact.text));
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(content: Text("Copied to clipboard")),
//                                 );
//                               },
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.share, color: Colors.white),
//                               onPressed: () async {
//                                 await Share.share(fact.text);
//                               },
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:facts_app/data/facts_data.dart';
import 'package:facts_app/services/favorite_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:card_swiper/card_swiper.dart';
import '../provider/category_preference_provider.dart';
import '../provider/font_size_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Color> cardColors = const [
    Color(0xFF7E57C2),
    Color(0xFF5C6BC0),
    Color.fromARGB(255, 43, 139, 130),
    Color.fromARGB(255, 167, 145, 114),
    Color.fromARGB(255, 65, 77, 33),
    Color(0xFF42A5F5),
     Color.fromARGB(255, 167, 86, 104),
      Color.fromARGB(255, 93, 79, 133),
       Color.fromARGB(255, 5, 151, 102),
        Color.fromARGB(255, 100, 32, 52),
        
    

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 242, 242, 1),
      appBar: AppBar(
        title: const Text('Factopedia'),
        //backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Consumer2<CategoryPreferenceProvider, FontSizeProvider>(
          builder: (context, categoryProvider, fontProvider, _) {
            final selectedFacts = allFacts
                .where((fact) => categoryProvider.selectedCategories.contains(fact.category))
                .toList();

            final filteredFacts = selectedFacts
                .where((fact) =>
                    fact.text.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                    fact.category.toLowerCase().contains(_searchQuery.toLowerCase()))
                .toList()
              ..shuffle();

            return Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() => _searchQuery = value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search facts by keywords...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),

                if (filteredFacts.isEmpty)
                  const Expanded(
                    child: Center(child: Text("No facts found matching your search.",style: TextStyle(color: Colors.blue),)),
                  )
                else
                  Expanded(
                    child: Swiper(
                      itemCount: filteredFacts.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final fact = filteredFacts[index];
                        final cardColor = cardColors[index % cardColors.length];

                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      fact.category,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  fact.text,
                                  style: TextStyle(
                                    fontSize: fontProvider.fontSize,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        fact.isFavorite ? Icons.favorite : Icons.favorite_border,
                                        color: fact.isFavorite ? Colors.red : Colors.white,
                                      ),
                                      onPressed: () async {
                                      fact.isFavorite = !fact.isFavorite;
                                        await FavoriteService.toggleFavorite(fact.text);
                                        
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.copy, color: Colors.white),
                                      onPressed: () async {
                                        await Clipboard.setData(ClipboardData(text: fact.text));
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text("Copied to clipboard")),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.share, color: Colors.white),
                                      onPressed: () async {
                                        await Share.share(fact.text);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}