void main(List<String> args) {
  var number = int.parse(args[0]);

  if (number > 0) {
    print("OK $number");
  } else if (number < 0) {
    print("NOT OK $number");
  } else {
    print("0");
  }
}
