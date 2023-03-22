
 

void main() {
List<int> arr = [5, 2, 2, 7, 3, 9, 8 , 2 , 12 , 82 , 10];



 
 var index = arr.lastIndexWhere((item)=>(item==2));
arr[index]=5;


 print(arr);

}