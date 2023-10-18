import 'package:ant/view_models/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var firstName = authProvider.firstName;
    CollectionReference unitCollection =
      FirebaseFirestore.instance.collection('leads');
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      
      body: StreamBuilder(
          stream: unitCollection.where('closer', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }

            
            

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                print(snapshot.data!.docs.length);
                return GestureDetector(
                  onTap: () {},
                  child: UnitTile(title: snapshot.data!.docs[index]['email'], subtitle: snapshot.data!.docs[index]['phone'].toString()),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Get.to(AddUnits());
        },
        child: Icon(Icons.add),
        elevation: 0,
      ),
    );
    
  }



  
}


class UnitTile extends StatelessWidget {
  UnitTile({
    required this.title,
    required this.subtitle,
    super.key,
  });

  TextEditingController controller = TextEditingController();
  String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        trailing: IconButton(onPressed: (){

          

        }, icon: Icon(Icons.call, color: Colors.green,)),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        
      ),
    );
  }

  launchDialer(String number) async {
  String url = 'tel:' + number;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Application unable to open dialer.';
  }
}
}
