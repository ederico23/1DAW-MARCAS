let accion = 'listar';

switch(accion){
    case 'listar':
        console.log('accion de listar');
        break; //SIEMPRE
    case 'guardar':
        console.log('accion de guardar');
        break;
    default: 
        console.log('accion no reconocida');
}
//tambien se pueden hacer con ifs pero es mas largo.