import 'dart:async';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:dev_yahia/ui/programming_about.dart';
import 'package:flutter/material.dart';
import 'package:dev_yahia/ui/responsive_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';
import 'footer.dart';
import 'header.dart';
import 'my_projects.dart';
import 'other_projects.dart';
import '../config/colors.dart';
import '../config/constants.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _fabStream = StreamController<bool>();

  final _items = [
    Container(
      height: 500.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/cover.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black, Colors.black87, Colors.transparent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Header(),
            ],
          ),
        ),
      ),
    ),
    MyAbout(),
    ProgrammingAbout(),
    MyProjects(),
    MyOtherProjects(),
    Footer(),
  ];

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(() {
      _fabStream.sink.add(itemPositionsListener.itemPositions.value.last.index > 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          titleSpacing: 0,
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: Container(
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black87, Colors.transparent],
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .15,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Container(
                width: 40,
                height: 40,
                color: AppColors.customAccentColor,
                child: Image.asset('images/yahia.jpg'),
              ),
            ),
          ),
          actions: [
            Row(
              children: [
                MaterialButton(
                  onPressed: _scrollToAbout,
                  highlightColor: Colors.white60,
                  child: Text(
                    'About Me',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: _scrollToStatistics,
                  child: Text(
                    'Experience',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: _scrollToRecentProjects,
                  child: Text(
                    'Projects',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _scrollToFooter,
                  child: Text(
                    'Contact Me',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.width * .15),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ScrollablePositionedList.builder(
            itemCount: _items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => _items[index],
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
          ),
        ),
        floatingActionButton: _buildFab(),
      ),
      mobileScreen: Scaffold(
        backgroundColor: AppColors.containerColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          leading: Align(
            child: Builder(
              builder: (ctx) => InkWell(
                onTap: () {
                  Scaffold.of(ctx).openDrawer();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Container(
                    width: 40,
                    height: 40,
                    color: AppColors.customAccentColor,
                    child: Image.asset('images/yahia.jpg'),
                  ),
                ),
              ),
            ),
          ),
          titleSpacing: 0,
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black87, Colors.transparent],
              ),
            ),
          ),
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: AppColors.containerColor),
          child: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // PROFILE PICTURE
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: AppColors.customAccentColor,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset(
                        'images/yahia.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Divider(),
                  // ABOUT
                  ListTile(
                    onTap: () {
                      _scrollToAbout();
                      Navigator.pop(context);
                    },
                    title: Text(
                      'About Me',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Experience
                  ListTile(
                    onTap: () {
                      _scrollToStatistics();
                      Navigator.pop(context);
                    },
                    title: Text(
                      'Experience',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // PROJECTS
                  ListTile(
                    onTap: () {
                      _scrollToRecentProjects();
                      Navigator.pop(context);
                    },
                    title: Text(
                      'Projects',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  //
                  Divider(),
                  const SizedBox(height: 20),
                  // CONTACT
                  ListTile(
                    title: ElevatedButton(
                      onPressed: () {
                        _scrollToFooter();
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Contact Me',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // NETWORK
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          launch(AppConstants.github);
                        },
                        child: Icon(
                          CommunityMaterialIcons.github,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          launch(AppConstants.linkedin);
                        },
                        child: Icon(
                          CommunityMaterialIcons.linkedin,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          launch(AppConstants.twitter);
                        },
                        child: Icon(
                          CommunityMaterialIcons.twitter,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          launch(AppConstants.facebook);
                        },
                        child: Icon(
                          CommunityMaterialIcons.facebook,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ScrollablePositionedList.builder(
            itemCount: _items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => _items[index],
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
          ),
        ),
        floatingActionButton: _buildFab(),
      ),
    );
  }

  Widget _buildFab() {
    return StreamBuilder<bool>(
      stream: _fabStream.stream,
      builder: (_, data) {
        final bool showFab = data.hasData && data.data!;
        return AnimatedOpacity(
          opacity: showFab ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: FloatingActionButton(
            onPressed: showFab ? _scrollToHeader : null, // make sure user cannot click when button hidden
            mini: true,
            child: Icon(CommunityMaterialIcons.arrow_up_bold),
          ),
        );
      },
    );
  }

  void _scrollToHeader() {
    itemScrollController.scrollTo(index: 0, duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  void _scrollToAbout() {
    itemScrollController.scrollTo(index: 1, duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  void _scrollToStatistics() {
    itemScrollController.scrollTo(index: 2, duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  void _scrollToRecentProjects() {
    itemScrollController.scrollTo(index: 3, duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  void _scrollToFooter() {
    itemScrollController.scrollTo(index: 5, duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _fabStream.close();
    super.dispose();
  }
}
