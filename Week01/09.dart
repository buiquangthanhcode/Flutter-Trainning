
void main() {

  List<Map<String,String>>arr1 =[
    {'name' : 'thứ 2'},
    {'name' : 'thứ 3'},
    {'name' : 'thứ 4'},
    {'name' : 'thứ 5'},];
 
  List<String>cond = ["thứ 2","thứ 3"];
  
  arr1.removeWhere((item)=>!cond.contains(item["name"]));
  // List<Map<String,String>>value=arr1.removeWhere((item) => !cond.contains(item['name'])).toList();

  print(arr1);

}