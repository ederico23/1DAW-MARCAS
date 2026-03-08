//short-circuit

//Falso
//false
//0
// **
//null
//undefined
//Nan

let nombre = 'eder';
let username = nombre || 'anonimo';

console.log(username);

function fn1() {
    console.log('soy funcion 1');
    return false;
}

function fn2() {
    console.log('soy funcion 2');
    return true;
}

let x = fn1() && fn2();