 import 'package:flutter/material.dart';
  import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class TypeDetailsScreen extends StatelessWidget {
    TypeDetailsScreen({super.key, required this.title});
  final String title;
  final Uri _url = Uri.parse('https://flutter.dev');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: false,
              expandedHeight: 200.0,
              flexibleSpace: Stack(
                alignment: Alignment.topRight,
                children: [
                  FlexibleSpaceBar(

                    title:   Text(title, style:const TextStyle(color: Colors.red)),
                    background: Image.asset(
                      'assets/images/4033.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(onPressed: (){
                    _launchUrl();
                  },
                      icon: const Icon(Icons.link)),
                ],
              ),
            ),
 //
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReadMoreText(
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'*30,
                  trimLines: 20,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: const TextStyle(
                    fontSize: 16
                  ),
                  moreStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //         (BuildContext context, int index) {
            //       return ListTile(
            //         title: Text('description'),
            //       );
            //     },
            //     childCount: 50,
            //   ),
            // ),

          ] ,
      ),
    ));
  }
}

