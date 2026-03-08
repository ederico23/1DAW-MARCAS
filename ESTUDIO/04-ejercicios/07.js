/**
 * calculadora de impuestos
 */

function precioImpuestos(precio, impuestos) {
    return precio *= impuestos;
}

let resultado = precioImpuestos(100, 0.15);
console.log(resultado);