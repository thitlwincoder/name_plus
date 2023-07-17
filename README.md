# Name Plus

[![pub package](https://img.shields.io/pub/v/name_plus.svg?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/name_plus)
[![Last Commits](https://img.shields.io/github/last-commit/thitlwincoder/name_plus?logo=git&logoColor=white)](https://github.com/thitlwincoder/name_plus/commits/master)
[![GitHub repo size](https://img.shields.io/github/repo-size/thitlwincoder/name_plus)](https://github.com/thitlwincoder/name_plus)
[![License](https://img.shields.io/github/license/thitlwincoder/name_plus?logo=open-source-initiative&logoColor=green)](https://github.com/thitlwincoder/name_plus/blob/master/LICENSE)
<br>
[![Uploaded By](https://img.shields.io/badge/uploaded%20by-thitlwincoder-blue)](https://github.com/thitlwincoder)

Automatically increment `File` & `Directory` name and create.

## Usage

create `File` with extension

```dart
File('path').namePlus('filename');

File('path').namePlusSync('filename');
```

create `Directory` with extension

```dart
Directory('path').namePlus('filename');

Directory('path').namePlusSync('filename');
```

## Options 

When creating a `File` or  `Directory`, you can pass some options:
```dart
File('path').namePlus(
  'filename',
  format: '(d)', // change increment number format
  space: false, // space between name & number format
);
```

## Documentation

Check `test.txt` file name from `example` folder path and then name not exist create `test.txt` or name is already exist create with default format `test 1.txt`
```dart
File('example').namePlus('test.txt');
// test 1.txt
```
If you use `format` option, `d` is number place.

```dart
File('example').namePlus('test.txt', format: '(d)');
// test (2).txt

File('example').namePlus('test.txt', format: '{d}');
// test {3}.txt
```

## Contribution

Feel free to file an [issue](https://github.com/thitlwincoder/name_plus/issues/new) if you find a problem or make pull requests.

All contributions are welcome :)
