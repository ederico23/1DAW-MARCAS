let contador = 0;
const btnAdd = document.getElementById("btn-add");
const img = document.querySelectorAll(".galeria img");

//AL AÑADIR INSCRIPCION
btnAdd.addEventListener("click", function () {
  //CAPTURAR ELEMENTOS
  const nombre = document.getElementById("nombre").value.trim();
  const edad = Number(document.getElementById("edad").value);
  const modalidad = document.getElementById("modalidad").value;
  
  //VALIDAR DATOS
  if (nombre === "") {
    alert("Debes introducir un nombre");
    return;
  }

  if (edad === "") {
    alert("Debes introducir una edad");
    return;
  }

  if (isNaN(edad)) {
    alert("La edad tiene que ser un numero");
    return;
  }

  if (edad <= 16) {
    alert("La edad tiene que ser mayor que 16");
    return;
  }

  if (modalidad === "") {
    alert("Debes introducir una modalidad");
    return;
  }


  //AÑADIMOS PERSONA
  const fila = document.createElement("li");
  fila.textContent = nombre + " - " + edad + " años - " + modalidad;
  document.getElementById("lista-inscritos").appendChild(fila);
  contador++;

  actualizarContador();

  document.getElementById("nombre").value = ""
  document.getElementById("edad").value = "";
  document.getElementById("modalidad").value = "";
});



//INCREMENTAR CONTDOR
function actualizarContador() {
  document.getElementById("contador").textContent =
    "Total inscritos: " + contador;
}


//AL HACER CLICK EN limpiar LISTA COMPLETA

//VACIAR LISTA INSCRITOS
document.getElementById("btn-limpiar").addEventListener("click", function () {
  document.getElementById("lista-inscritos").innerHTML = "";
  //CONTADOR A 0
  contador = 0;
  actualizarContador();
  limpiarFormulario();
});

//INTERACTUAR IMAGENES
img.forEach(function (imgs) {
  imgs.addEventListener("mouseover", function () {
    imgs.style.transform = "scale(1.5)";
    imgs.style.border = "3px solid #000000";
  });

  imgs.addEventListener("mouseout", function () {
    imgs.style.transform = "";
    imgs.style.border = "none";
  });
});

//MODO OSCURO
let modoOscuro = false;

document.addEventListener("keydown", function (event) {
  if (event.key === "m" || event.key === "M") {
    if (modoOscuro === false) {
      document.body.style.backgroundColor = "black";
      document.body.style.color = "white";
      document.querySelectorAll("input, select").forEach(function (el) {
        el.style.color = "black";
      });
      modoOscuro = true;
    } else {
      document.body.style.backgroundColor = "";
      document.body.style.color = "";
      document.querySelectorAll("input, select").forEach(function (el) {
        el.style.color = "";
      });
      modoOscuro = false;
    }
  }
});