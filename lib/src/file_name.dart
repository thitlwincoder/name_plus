part of name_plus;

// File
extension FileName on File {
  // without sync
  Future<File> namePlus(String name, {String format = 'd', bool space = true}) {
    var result = _name(name, format, space);
    return File(join(path, result)).create();
  }

  // with sync
  void namePlusSync(String name, {String format = 'd', bool space = true}) {
    var result = _name(name, format, space);
    return File(join(path, result)).createSync();
  }

  String _name(String name, String format, bool space) {
    if (Platform.isWindows) {
      return _forWindows(name, format, space);
    } else {
      return _forOthers(name, format, space);
    }
  }

  String _forOthers(String name, String format, bool space) {
    // get all from directory path
    var list = Directory(path).listSync();

    // make name list
    var nameList =
        list.map((e) => e.absolute.path.split(separator).last).toList();

    // get file name
    var fileName = name.substring(0, name.lastIndexOf('.'));

    // get file type
    var fileType = name.substring(name.lastIndexOf('.'), name.length);

    // make val for loop
    var result = name;

    int i = 0;
    while (nameList.contains(result)) {
      i += 1;
      result = fileName +
          (space ? ' ' : '') +
          format.replaceAll('d', '$i') +
          fileType;
    }
    return result;
  }

  String _forWindows(String name, String format, bool space) {
    // get all from directory path
    var list = Directory(path).listSync();

    // make name list and it is case-insensitive for windows file systems
    // so nameList shoud be compared by lower-case
    var nameList = list
        .map((e) => e.absolute.path.split(separator).last.toLowerCase())
        .toList();

    // get file name
    var fileName = name.substring(0, name.lastIndexOf('.'));

    // get file type
    var fileType = name.substring(name.lastIndexOf('.'), name.length);

    // make val for loop
    var result = name;

    int i = 0;
    while (nameList.contains(result.toLowerCase())) {
      i += 1;
      result = fileName +
          (space ? ' ' : '') +
          format.replaceAll('d', '$i') +
          fileType;
    }
    return result;
  }
}
