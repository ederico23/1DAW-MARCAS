/**
 * devolver num mayor y menor de un array
 */

let array = [2, 5, 6, 8, 100, -3, -67];

function mayorMenor(arr) {
    let menor = arr[0];
    let mayor = arr[0];
    
    for ( numero of arr) {
       menor = menor < numero ? menor : numero;
       mayor = mayor < numero ? mayor : numero;
    }

    return [mayor, menor];
}

let numero = mayorMenor(array);
console.log(numero);