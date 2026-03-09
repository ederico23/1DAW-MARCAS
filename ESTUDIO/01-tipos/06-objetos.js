//personajes de tv
let nombre = "tanjiro";
let anime = "demon slayer";
let edad = 16;

let personaje = {
    //propiedad o llave-valor
    nombre: "tanjiro",
    anime: "demon slayer",
    edad: 16,
};

console.log(personaje);
console.log(personaje.nombre);
console.log(personaje['anime']);

personaje.edad = 13;
personaje['edad'] = 13;

delete personaje.anime;

console.log(personaje);

