/**
 * devolver los numeros positivos
 */

let array = [2, 5, 6, 8, 100, -3, -67];

function contarPositivos(arr) {
  let cantidad = 0;

  for(elemento of arr) {
    if (elemetno > arr){
        cantidad++;
    }
  }
  return cantidad;
}

let resultado = contarPositivos(array);
console.log(resultado);