import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(0, 60, 11, 255)),
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class ModelPage extends StatefulWidget {
  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  final ageController = TextEditingController();
  final sexController = TextEditingController();
  final cpController = TextEditingController();
  final trestbpsController = TextEditingController();
  final cholController = TextEditingController();
  final fbsController = TextEditingController();
  final restecgController = TextEditingController();
  final thalachController = TextEditingController();
  final exangController = TextEditingController();
  final oldpeakController = TextEditingController();
  final slopeController = TextEditingController();
  final caController = TextEditingController();
  final thalController = TextEditingController();
  String? modelResponse;

  @override
  void dispose() {
    ageController.dispose();
    sexController.dispose();
    cpController.dispose();
    trestbpsController.dispose();
    cholController.dispose();
    fbsController.dispose();
    restecgController.dispose();
    thalachController.dispose();
    exangController.dispose();
    oldpeakController.dispose();
    slopeController.dispose();
    caController.dispose();
    thalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Age',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: sexController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Sex',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: cpController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: const Color.fromARGB(255, 38, 0, 53)),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Cp',
                      hintStyle: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: trestbpsController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Trestbps',
                      hintStyle: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: cholController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Chol',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: fbsController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Fbs',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: restecgController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Restecg',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: thalachController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Thalach',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: exangController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Exang',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: oldpeakController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Oldpeak',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: slopeController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Slope',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: caController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 81, 91, 146),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Ca',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: TextField(
                controller: thalController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 81, 91, 146),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  hintText: 'Thal',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    appState
                        .callModel(
                      ageController.text,
                      sexController.text,
                      cpController.text,
                      trestbpsController.text,
                      cholController.text,
                      fbsController.text,
                      restecgController.text,
                      thalachController.text,
                      exangController.text,
                      oldpeakController.text,
                      slopeController.text,
                      caController.text,
                      thalController.text,
                    )
                        .then((value) {
                      setState(() {
                        modelResponse = value;
                      });
                    });
                  },
                  child: Text('Predict'),
                ),
                if (modelResponse != null) ...[
                  SizedBox(height: 20),
                  Text(
                      'Response: ${(json.decode(modelResponse!)['score'] * 100).toStringAsFixed(2)}%'),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];

  GlobalKey? historyListKey;

  Future<String> callModel(
      String age,
      String sex,
      String cp,
      String trestbps,
      String chol,
      String fbs,
      String restecg,
      String thalach,
      String exang,
      String oldpeak,
      String slope,
      String ca,
      String thal) async {
    final url = Uri.parse("https://fastapiml-latest.onrender.com/score");
    final headers = {"Content-Type": "application/json;charset=UTF-8"};
    try {
      final predictionInstance = {
        "age": int.parse(age),
        "sex": int.parse(sex),
        "cp": int.parse(cp),
        "trestbps": int.parse(trestbps),
        "chol": int.parse(chol),
        "fbs": int.parse(fbs),
        "restecg": int.parse(restecg),
        "thalach": int.parse(thalach),
        "exang": int.parse(exang),
        "oldpeak": double.parse(oldpeak),
        "slope": int.parse(slope),
        "ca": int.parse(ca),
        "thal": int.parse(thal)
      };
      final res = await http.post(url,
          headers: headers, body: jsonEncode(predictionInstance));
      if (res.statusCode == 200) {
        final jsonPrediction = res.body;
        return jsonPrediction;
      } else {
        return 'Error: Status ${res.statusCode}';
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      case 2:
        page = ModelPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceContainerHighest,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .surface, // Asegura el color de fondo
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorites',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.rocket),
                        label: 'Model',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.rocket_launch),
                        label: 'Retrain',
                      )
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.rocket),
                        label: Text('Model'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.rocket_launch),
                        label: Text('Retrain'),
                      )
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: HistoryListView(),
          ),
          SizedBox(height: 10),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          // Make sure that the compound word wraps correctly when the window
          // is too narrow.
          child: MergeSemantics(
            child: Wrap(
              children: [
                Text(
                  pair.first,
                  style: style.copyWith(fontWeight: FontWeight.w200),
                ),
                Text(
                  pair.second,
                  style: style.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        Expanded(
          // Make better use of wide windows with a grid.
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 400 / 80,
            ),
            children: [
              for (var pair in appState.favorites)
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                    color: theme.colorScheme.primary,
                    onPressed: () {
                      appState.removeFavorite(pair);
                    },
                  ),
                  title: Text(
                    pair.asLowerCase,
                    semanticsLabel: pair.asPascalCase,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class HistoryListView extends StatefulWidget {
  const HistoryListView({super.key});

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  /// Needed so that [MyAppState] can tell [AnimatedList] below to animate
  /// new items.
  final _key = GlobalKey();

  /// Used to "fade out" the history items at the top, to suggest continuation.
  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.transparent, Colors.black],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    appState.historyListKey = _key;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination (i.e. our animated list).
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: true,
        padding: EdgeInsets.only(top: 100),
        initialItemCount: appState.history.length,
        itemBuilder: (context, index, animation) {
          final pair = appState.history[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  appState.toggleFavorite(pair);
                },
                icon: appState.favorites.contains(pair)
                    ? Icon(Icons.favorite, size: 12)
                    : SizedBox(),
                label: Text(
                  pair.asLowerCase,
                  semanticsLabel: pair.asPascalCase,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}