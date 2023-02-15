import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String name;
  final String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
  });
}

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<UserModel> users = [
      UserModel(
        id: 1,
        name: 'Mohamed Salah',
        phone: '+201279433209',
      ),
      UserModel(
        id: 1,
        name: 'Ahmed Salah',
        phone: '+201279433209',
      ),
      UserModel(
        id: 2,
        name: 'Mohamed ahmed',
        phone: '+201279433209',
      ),
      UserModel(
        id: 3,
        name: 'Ali Salah',
        phone: '+201279433209',
      ),
      UserModel(
        id: 4,
        name: 'Mohamed Ali',
        phone: '+201279433209',
      ),
      UserModel(
        id: 5,
        name: 'Kareem Ahmed',
        phone: '+201279433209',
      ),
      UserModel(
        id: 6,
        name: 'Abdo Salah',
        phone: '+201279433209',
      ),
      UserModel(
        id: 7,
        name: 'Abullah Karem',
        phone: '+201279433209',
      ),
      UserModel(
        id: 8,
        name: 'Fawzy Salah',
        phone: '+201279433209',
      ),
      UserModel(
        id: 9,
        name: 'Lotfy Mohsen',
        phone: '+201279433209',
      ),
      UserModel(
        id: 10,
        name: 'Kokha Said',
        phone: '+201279433209',
      ),
      UserModel(
        id: 1,
        name: 'Mohamed Salah',
        phone: '+201279433209',
      ),
      UserModel(
        id: 1,
        name: 'Ahmed Salah',
        phone: '+201279433209',
      ),
      UserModel(
        id: 2,
        name: 'Mohamed ahmed',
        phone: '+201279433209',
      ),
      UserModel(
        id: 3,
        name: 'Ali Salah',
        phone: '+201279433209',
      ),
      UserModel(
        id: 4,
        name: 'Mohamed Ali',
        phone: '+201279433209',
      ),
      UserModel(
        id: 5,
        name: 'Kareem Ahmed',
        phone: '+201279433209',
      ),
      UserModel(
        id: 6,
        name: 'Abdo Salah',
        phone: '+201279433209',
      ),
      UserModel(
        id: 7,
        name: 'Abullah Karem',
        phone: '+201279433209',
      ),
      UserModel(
        id: 8,
        name: 'Fawzy Salah',
        phone: '+201279433209',
      ),
      UserModel(
        id: 9,
        name: 'Lotfy Mohsen',
        phone: '+201279433209',
      ),
      UserModel(
        id: 10,
        name: 'Kokha Said',
        phone: '+201279433209',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => itemBuilt(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsetsDirectional.only(
            start: 20,
          ),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  // buildItem
  Widget itemBuilt(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
