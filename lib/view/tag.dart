import 'dart:math';

List<int> random_color = [
  0xffffdddd,
  0xffffe5dd,
  0xffffeedd,
  0xfffff6dd,
  0xffffffdd,
  0xfff6ffdd,
  0xffeeffdd,
  0xffe5ffdd,
  0xffddffdd,
  0xffddffe5,
  0xffddffee,
  0xffddfff6,
  0xffddffff,
  0xffddf6ff,
  0xffddeeff,
  0xffdde5ff,
  0xffddddff,
  0xffe5ddff,
  0xffeeddff,
  0xfff6ddff,
  0xffffddff,
  0xffffddf6,
  0xffffddee,
  0xffffdde5,
  0xffDDCEDD
];

int Rand_col() {
  var num = Random().nextInt(random_color.length);

  print(random_color[num]);

  return random_color[num];
}
