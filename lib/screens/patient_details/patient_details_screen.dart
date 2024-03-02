 import 'package:flutter/material.dart';
  import 'package:o3d/o3d.dart';
 import 'package:model_viewer_plus/model_viewer_plus.dart';

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
              onPressed: () =>
                  controller.cameraOrbit(20, 20, 5),
              icon: const Icon(Icons.change_circle)),

        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/2,
            child: O3D.network(
              src:'https://models.readyplayer.me/6512bdb81c810b0e7e6fc3c3.glb',
              controller: controller,
            ),
          ),
        ],
      ),
    ));
  }
}
