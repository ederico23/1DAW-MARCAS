let user = {
    id: 1,
    name: 'eder',
    age: 25,
};

//imprime las propiedades, NO los valores
for (let prop in user) {
    console.log(prop);
}

//imprime VALORES
for (let prop in user) {
    console.log(prop, user[prop]);
}

//esto no es muy comun
let animales = ['gato' , ' perro ', ' dragon'];
for (let indice in animales){
    console.log(indice, animales[indice]);
}