let animales = ['gato', 'caballo']; //esto es un Array literal

//imprime el Array completo
console.log(animales);

//imprime el indice que indicas
console.log(animales[0]);

//añade elementos al Array
animales[2] = 'dragon';

console.log(animales);

//en consola saldrá que la longitud es de 11, pero tambien que hay 7 huecos vacios en el array
animales[10] = 'pez';

//undefined
console.log(animales[7]);

//sale como objetct
console.log(typeof animales);

console.log(animales.length);

