void main() async {
  print('Inicio de programa');

  try {
    final value = await httpGet('https://www.google.com');
    print('Exito: $value');
  } on Exception catch (err) {
    print('Tenemos una exception: $err');
  } catch (err) {
    print('OPPS!! algo ha pasado: $err');
  } finally {
    print('Fin del try y catch');
  }

  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));

  throw Exception('No hay parametros en la  URL');
  //return 'Tenemos un valor en la peticion';
}
