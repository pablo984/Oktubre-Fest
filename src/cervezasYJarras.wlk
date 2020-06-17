class CervezaRubia {
	var property lupuloPorLitro //un número
	var property paisDeOrigen //un país
	var property graduacionAlcoholica //un porcentaje
	
	method alcoholPorLitro() {
		return graduacionAlcoholica / 100
	}

}

class CervezaNegra inherits CervezaRubia {
	method calculoGraduacion() {
		return (graduacionAlcoholica - lupuloPorLitro * 2).abs()
	}
	override method alcoholPorLitro() {
		return self.calculoGraduacion() / 100
	}

}

class CervezaRoja inherits CervezaNegra {
	override method alcoholPorLitro() {
		return super() * 1.25
	}
}

class Jarra {
	var property litros
	var property marca 
	
	method contenidoDeAlcohol() {
		return marca.alcoholPorLitro() * litros 
	}
}