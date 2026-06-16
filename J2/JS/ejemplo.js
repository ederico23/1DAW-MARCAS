//PARA PONER EL HTML AL FINAL DEL </BODY>
//<script src="ejemplo.js"></script>


//SELECCIONAR ELEMENTOS
//coger ids
document.getElementById("nombreId")

//coger selector css
document.querySelector("#nombre") //un elemento
document.querySelectorAll(".galeria img") //todos los q coincidan

//LEER VALORES DE FORMULARIO
//.value lo convierte en texto, Number() convierte a numero, .trim()borra espaciios
const nombre = document.getElementById("nombre").value.trim();
const edad = Number(document.getElementById("edad").value);
const modalidad = document.getElementById("modalidad").value;


//EVENTOS
//tipoEvento = "click", "mouseover", "mouseout", "keydown"
elemento.addEventListener("tipoEvento", function() {
    //lo q ocurre dentro
});

document.addEventListener("keydown", function(){
    console.log(evento.key)//que tecla fue
});


//VALIDACION
if(nombre === ""){
    alert("El nombre no puede estar vacio");
    return; //para la funcion
}

if(isNaN(edad) || edad <= 16){ //isNan devuelve TRUE si NO es un numero
    alert("la edad debe ser mayor que 16");
    return;
}

if(modalidad === ""){
    alert("La modalidad no puede estar vacia");
    return;
}


//CREAR ELEMENTOS Y AÑADIRLOS A LA TABLA
const fila = document.createElement("tr"); //creamos un tr (fila)

const celdaNombre = document.createElement("td") //creamos un td (celda)
celdaNombre.textContent = nombre; // metemos en la celda el valor del nombre que hemos extraido del formulario

const celdaEdad = document.createElement("td")//creamos un td(celda)
celdaEdad.textContent = edad; //metemos en la celda el valor de la edad que hemos extraido del formulario

fila.appendChild(celdaNombre)//montamos la fila en la tabla 
fila.appendChild(celdaEdad)

document.getElementById("cuerpo-tabla").appendChild(fila); //insertar en el tbody (NO EN LA TABLA)


//CREAR ELEMENTO Y AÑADIRLOS A LA LISTA
const li = document.createElement("li"); //cramos el li(elemento de lista)
li.textContent = nombre + " - " + edad + " años - " + modalidad; //damos contenido/valores
document.getElementById("lista-inscritos").appendChild(li);//insertamos en la lista (en el ul)


//BORRAR FILA CON BOTON
const celdaAccion = document.createElement("td");
const btnEliminar = document.createElement("button");
btnEliminar.textContent = "Eliminar";

celdaAccion.appendChild(btnEliminar)
fila.appendChild(celdaAccion);

btnEliminar.addEventListener("click", function(){
    fila.remove();
    //mas contenido q quieras
})


//LIMPIAR LISTA
document.getElementById("btn-limpiar").addEventListener("click", function(){
    document.getElementById("lista-inscritos").innerHTML = "" //innerHTML borra el contenido de la lista de golpe, envez d ir por elementos
    //mas contenido
})


//CONTADOR
let totalInscritos = 0;

function actualizarContador(){
    document.getElementById("contador").textContent = "Total inscritos " + totalInscritos;
}


//LIMPIAR FORMULARIO
nombre.textContent = "";
edad.textContent = "";
modalidad.textContent = "";


//EVENTOS DE RATON
const imagenes = document.querySelectorAll(".galeria img");

imagenes.forEach(function(img){
    img.addEventListener("mouseover", function(){
        img.style.transform = "scale(1.5)"
        img.style.border = "3px solid #333"
    });

    img.addEventListener("mouseout", function(){
        img.style.transform = "scale(1)"
        img.style.border = "none"
    })
})


//MODO OSCURO
let modoOscuro = false;

document.addEventListener("keydown", function(evento){
    if(evento.key === "m" || evento.key === "M"){
        document.body.style.backgroundColor = "black"
        document.body.style.color = "white"
        document.querySelectorAll("input, select").forEach(function(color){
            color.style.color = "white"
        })
        modoOscuro = true
    } else {
        document.body.style.backgroundColor = ""
        document.body.style.color = ""
        document.querySelectorAll("input, select").forEach(function(color){
            color.style.color = ""
        })
        modoOscuro = false
    }


})