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
      isClass = (map.value as Map<String, dynamic>).containsKey('type');
    }

    var code = isClass ? 'class $name {' : '';

    if (isClass && map is Map<String, dynamic>) {
      for (var e in (map as Map<String, dynamic>).entries) {
        code += EntityGenerator(e).generate();
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

  EntityGenerator(this.map);

  String generate() {
    var name = map.key;

    if (map.value is Map<String, dynamic>) {
      _type = (map.value as Map<String, dynamic>)['type'] ?? '';
      _value = (map.value as Map<String, dynamic>)['value'] ?? '';
    }

    var code = _type == 'class' ? 'class $name {' : '';

    return code;
  }
}
