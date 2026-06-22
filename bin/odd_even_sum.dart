void main() {
  // List of numbers we want to analyze
  List<int> numbers = [55, 64, 95, 78, 45, 22, 12, 90, 178, 60, 2, 84];

  // This will store how many odd numbers exist in the list
  int oddCount = 0;

  // Loop through each number in the list
  for (int num in numbers) {
    // Check if the number is odd
    if (num % 2 != 0) {
      oddCount += 1; // count it
    }
  }

  // If oddCount is even → sum is even
  // If oddCount is odd → sum is odd
  if (oddCount % 2 == 0) {
    print("Total sum is even");
  } else {
    print("Total sum is odd");
  }
}