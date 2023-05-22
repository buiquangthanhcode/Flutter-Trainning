part of 'cubit_cubit.dart';

//Noi ma giup chúng ta tạo những biến quản lý trạng thái của Cubit
class HomeSate {
  Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {});
  int number;
  int status;
  HomeSate({
    this.number = 60,
    this.status = 0,
  });

// tao ra 1 đối tượng mới  để so sánh với cái cũ , cũ với mới rất nhiều trường hợp
  HomeSate copyWith({
    int? number,
  }) {
    return HomeSate(
      number: number ?? this.number,
    );
  }
}
