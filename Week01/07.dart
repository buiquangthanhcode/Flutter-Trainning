
void main() {

 List<int> arr = [5, 2, 7, 3, 9, 8];




 arr.sort((a, b) => b.compareTo(a));

 List<int> value= arr.map((number) => number * 2).toList() ;


print(value);





}