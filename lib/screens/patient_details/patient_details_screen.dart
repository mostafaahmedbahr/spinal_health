 import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
  import 'package:o3d/o3d.dart';
 import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../core/app_colors/colors.dart';

class PatientDetailsScreen extends StatefulWidget {
    const PatientDetailsScreen({super.key});

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  O3DController controller = O3DController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("Patient Details"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {

                });
              },
              icon: const Icon(Icons.change_circle)),

        ],
      ),
      body: Column(
        crossAxisAlignment:  CrossAxisAlignment.center,
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: MediaQuery.of(context).size.height/2,
          //   child: O3D.network(
          //     src:'https://models.readyplayer.me/6512bdb81c810b0e7e6fc3c3.glb',
          //     controller: controller,
          //   ),
          // ),

      FutureBuilder<Map<String, dynamic>>(
        future: fetchDataFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(
              color:  AppColors.primaryColor,
            ));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Text('No Data Available');
          } else {
            // Data available, build UI
            return DataListView(data: snapshot.data!);
          }
        },
      ),



        ],
      ),
    ));
  }
}

 class DataListView extends StatelessWidget {
   final Map<String, dynamic> data;

   const DataListView({Key? key, required this.data}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Column(
       children: [
         ListTile(
           title: const Text('Force Sensor'),
           subtitle: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               DataItem(label: 'FSR1', value: data['sensor_data']['force_sensor']['fsr1'].toString()),
               DataItem(label: 'FSR2', value: data['sensor_data']['force_sensor']['fsr2'].toString()),
               DataItem(label: 'FSR3', value: data['sensor_data']['force_sensor']['fsr3'].toString()),
             ],
           ),
         ),
         ListTile(
           title: Text('MPU6050'),
           subtitle: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               DataItem(label: 'Angle X', value: data['sensor_data']['mpu6050']['angle_x'].toString()),
               DataItem(label: 'Angle Y', value: data['sensor_data']['mpu6050']['angle_y'].toString()),
               DataItem(label: 'Angle Z', value: data['sensor_data']['mpu6050']['angle_z'].toString()),
             ],
           ),
         ),
       ],
     );
   }
 }

 class DataItem extends StatelessWidget {
   final String label;
   final String value;

   const DataItem({Key? key, required this.label, required this.value}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.symmetric(vertical: 4.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(label,
            style:  TextStyle(fontWeight: FontWeight.bold,  fontSize: 21),),
           Text(value , style:  TextStyle(fontWeight: FontWeight.w700,  fontSize: 18),),
         ],
       ),
     );
   }
 }

 Future<Map<String, dynamic>> fetchDataFromFirebase() async {
   try {
     final dio = Dio();
     final response = await dio.get('https://esp-spinal-default-rtdb.firebaseio.com/.json');
     // Replace 'https://esp-spinal-default-rtdb.firebaseio.com/.json' with your Firebase Realtime Database URL

     return response.data;
   } catch (e) {
     print('Error fetching data: $e');
     throw e; // Rethrow the error to be caught by FutureBuilder
   }
 }
