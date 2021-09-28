import '../constants/enums.dart';

Difficulty intToDifficultyCoverter(int toCovert) {
  if (toCovert == 1) {
    return Difficulty.Doable;
  } else if (toCovert == 2) {
    return Difficulty.Hard;
  }

  return Difficulty.Easy;
}

int difficultyToIntConverter(Difficulty toConvert) {
  if (toConvert == Difficulty.Doable) {
    return 1;
  } else if (toConvert == Difficulty.Hard) {
    return 2;
  }

  return 0;
}
