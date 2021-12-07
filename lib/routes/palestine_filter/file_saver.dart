import 'package:universal_html/html.dart' as html; //ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js; // ignore: avoid_web_libraries_in_flutter

class FileSaver {
  void saveAs(List<int> bytes, String fileName) => js.context.callMethod("saveAs", [
        html.Blob([bytes]),
        fileName
      ]);
}
