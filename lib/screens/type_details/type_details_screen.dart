 import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
  import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/custom_Loading.dart';

class TypeDetailsScreen extends StatelessWidget {
    TypeDetailsScreen({super.key, required this.title, required this.url, required this.image, required this.des, required this.id});
  final String title;
  final String url;
  final String image;
  final String des;
  final String id;


  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse("$url");
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }
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
                    background:  CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                      const CustomLoading(),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ),
                  IconButton(
                      onPressed: (){
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
                  des*30,
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


          ] ,
      ),
    ));
  }
}

