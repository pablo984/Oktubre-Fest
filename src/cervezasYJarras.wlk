class Cerveza {
	var property lupuloPorLitro //un número
	var property paisDeOrigen //un país
	var property graduacionAlcoholica //porcentaje de alcohol en volúmen
	
	method alcoholPorLitro() {
		return graduacionAlcoholica / 100
	}
}

class CervezaRubia inherits Cerveza {
	
}

class CervezaNegra inherits Cerveza {
	method calcularGraduacion() {
		graduacionAlcoholica = graduacionCervezaNegra.graduacionReglamentaria().min(lupuloPorLitro * 2)
	}
}

/*Objeto auxiliar para la cerveza negra*/
object graduacionCervezaNegra {
	var property graduacionReglamentaria = 10
}

class CervezaRoja inherits CervezaNegra {
	override method calcularGraduacion() {
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