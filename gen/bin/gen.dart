import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  var input = await File('jsons/a.json').readAsString();
  Map<String, dynamic> map = jsonDecode(input);
  print(map);

  // File('lib/jsons/a.json').openRead();
  // var filePath = p.join(Directory.current.path, 'aa.txt');
  // print(filePath);
  // final json = await readJsonFile(
  //     '/Users/davemac/projects/POC/design_tokens_chapter/lib/jsons/a.json');
  // print(json);
}

Future<List<Map<String, dynamic>>> readJsonFile(String filePath) async {
  var input = await File(filePath).readAsString();
  return jsonDecode(input);
}
