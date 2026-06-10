const btnAdd = document.getElementById('btn-add'); //cogemos el btn añadir
btnAdd.addEventListener('click', addInscription);//asignamos un eventlistener

let totalInscritos = 0; // variable para llevar la cuenta

function addInscription() {
    const nombreIp = document.getElementById('nombre').value.trim(); //guardamos el nombre
    const edadIp = Number(document.getElementById('edad').value);//guardamos la edad
    const modalidadIp = document.getElementById('modalidad').value;//guardamos la mdaldiad

    // Validamos
    if (nombreIp === '' || isNaN(edadIp) || edadIp <= 16) {
        alert('Por favor, ingresa un nombre válido y una edad mayor de 16.');
        return;
    }

    const cuerpo = document.querySelector('#cuerpo-tabla'); //tabla
    
    const fila = document.createElement('tr');//creamos una fila

    // Celda número
    const celdaNum = document.createElement('td');
    celdaNum.textContent = totalInscritos + 1;

    const celdaNombre = document.createElement('td');
    celdaNombre.textContent = nombreIp;

    const celdaEdad = document.createElement('td');
    celdaEdad.textContent = edadIp;

    const celdaModalidad = document.createElement('td');
    celdaModalidad.textContent = modalidadIp;

    // Botón eliminar dentro de la fila
    const celdaAccion = document.createElement('td');
    const btnEliminar = document.createElement('button');
    btnEliminar.textContent = 'Eliminar';

    btnEliminar.addEventListener('click', function() {
        fila.remove();                          // elimina esta fila
        totalInscritos--;                       // resta al contador
        actualizarContador();
    });

    celdaAccion.appendChild(btnEliminar);

    // Montar la fila
    fila.appendChild(celdaNum);
    fila.appendChild(celdaNombre);
    fila.appendChild(celdaEdad);
    fila.appendChild(celdaModalidad);
    fila.appendChild(celdaAccion);

    cuerpo.appendChild(fila);

    // Actualizar contador
    totalInscritos++;
    actualizarContador();

    // Limpiar formulario
    document.getElementById('nombre').value = '';
    document.getElementById('edad').value = '';
    document.getElementById('modalidad').value = '';
}

function actualizarContador() {
    document.getElementById('contador').textContent = 'Total inscritos: ' + totalInscritos;
}


const imgs = document.querySelectorAll('.galeria img');
imgs.forEach(img => {
    img.addEventListener('mouseover', function() {
        this.style.transform = 'scale(1.5)';
        this.style.border = '2px solid #333';
    });
    img.addEventListener('mouseout', function() {
        this.style.transform = 'scale(1)';
        this.style.border = 'none';
    });
});

let modoOscuro = false;

document.addEventListener('keydown', function(event) {
    if (event.key === 'm' || event.key === 'M') {
        if(modoOscuro === false){
            document.body.style.backgroundColor = '#050000';
            document.body.style.color = '#ffffff';
            modoOscuro = true;        
        } else {
            document.body.style.backgroundColor = '';
            document.body.style.color = '';
            modoOscuro = false;
        }
}
});