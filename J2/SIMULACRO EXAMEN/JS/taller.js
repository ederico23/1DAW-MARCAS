let contador = 0;
const btnAdd = document.getElementById("btn-add");

btnAdd.addEventListener("click", function () {

    const nombre = document.getElementById("nombre").value.trim();
    const edad = Number(document.getElementById("edad").value);
    const modalidad = document.getElementById("modalidad").value;

  if (nombre === "") {
    alert("El nombre no puede estar vacio");
    return;
}

if (edad === "") {
  alert("La edad no puede estar vacia");
  return;
}
 
if (isNaN(edad)) {
    alert("la edad tiene que ser un numero entero y positivo");
    return;
  }

  if (edad < 16) {
    alert("La edad tiene que ser mayor que 16");
    return;
  }


  if (modalidad === "") {
    alert("la modalidad no puede estar vacia");
    return;
  }

  const lista = document.getElementById("lista-inscritos");
  const fila = document.createElement("li");
  fila.textContent= nombre + " - " + edad + " años - " + modalidad;
  lista.appendChild(fila);
  contador++;

  actualizarContador();

  document.getElementById("nombre").value = "";
  document.getElementById("edad").value = "";
  document.getElementById("modalidad").value = "";
});


function actualizarContador(){
    document.getElementById("contador").textContent = "Total inscritos: " + contador
}

