class LoveMeterCalculator {

  int calculatePercentage(String firstName, String secondName) {
    List<int> numbers = calculateLetterRepeating(firstName, secondName);
    while (numbers.length > 2) {
      numbers = additionFunction(numbers);
    }
    int result = numbers[0] * 10 + numbers[1];
    return result;
  }

  List<int> calculateLetterRepeating(String firstName, String secondName) {
    int i = 0;
    List<int> repeatingTimes = [];
    String names = firstName + secondName;
    List<String> letters = names.split("");
    int letterNumber = letters.length;
    while (letterNumber > 0) {
      int repeat = 0;
      String letter = letters.first;
      for (i = 0; i < letterNumber; i++) {
        if (letters[i] == letter) {
          repeat++;
        }
      }
      repeatingTimes.add(repeat);
      letters.removeWhere((letterItem) => letterItem == letter);
      letterNumber = letters.length;
    }
    return repeatingTimes;
  }

  List<int> additionFunction(List<int> numbers) {
    int i = 0;
    List<int> newNumbers = [];
    int length = numbers.length;
    int loopTime = (length % 2 == 1
        ? (numbers.length + 1) / 2
        : numbers.length / 2) as int;
    for (i = 0; i < loopTime; i++) {
      int addition = 0;
      if (i == length - i - 1) {
        addition = numbers[i];
      } else {
        addition = numbers[i] + numbers[length - i - 1];
      }
      newNumbers.add(addition);
    }
    return newNumbers;
  }
}
