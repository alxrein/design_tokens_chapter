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

    var type = '';
    if (map.value is Map<String, dynamic>) {
      type = (map.value as Map<String, dynamic>)['type'] ?? 'class';
    }

    var code = type == 'class' ? 'class $name {' : '';
    code += type == 'class' ? '\n}\n\n' : '\n';

    return code;
  }
}
