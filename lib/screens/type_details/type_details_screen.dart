 import 'package:flutter/material.dart';

class TypeDetailsScreen extends StatelessWidget {
  const TypeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: false,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Flutter', style: TextStyle(color: Colors.red)),
                background: Image.asset(
                  'assets/images/4033.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 100,
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverHeaderDelegate(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 50.0,
                  color: Colors.blue,
                  child: Text(
                    'Flutter',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
              pinned: true,
            ),
          ] ,
      ),
    ));
  }
}


 class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
   _SliverHeaderDelegate({required this.child});

   final Widget child;

   @override
   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
     return child;
   }

   @override
   double get maxExtent => 50.0;

   @override
   double get minExtent => 50.0;

   @override
   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
     return false;
   }
 }