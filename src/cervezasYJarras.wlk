class CervezaRubia {
	var property lupuloPorLitro //un número
	var property paisDeOrigen //un país
	var property graduacionAlcoholica //porcentaje de alcohol en volúmen
	
	method alcoholPorLitro() {
		return graduacionAlcoholica / 100
	}

}

class CervezaNegra inherits CervezaRubia {
	override method graduacionAlcoholica() {
		graduacionAlcoholica = graduacionCervezaNegra.graduacionReglamentaria() - lupuloPorLitro * 2
	}
}

/*Objeto auxiliar para la cerveza negra*/
object graduacionCervezaNegra {
	var property graduacionReglamentaria = 10
}

class CervezaRoja inherits CervezaNegra {
	override method graduacionAlcoholica() {
		super()
		graduacionAlcoholica = graduacionAlcoholica * 1.25
	}
}

class Jarra {
	var property litros
	var property marca 
	
	method contenidoDeAlcohol() {
		return marca.alcoholPorLitro() * litros 
	}
}