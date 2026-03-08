/**
 * nombre: ancho x alto
 * 8k: 7680 x 4320
 * 4k: 3840 x 2160
 * wohd: 2560 x 1440
 * fhd: 1920 x 1080
 * hd: 1280 x 720
 */

let resolucion = '';

function nombreResolucion(ancho, alto){
    if (ancho > 7680 && alto > 4320){
        return '8k';
    } else if (ancho >= 3840 && alto >= 2160){
        return '4k';
    } else if (ancho >= 2560 && alto >= 1440){
        return 'wohd';
    } else if (ancho >= 1920 && alto >= 1080){
        return 'fhd';
    } else if (ancho >= 1280 && alto >= 720){
        return 'hd'
    } else {
        return false;
    }   

}

let nombre = nombreResolucion(3840, 2170);
console.log(nombre);
