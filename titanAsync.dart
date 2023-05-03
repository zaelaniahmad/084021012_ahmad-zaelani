void main(List<String> args) async {
  var t = Titan(); // initialisasi t = object dari class titan

  print("trex");
  print("t.name");

  await t.getName();
  print(t.name);
  print("rener");
}

class Titan {
  String name = "Trex rex";
  Future<void> getName() async {
    await Future.delayed(Duration(seconds: 3));
    name = "grisha";
    print("get name [done]");
  }
}
