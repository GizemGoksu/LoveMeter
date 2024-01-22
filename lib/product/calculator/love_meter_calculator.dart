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
    String names = firstName.trim() + secondName.trim();
    List<String> letters = names.split("");
    while (letters.isNotEmpty) {
      int repeat = 0;
      String letter = letters.first;
      for (i = 0; i < letters.length; i++) {
        if (letters[i] == letter) {
          repeat++;
        }
      }
      repeatingTimes.add(repeat);
      letters.removeWhere((letterElement) => letterElement == letter);
    }
    return repeatingTimes;
  }

  List<int> additionFunction(List<int> numbers) {
    int i = 0;
    List<int> newNumbers = [];
    int length = numbers.length;
    int loopTime = (length / 2).round();
    for (i = 0; i < loopTime; i++) {
      int addition = 0;
      if (i != length - i - 1) {
        addition = numbers[i] + numbers[length - i - 1];
      } else {
        addition = numbers[i];
      }
      newNumbers.add(addition);
    }
    return newNumbers;
  }
}
