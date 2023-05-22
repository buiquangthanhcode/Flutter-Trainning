import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';

part 'cubit_state.dart';
 // BÀI TẬP VỀ NHÀ TẠO ĐỒNG HỒ ĐẾM NGƯỢC TỪ 60 VỀ 0 KHI BẤM NÚT BẮT ĐẦU VÀ DỪNG KHI BẤM NÚT DỪNG 
 // Khi ấn dừng phải cancel timer và lưu lại giá trị khi ấn tạm dừng .
 // Đâu là bài tập về nhà của tuần 7 số 1

 // Bài 1.App tìm kiếm search như youtube
 // Bài 2. App đếm ngược
 // Toạạo resposity để gọi api

class HomeCubit extends Cubit<HomeSate> {
  HomeCubit() : super(HomeSate());

  void increment() {
    emit(state.copyWith(number: state.number + 1)); 
    // truyền dữ liệu liên tục sang cubit để báo cho flutter có sự thay đổi về giao diện 
  }
  void resetTime(){
    emit(state.copyWith(number: 60));
  }

  void descreseContinus() {
   state.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      emit(state.copyWith(number: state.number - 1));
    });
    // truyền dữ liệu liên tục sang cubit để báo cho flutter có sự thay đổi về giao diện 
  }

  void decrement() {
    emit(state.copyWith(number: state.number - 1));
  }

  // Truyền status để biết ssang đang ở trạng thái nào 4 trạng thái sử dụng enum trong thư mục utils
  // dùng chung sử dụng trong utils để dùng chung cho các màn hình khác nhau
}



