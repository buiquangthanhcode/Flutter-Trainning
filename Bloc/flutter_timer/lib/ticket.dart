class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
} 

// Nếu ticks là 5 và x đang là 0, thì giá trị mới sẽ là 5 - 0 - 1 = 4.
// Sau đó, khi x là 1, giá trị mới sẽ là 5 - 1 - 1 = 3.
// Tiếp tục cho đến khi x là 4, giá trị mới sẽ là 5 - 4 - 1 = 0.
