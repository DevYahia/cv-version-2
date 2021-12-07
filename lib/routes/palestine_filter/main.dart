import 'dart:ui';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:dev_yahia/routes/palestine_filter/capture.dart';
import 'package:dev_yahia/routes/palestine_filter/constants.dart';
import 'package:dev_yahia/routes/palestine_filter/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'color_filter.dart';

class FilterPresets {
  final Color? color;
  final BlendMode? blendMode;

  FilterPresets(this.color, this.blendMode);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title = "Palestine Filter"}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? imgFile;
  double sliderValue = 0.0;

  final _captureKey = GlobalKey<CaptureWidgetState>();
  Future<CaptureResult>? _image;

  void _openImg() async {
    var res = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (res != null) {
      var imgPath = res.path;
      print(res.path);
      imgFile = imgPath;
      setState(() {});
    }
  }

  void _onCapturePressed() async {
    _image = _captureKey.currentState!.captureImage();
    var res = await _image;
    if (true) {
      FileSaver().saveAs(
        res!.data,
        "palestine_filter_${DateTime.now().millisecondsSinceEpoch}.jpg",
      );
      Fluttertoast.showToast(
        msg: 'Image saved',
        backgroundColor: Colors.white,
        textColor: Colors.black,
      );
      // ignore: dead_code
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to save',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  final filterPresets = <FilterPresets>[
    FilterPresets(null, null),
    FilterPresets(Colors.red.withAlpha(150), BlendMode.hardLight),
    FilterPresets(Colors.red, BlendMode.darken),
  ];

  int currentFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BG
          Positioned.fill(child: Container(color: Colors.pink[900])),
          // Positioned.fill(
          //   child: RotatedBox(
          //     quarterTurns: 1,
          //     child: Image.asset(
          //       "images/palestine_flag.jpg",
          //       fit: BoxFit.cover,
          //       color: Colors.black.withAlpha(100),
          //       colorBlendMode: BlendMode.hardLight,
          //     ),
          //   ),
          // ),
          // BODY
          Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 32.0),
                  // title
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  // subtitle
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add an image, then tap on the red circle to apply the red filter.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),
                    ),
                  ),
                  // space
                  Spacer(),
                  // image stuff
                  if (imgFile == null)
                    GestureDetector(
                      onTap: _openImg,
                      child: Container(
                        width: 220,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.grey[200]!.withAlpha(150),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image),
                            Text("Tap to add picture"),
                          ],
                        ),
                      ),
                    )
                  else
                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: CaptureWidget(
                          key: _captureKey,
                          capture: imageFilter(
                            hue: sliderValue,
                            child: Image.network(
                              imgFile!,
                              fit: BoxFit.cover,
                              color: filterPresets[currentFilter].color,
                              colorBlendMode: filterPresets[currentFilter].blendMode,
                            ),
                          ),
                          child: imageFilter(
                            hue: sliderValue,
                            child: Image.network(
                              imgFile!,
                              fit: BoxFit.cover,
                              color: filterPresets[currentFilter].color,
                              colorBlendMode: filterPresets[currentFilter].blendMode,
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (imgFile != null)
                        IconButton(
                          tooltip: "Clear",
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              imgFile = null;
                              currentFilter = 0;
                            });
                          },
                        ),
                      if (imgFile != null) ...[
                        IconButton(
                          tooltip: "Normal",
                          icon: Icon(Icons.circle, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              currentFilter = 0;
                            });
                          },
                        ),
                        IconButton(
                          tooltip: "Filter 1",
                          icon: Icon(Icons.circle, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              currentFilter = 1;
                            });
                          },
                        ),
                        IconButton(
                          tooltip: "Filter 2",
                          icon: Icon(Icons.circle, color: Colors.red[900]),
                          onPressed: () {
                            setState(() {
                              currentFilter = 2;
                            });
                          },
                        ),
                      ],
                    ],
                  ),
                  // space
                  Spacer(),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
          //
          Positioned(
            bottom: 100.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    tooltip: "twitter",
                    icon: Icon(CommunityMaterialIcons.twitter, color: Colors.white),
                    onPressed: () async {
                      final urlString = "https://www.twitter.com/DevYahia/";
                      if (await canLaunch(urlString)) {
                        launch(urlString);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    tooltip: "My Website",
                    icon: Icon(Icons.home_rounded, color: Colors.white),
                    onPressed: () async {
                      final urlString = "https://www.devyahia.com/";
                      if (await canLaunch(urlString)) {
                        launch(urlString);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: IconButton(
                    tooltip: "Share",
                    icon: Icon(Icons.share, color: Colors.white),
                    onPressed: () async {
                      Clipboard.setData(
                        ClipboardData(
                          text:
                              "apply Palestine Filter to your images through this app:\nios: $IOS_LINK\nandroid: $ANDROID_LINK",
                        ),
                      );
                      Fluttertoast.showToast(
                        msg: 'Copied to clipboard',
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                VerticalDivider(thickness: 10.0, color: Colors.white),
                CircleAvatar(
                  backgroundColor: Colors.cyan,
                  child: IconButton(
                    tooltip: "Download Android App",
                    icon: Icon(CommunityMaterialIcons.android, color: Colors.white),
                    onPressed: () async {
                      final urlString = ANDROID_LINK;
                      if (await canLaunch(urlString)) {
                        launch(urlString);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: imgFile == null
          ? null
          : FloatingActionButton.extended(
              onPressed: _onCapturePressed,
              tooltip: 'Save',
              label: Text('Save'),
              icon: Icon(Icons.save),
            ),
    );
  }

  Widget imageFilter({brightness = 0.0, saturation = 0.0, hue, child}) {
    return ColorFiltered(
        colorFilter: ColorFilter.matrix(ColorFilterGenerator.brightnessAdjustMatrix(
          value: brightness,
        )),
        child: ColorFiltered(
            colorFilter: ColorFilter.matrix(ColorFilterGenerator.saturationAdjustMatrix(
              value: saturation,
            )),
            child: ColorFiltered(
              colorFilter: ColorFilter.matrix(ColorFilterGenerator.hueAdjustMatrix(
                value: hue,
              )),
              child: child,
            )));
  }
}
