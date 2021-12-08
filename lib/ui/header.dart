import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:dev_yahia/config/colors.dart';
import 'package:dev_yahia/providers/data_provider.dart';
import 'package:dev_yahia/services/firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:dev_yahia/ui/responsive_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  final String _name = "Yahia Salem";

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        // DESKTOP
        desktopScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _nameBuilder(40),
              const SizedBox(height: 35.0),
              ElevatedButton(
                onPressed: () async {
                  final message = await showDialog<String?>(
                    context: context,
                    builder: (context) {
                      String? message;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[900]!.withOpacity(.87),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // title
                                Text(
                                  "Instant Message",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                // subtitle
                                Text(
                                  "I'll make sure to read all messages",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                // space
                                const SizedBox(height: 20.0),
                                // message box
                                SizedBox(
                                  width: 300.0,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      onChanged: (val) => message = val,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[400]!),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // space
                                const SizedBox(height: 20.0),
                                // send button
                                ElevatedButton.icon(
                                  onPressed: () => Navigator.pop(context, message),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  label: Text('Send'),
                                  icon: Icon(CommunityMaterialIcons.flash),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                  Provider.of<DataProvider>(context, listen: false).sendMessage(message);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text("Send Me an Instant Message!"),
              ),
            ],
          ),
        ),
        // MOBILE
        mobileScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: SizedBox(
            height: 100.0,
            child: _nameBuilder(30),
          ),
        ),
      );

  Widget _nameBuilder(double fontSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              _name,
              textStyle: GoogleFonts.dmMono(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
              cursor: '_',
              speed: Duration(milliseconds: 375),
              curve: Curves.easeInOut,
            ),
            TypewriterAnimatedText(
              'print("Welcome");',
              textStyle: GoogleFonts.dmMono(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
              cursor: '_',
              speed: Duration(milliseconds: 375),
              curve: Curves.easeInOut,
            ),
          ],
          repeatForever: true,
          isRepeatingAnimation: true,
        ),
      ],
    );
  }
}
