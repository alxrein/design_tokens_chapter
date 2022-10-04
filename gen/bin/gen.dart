import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  var input = await File('jsons/a.json').readAsString();
  Map<String, dynamic> map = jsonDecode(input);

  var code = 'import \'package:flutter/material.dart\';\n\n';

  for (var e in map.entries) {
    code += ClassGenerator(e).generate();
  }
  print(code);
}

class ClassGenerator {
  final MapEntry<String, dynamic> map;

  ClassGenerator(this.map);

  String generate() {
    var name = map.key;

    var isClass = false;
    if (map.value is Map<String, dynamic>) {
      isClass = !(map.value as Map<String, dynamic>).containsKey('type');
    }

    var code = isClass ? 'class $name {\n' : '';

    if (isClass) {
      if (map.value is Map<String, dynamic>) {
        for (var e in (map.value as Map<String, dynamic>).entries) {
          code += EntityGenerator(e).generate();
        }
      }
    } else {
      code += EntityGenerator(map).generate();
    }
    code += isClass ? '\n}\n\n' : '\n';

    return code;
  }
}

class EntityGenerator {
  final MapEntry<String, dynamic> map;
  var _type = '';
  var _value;
  var _name = '';

  EntityGenerator(this.map);

  String generate() {
    _name = map.key;

    if (map.value is Map<String, dynamic>) {
      _type = (map.value as Map<String, dynamic>)['type'] ?? '';
      _value = (map.value as Map<String, dynamic>)['value'] ?? '';
    }

    return _generator;
  }

  String get _generator {
    switch (_type) {
      case 'borderRadius':
        return _doubleGenerator;
      case 'fontSizes':
        return _doubleGenerator;
      case 'color':
        return _colorGenerator;
      default:
        return '';
    }
  }

  String get _doubleGenerator => 'const $_name = $_value.0;';
  String get _colorGenerator =>
      'const $_name = Color(0xff${(_value as String).substring(1)});';
}
