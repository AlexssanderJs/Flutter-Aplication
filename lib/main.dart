import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/tourist_place_model.dart';
import 'mocks/tourist_place_mock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _printSnackbarMessage(String message) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Color.fromARGB(193, 0, 0, 0),
        duration: Duration(seconds: 2),
      ),
    );
  }

  final List<TouristPlaceModel> _touristPlaces = touristPlaceMock;
  late final List<bool> _tasksCompleted = List.generate(
    _touristPlaces.length,
    (index) => false,
  );
  final bool _cursorHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 69, 14, 133),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 69, 14, 133),
                ),
                title: Text('Home'),
                onTap: () {
                  _printSnackbarMessage('Home Pressed');
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 69, 14, 133),
        foregroundColor: Colors.white,
        centerTitle: true,
        scrolledUnderElevation: 6.0,
        shadowColor: Color.fromARGB(218, 10, 7, 12),
        surfaceTintColor: Colors.white,
        title: Text(
          'Flutter Cards',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.menu, color: Colors.white),
            tooltip: 'Menu',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
            tooltip: 'Search',
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 69, 14, 133),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(104, 10, 7, 12),
                        blurRadius: 15,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          constraints: BoxConstraints(
                            minHeight: double.infinity,
                            minWidth: double.infinity,
                          ),
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            overlayColor: Color.fromARGB(255, 255, 255, 255),
                          ),

                          onPressed: () {
                            _printSnackbarMessage('Visitados Pressed');
                          },
                          icon: Text(
                            'Visitados',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          hoverColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          constraints: BoxConstraints(
                            minHeight: double.infinity,
                            minWidth: double.infinity,
                          ),
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            overlayColor: Colors.white,
                          ),

                          onPressed: () {
                            _printSnackbarMessage('Favoritos Pressed');
                          },
                          icon: Text(
                            'Favoritos',
                            style: TextStyle(
                              color: _cursorHover
                                  ? Color.fromARGB(255, 69, 14, 133)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: _touristPlaces.length,
                itemBuilder: (context, index) {
                  final iscompleted = _tasksCompleted[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    color: iscompleted
                        ? const Color.fromARGB(255, 241, 255, 241)
                        : Colors.white,
                    margin: EdgeInsets.all(10),
                    elevation: 3,
                    child: InkWell(
                      onTap: () {
                        _printSnackbarMessage('Place Pressed');
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.location_on),
                                    title: Wrap(
                                      children: [
                                        Text(
                                          _touristPlaces[index].name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 35),
                                        Text(_touristPlaces[index].city),
                                      ],
                                    ),

                                    subtitle: Padding(
                                      padding: EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        _touristPlaces[index].description,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(Icons.check),
                                      onPressed: () {
                                        setState(() {
                                          _tasksCompleted[index] =
                                              !_tasksCompleted[index];
                                        });
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                255,
                                                69,
                                                14,
                                                133,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              _touristPlaces[index].category,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                255,
                                                69,
                                                14,
                                                133,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              '${_touristPlaces[index].distance.toStringAsFixed(1)} km',
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                255,
                                                69,
                                                14,
                                                133,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              _touristPlaces[index].isFree
                                                  ? 'Grátis'
                                                  : 'Pago',
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                255,
                                                69,
                                                14,
                                                133,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              _touristPlaces[index].rating
                                                  .toStringAsFixed(1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _printSnackbarMessage('Floating Action Button Pressed');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
