let i = 0;

//primero evalua la condicion, luego ejecuta
while ( i < 3) {
   if(i % 2 == 0) {
       console.log('numero par' , i); //imprime
   }
    i++; //suma
}

//ejecuta, y luego evalua la condicion
do {
    if(i % 2 == 0) {
       console.log('numero par' , i); //imprime
   }
    i++; //suma
} while ( i < 3);