part of name_plus;

// Directory
extension DirectoryName on Directory {
  // without sync
  Future<Directory> namePlus(
    String name, {
    String format = 'd',
    bool space = true,
  }) {
    var result = _name(name, format, space);
    return Directory(join(path, result)).create();
  }

  // with sync
  void namePlusSync(
    String name, {
    String format = 'd',
    bool space = true,
  }) {
    var result = _name(name, format, space);
    return Directory(join(path, result)).createSync();
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
    var nameList = list.map((e) => e.absolute.path.split(separator).last).toList();

    // make val for loop
    var result = name;

    int i = 0;
    while (nameList.contains(result)) {
      i += 1;
      result = name + (space ? ' ' : '') + format.replaceAll('d', '$i');
    }
    return result;
  }

  String _forWindows(String name, String format, bool space) {
    // get all from directory path
    var list = Directory(path).listSync();

    // make name list and it is case-insensitive for windows file systems
    var nameList = list.map((e) => e.absolute.path.split(separator).last.toLowerCase()).toList();

    // make val for loop
    var result = name;

    int i = 0;
    while (nameList.contains(result.toLowerCase())) {
      i += 1;
      result = name + (space ? ' ' : '') + format.replaceAll('d', '$i');
    }
    return result;
  }
}
