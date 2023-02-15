import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import '../modules/archived_screen/archived_screen.dart';
import '../modules/done_screen/done_screen.dart';
import '../modules/new_tasks_screen/task_screen.dart';
import '../shared/components/components.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

// 1. create database
// 2. create tables
// 3. open database
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> screens = [
    TasksScreen(),
    DoneScreen(),
    ArchivedScreen(),
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  Database? database;
  bool isButtomSheetShown = false;
  IconData fabIcon = Icons.edit;
  Database? db;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    CreateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: screens[currentIndex],
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(isButtomSheetShown){
            if(formKey.currentState!.validate()){
              InsertDataToDatabase(
                  title: titlecontroller.text,
                  time: timecontroller.text,
                  date: datecontroller.text,
              ){
                Navigator.pop(context);
                isButtomSheetShown = false;
                setState(() {
                  fabIcon = Icons.edit;
                });
              };
            }
          }else{
            scaffoldKey.currentState?.showBottomSheet((context) =>
                Container(
                  padding: EdgeInsets.all(20.0,),
                  color: Colors.grey[100],
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultFormField(
                          controller: titlecontroller,
                          type: TextInputType.text,
                          label: 'Task Title',
                          prefix: Icons.title,
                          validate: (String? value){
                            if(value!.isEmpty){
                              return('Task Title Must Not Be Empty');
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                            controller: timecontroller,
                            type: TextInputType.datetime,
                            label: 'Task Time',
                            prefix: Icons.watch_later_outlined,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return('Task Time Must Not Be Empty');
                              }
                              return null;
                            },
                            onTaap: (){
                              showTimePicker(context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timecontroller.text = value!.format(context).toString();
                              });
                            }
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                            controller: datecontroller,
                            type: TextInputType.datetime,
                            label: 'Task Date',
                            prefix: Icons.calendar_month_outlined,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return('Task Date Must Not Be Empty');
                              }
                              return null;
                            },
                            onTaap: (){
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2024-09-23'),
                              ).then((value){
                                datecontroller.text = DateFormat.yMMMd().format(value!);
                              });
                            }
                        ),
                      ],
                    ),
                  ),
                )
            );
            setState(() {
              fabIcon = Icons.add;
            });
            isButtomSheetShown = true;
          }
        },
        child: Icon(
          fabIcon,
        ),
      ),
    );
  }

  // 1. CreateDatabase
  void CreateDatabase() async {
    openDatabase('notes.db', version: 1, onCreate: (database, version) {
      database
          .execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY NOT NULL,title TEXT NOT NULL,date TEXT NOT NULL,time TEXT NOT NULL,status TEXT NOT NULL)')
          .then((value) => print("Table created successfully"));
    }, onOpen: (database) {
      print("Database opened successfull");
    }).then((value) {
      db = value;
      print('Database opened');
    });
  }

  // 2. Insert Data to Database
  void InsertDataToDatabase({
    required title,
    required time,
    required date,
}) {
    db?.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO notes(title,date,time,status) VALUES ("$title","$date","$time","new")');
    }).then((val) {
      print("Data was inserted to Database are => ${val}");
    }).catchError((e) => print(e));
  }
}
