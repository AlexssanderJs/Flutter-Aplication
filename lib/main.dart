import 'package:flutter/material.dart';
import 'models/tourist_place_model.dart';
import 'models/task_list_model.dart';
import 'mocks/tourist_place_mock.dart';
import 'mocks/task_list_mock.dart';

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

  final List<TaskListModel> _tasks = taskListMock;
  late final List<bool> _tasksStatus = List.generate(
    _tasks.length,
    (index) => _tasks[index].isCompleted,
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
                            _printSnackbarMessage('Concluidos Pressed');
                          },
                          icon: Text(
                            'Concluidos',
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
                            _printSnackbarMessage('Em Andamento Pressed');
                          },
                          icon: Text(
                            'Em Andamento',
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
                            _printSnackbarMessage('Todos Pressed');
                          },
                          icon: Text(
                            'Todos',
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            alignment: Alignment.centerLeft,
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
            child: Text(
              'Tarefas Concluídas: ${_tasksStatus.where((status) => status).length} de ${_tasksStatus.length}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final iscompleted = _tasksStatus[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    color: iscompleted
                        ? const Color.fromARGB(255, 241, 255, 241)
                        : Colors.white,
                    margin: EdgeInsets.all(10),
                    elevation: 3,
                    child: InkWell(
                      onTap: () {
                        _printSnackbarMessage('Task Pressed');
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.check_circle,
                                      color: iscompleted
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    title: Text(
                                      _tasks[index].title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    subtitle: Padding(
                                      padding: EdgeInsets.only(top: 4.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            _tasks[index].description,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                      255,
                                                      69,
                                                      14,
                                                      133,
                                                    ),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Text(
                                                  iscompleted
                                                      ? 'Concluída'
                                                      : 'Pendente',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(Icons.check),
                                      onPressed: () {
                                        setState(() {
                                          _tasksStatus[index] =
                                              !_tasksStatus[index];
                                        });
                                      },
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
