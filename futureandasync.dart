Future delayedPrint(int seconds, String message) {
  final duration = Duration(seconds: seconds);
}

void main(List<String> args) {
  print("roger");
  delayedPrint(2, "pirates").then ((status)) {
    print(status);
  });
  print("is");

  }
