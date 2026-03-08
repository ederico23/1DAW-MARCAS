/**
 * programa que coja un array de objetos y devuelve un array de pares (array de arrays)
 */

let array = [ {
    id: 1,
    name: 'eder'
}, {
    id: 2,
    name: 'jorge',
}, {
    id: 3,
    name: 'juan',
} ];

let pares = [
    [1, {id: 1, name: 'eder'}],
    [2, {id: 2, name: 'jorge'}],
    [3, {id: 3, name: 'juan'}],
];

function aPares(arr){
    let pares = [];
    for (ind in arr) {
        let elemento = arr[ind];
        pares[ind] = [elemento.id, elemento];
    }
}


let resultado = aPares(array);
console.log(resultado);
