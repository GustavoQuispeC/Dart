void main() async {
  print('Inicio de programa');
  
  try{
    
     final value = await httpGet('https://www.google.com');
    print(value);
    
  } catch(err){
    
    print('Tenemos un erro: $err');
  }
 
  
  print('Fin del programa');
}

Future<String> httpGet(String url) async{
  
  await Future.delayed(const Duration(seconds: 1));
  
  throw 'Error en la peticion';
  //return 'Tenemos un valor en la peticion';
  
}