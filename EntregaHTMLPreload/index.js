
var canvas; 
var ctx;
var pelota;
var desplazamientoPelota = 10;
var imgFondo,
    imgCargadas = 0;
var coordX = 100,
    coordY = 100,
    radio = 30;
var vidas = 4;
var vidasPerdidas = 0;  
var borde = 50; 
var correccion = 30; 
    


class Pelota {
        constructor (x, y, radio) {
            this.x = x;
            this.y = y;
            this.radio = radio;
            this.rastro = [];
        }
    
        pintar() {
            ctx.strokeStyle = "#000000";
            ctx.beginPath();
            ctx.arc(pelota.x, pelota.y, pelota.radio, 0, 2 * Math.PI);
            ctx.stroke();
            for (var i = 0; i < this.rastro.length; i++) {
                ctx.strokeStyle = "#FF0000";
                ctx.beginPath();
                ctx.arc(this.rastro[i].x, this.rastro[i].y, this.rastro[i].radio, 0, 2 * Math.PI);
                ctx.stroke();
            }
        }

        limpiar () {
           // ctx.fillStyle = "#FFFFFF";
           // ctx.fillRect(0, 0, canvas.width, canvas.height);
            paintEscena();
        }

        agregarPelotaActualARastro () {
            this.rastro.push(new Pelota(this.x, this.y, this.radio, false));
            while (this.rastro.length > 100) {
                this.rastro.shift();
            }
        }

        moverDerecha () {
            this.limpiar();
            this.agregarPelotaActualARastro();
            this.x += desplazamientoPelota;
            this.pintar();
            if(this.x > canvas.width - borde - radio - correccion){
                this.x = canvas.width - radio - borde - correccion/2;
            }
        }
        moverIzquierda () {
            this.limpiar();
            this.agregarPelotaActualARastro();
            this.x -= desplazamientoPelota;
            this.pintar();
            if(this.x < borde + radio + correccion){
                this.x = radio + borde + correccion/2;
            }
        }
        moverArriba () {
            this.limpiar();
            this.agregarPelotaActualARastro();
            this.y -= desplazamientoPelota;
            this.pintar();
            if(this.y < borde + radio + correccion){
                this.y = radio + borde + correccion/2;
            }
        }
        moverAbajo () {
            this.limpiar();
            this.agregarPelotaActualARastro();
            this.y += desplazamientoPelota;
            this.pintar();
            if(this.y > canvas.height - borde - radio - correccion){
                this.y = canvas.height - radio - borde - correccion/2;
            }
        }
    }
    

function init() {
    pelota = new Pelota(coordX, coordY, radio);
    preloadImagenes();

    canvas = document.getElementById('myCanvas');
    ctx = canvas.getContext("2d");
  /*  console.log(pelota); */

   

    document.addEventListener("keydown", function(e){
        if(e.keyCode == "39"){
            pelota.moverDerecha();
        }
        if(e.keyCode == "37"){
            pelota.moverIzquierda();
        }
        if(e.keyCode == "38"){
            pelota.moverArriba();
        }
        if(e.keyCode == "40"){
            pelota.moverAbajo();
        }
    
    });

}

function reFresh(){
  //  pelota.rastro = [];
    pelota = new Pelota(coordX, coordY, radio);
    paintEscena();

}

function preloadImagenes(){
    imgFondo = new Image();
    imgFondo.width = this.canvas;
    imgFondo.height = this.canvas;
    imgFondo.src = 'imagenes/hojita.jpg';
    imgFondo.addEventListener('load', function(){
        imgCargadas++;
        paintEscena();

    }, false);
}


function paintEscena(){
    if (imgCargadas == 1){
        paintFondo();
        pelota.pintar();
        pintarMarco();
    }
}

function paintFondo(){
    ctx.drawImage(imgFondo, 0, 0);
}

function pintarMarco(){
    // color del marco
    ctx.fillStyle = "#96cf08";
    // Marco superior
    ctx.fillRect(0, 0, canvas.width, borde);
    // Marco izquierdo
    ctx.fillRect(0, 0, borde, canvas.height);
    // Marco derecho
    ctx.fillRect(canvas.width - borde, 0, borde, canvas.height);
    // Marco inferior
    ctx.fillRect(0, canvas.height - borde, canvas.width, borde);
    // pongo el contador de vidas
    sacarVidas();
}

function sacarVidas(){
    if (vidasPerdidas >= 0){
        var xV = 20;
        var yV = 20;
        ctx.font = "20px Verdana";
        ctx.fillStyle = "#cfa708";
        ctx.fillText("VIDAS: ", xV, yV);
        for(var i = 0; i< vidas; i++){
            ctx.fillText("vidas - i", xV + borde/2, yV +  borde/2);
            
        }
    }
}


/*


document.addEventListener("keydown", function(e){
    if(e.keyCode == "39"){
        moverDerecha();
    }
    if(e.keyCode == "37"){
        moverIzquierda();
    }
    if(e.keyCode == "38"){
        moverArriba();
    }
    if(e.keyCode == "40"){
        moverAbajo();
    }

});

function moverDerecha(){
    margenIzquierdo += velocidad;
    pelota.style.margenIzquierdo = margenIzquierdo + "px";
}

function moverIzquierda(){
    margenIzquierdo -= velocidad;
    pelota.style.margenIzquierdo = margenIzquierdo + "px";
}

function moverArriba(){
    margenAltura -= velocidad;
    pelota.style.margenAltura = margenAltura + "px";
}

function moverAbajo(){
    margenAltura += velocidad;
    pelota.style.margenAltura = margenAltura + "px";
}
*/