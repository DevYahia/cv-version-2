import 'dart:async';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:dev_yahia/routes.dart';
import 'package:flutter/material.dart';
import 'package:dev_yahia/ui/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';
import 'contact_us.dart';
import 'footer.dart';
import 'header.dart';
import 'icon.dart';
import 'my_projects.dart';
import 'other_projects.dart';
import 'statistics.dart';
import '../config/colors.dart';
import '../config/constants.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _headerGlobalKey = GlobalKey();
  final _aboutGlobaleKey = GlobalKey();
  final _statisticsGlobaleKey = GlobalKey();
  final _workingProcessGlobaleKye = GlobalKey();
  final _recentProjectsGlobaleKey = GlobalKey();
  final _recentOtherProjectsGlobaleKey = GlobalKey();
  final _contactUsGlobaleKey = GlobalKey();
  final _footerGlobalKey = GlobalKey();

  final _scrollController = ScrollController();

  final _fabStream = StreamController<bool>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _fabStream.sink.add(_scrollController.offset > 500);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                key: _headerGlobalKey,
                titleSpacing: 0,
                toolbarHeight: 100,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
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
                      color: AppColors.yellow,
                      child: Image.asset('images/yahia.jpg'),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Header(),
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
              ..._slivers(),
            ],
          ),
        ),
        floatingActionButton: _buildFab(),
      ),
      mobileScreen: Scaffold(
        backgroundColor: AppColors.containerColor,
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
                      color: AppColors.yellow,
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
                  // ListTile(
                  //   onTap: _scrollToWorkingProcess,
                  //   title: Text(
                  //     'Process',
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  // ),
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
                  Divider(),
                  //
                  // ListTile(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, Routes.filter);
                  //   },
                  //   title: Text(
                  //     'Palestine Filter',
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  // ),
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
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                key: _headerGlobalKey,
                titleSpacing: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
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
                          color: AppColors.yellow,
                          child: Image.asset('images/yahia.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),
                flexibleSpace: Container(
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
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(350),
                  child: Header(),
                ),
              ),
              ..._slivers(),
            ],
          ),
        ),
        floatingActionButton: _buildFab(),
      ),
    );
  }

  List<Widget> _slivers() => [
        // ABOUT
        SliverToBoxAdapter(
          key: _aboutGlobaleKey,
          child: About(),
        ),
        // STATS
        SliverToBoxAdapter(
          key: _statisticsGlobaleKey,
          child: Statistics(),
        ),
        // SliverToBoxAdapter(
        //   key: _workingProcessGlobaleKye,
        //   child: WorkingProcess(),
        // ),
        // APP PROJECTS
        SliverToBoxAdapter(
          key: _recentProjectsGlobaleKey,
          child: MyProjects(),
        ),
        // OTHER PROJECTS
        SliverToBoxAdapter(
          key: _recentOtherProjectsGlobaleKey,
          child: MyOtherProjects(),
        ),
        // CONTACT US
        // SliverToBoxAdapter(
        //   key: _contactUsGlobaleKey,
        //   child: ContactUs(),
        // ),
        // FOOTER
        SliverToBoxAdapter(
          key: _footerGlobalKey,
          child: Footer(),
        ),
      ];

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
            child: Icon(Icons.arrow_upward_rounded),
          ),
        );
      },
    );
  }

  void _scrollToHeader() {
    Scrollable.ensureVisible(
      _headerGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToAbout() {
    Scrollable.ensureVisible(
      _aboutGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToStatistics() {
    Scrollable.ensureVisible(
      _statisticsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToWorkingProcess() {
    Scrollable.ensureVisible(
      _workingProcessGlobaleKye.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToRecentProjects() {
    Scrollable.ensureVisible(
      _recentProjectsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToContactUs() {
    Scrollable.ensureVisible(
      _contactUsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToFooter() {
    Scrollable.ensureVisible(
      _footerGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _fabStream.close();
    super.dispose();
  }
}
