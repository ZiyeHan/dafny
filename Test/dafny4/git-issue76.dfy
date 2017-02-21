// RUN: %dafny  /compile:3 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method Main() {
  M0();
  M1();
  EqualityOfStrings0();
  EqualityOfStrings1();
}

// The verification of the following methods requires knowledge
// about the injectivity of sequence displays.

method M0()
{
  assert {"x","y","z"}-{"y"} == {"x","z"};
}

method M1()
{
  var n :| ("R",n) in {("R",2),("P",1)};
  assert n == 2;
  print n, "\n";
}

method EqualityOfStrings0() {
  assert "a" != "b";
}

method EqualityOfStrings1() {
  assert "a" + "b" == "ab";
}