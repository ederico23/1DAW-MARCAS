/**
 * indice validar que no sea menor a 0 y que el elemento exista en el array
 */

function obtIndice(arr, ind) {
    if(ind < 0 || arr.length <= ind) {
        return 'elemento no existe';
    }
    return arr[ind];
}

let resultado = obtIndice([1,2], 4)
console.log(resultado);