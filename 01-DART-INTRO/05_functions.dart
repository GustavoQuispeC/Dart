void main(){
  print(greetEveryone());
  
  print('Suma: ${addTwoNumbers(10,20)}');
  
  print('Suma: ${add2Numbers(10,20)}');
  
  print(greetPerson(name: 'Gustavo', message: 'Hi'));
}

greetEveryone(){
  return 'Hello everyone!';
}

int addTwoNumbers(int a, int b){
  return  a+b;
}

//Funcion flecha
int add2Numbers(int a, int b) => a + b;

int add2NumbersOptional(int a, [int b = 0]) {
  //b = b ?? 0;
  //b ??= 0;
  return a + b;
}

String greetPerson({required String name, String message = 'Hola,'}){
  return '$message $name';
  
}