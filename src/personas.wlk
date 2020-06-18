import cervezasYJarras.*
import carpas.*

class Persona { //SuperClase
	var property peso //número
	var property jarrasCompradas = [] //una coleccion de jarras
	var property leGustaLaMusicaTradicional //booleano
	var property nivelDeAguante //número
	
	method comprarJarra(unaJarra) {
		jarrasCompradas.add(unaJarra)
	}
	method comprarJarras(jarras) {
		jarrasCompradas.addAll(jarras)
	}
	/*Método adicional*/	
	method totalDeAlcoholIngerido() {
		return jarrasCompradas.sum({ jarra => jarra.contenidoDeAlcohol() })
	}
	method estaEbria() {
		return self.totalDeAlcoholIngerido() * peso > nivelDeAguante 
	}
	method leGusta(unaMarca) {
		return true		
	}
	method quiereEntrarA(unaCarpa) {
		return true
	}
}

class Belga inherits Persona{ //SubClase		
	override method leGusta(unaMarca) {
		return unaMarca.lupuloPorLitro() > 4
	}	
	override method quiereEntrarA(unaCarpa) {
		return self.leGusta(unaCarpa.marcaSponsor()) and leGustaLaMusicaTradicional == unaCarpa.tieneBandaMusical()
	}
}

class Checo inherits Persona { //SubClase
	override method leGusta(unaMarca) {
		return unaMarca.graduacionAlcoholica() > 8
	}
}

class Aleman inherits Persona { //SubClase
	
}
