import 'dart:async';

void main() {
  final myStream = countStream(5); // Tạo một Stream

  final subscription = myStream.listen(
    (value) {
      print('Received event: $value'); // Xử lý sự kiện nhận được
    },
    onError: (error) {
      print('Error occurred: $error'); // Xử lý lỗi (nếu có)
    },
    onDone: () {
      print('Stream is done'); // Xử lý khi Stream kết thúc
    },
  );

  // Hủy đăng ký sau 3 giây
  Timer(Duration(seconds: 3), () {
    subscription.cancel();
    print('Unsubscribed from the stream');
  });
}

Stream<int> countStream(int num) async* {
  for (int i = 1; i <= num; i++) {
    yield i; // Trả về các số từ 1 đến num
    await Future.delayed(
        Duration(seconds: 1)); // Đợi 1 giây trước khi trả về số tiếp theo
  }
}


//