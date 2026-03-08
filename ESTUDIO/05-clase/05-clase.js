let teoria = Number(prompt('dime tu nota de la teoria'));
let practico = Number(prompt('dime tu nota de lo practico'));

teoria = teoria * 0.7;
practico = practico * 0.3;

document.writeln(
    'estas aprobado? ' + ((teoria+practico)>=5) + '<br>' +
    'esta es tu nota media: ' + (teoria+practico)
);

