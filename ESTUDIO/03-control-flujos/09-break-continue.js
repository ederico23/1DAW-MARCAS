let i = 0;

while (i < 6) {
    i++;
    if(i===2) {
        continue; //se salta todo lo de abajo y vuelve a arriba del bucle
    }

    if (i === 4){
        break; //detiene el bucle, SIRVE EN TODOS LOS BUCLES
    }
    console.log(i);
}