import cervezasYJarras.*
import carpas.*

/*SUPERCLASE*/
class Persona { 
	var property peso //número
	const property jarrasCompradas = [] //una coleccion de jarras
	var property leGustaLaMusicaTradicional //booleano
	var property nivelDeAguante //número
	var property nacionalidad // string
	
	method comprarJarra(unaJarra) {
		jarrasCompradas.add(unaJarra)
	}
	method comprarJarras(jarras) {
		jarrasCompradas.addAll(jarras)
	}
	/*Método adicional*/
	method comproJarrasDe1LitroOMas() {
		return jarrasCompradas.all({ jarra => jarra.litros() >= 1 })
	}
	/*Método adicional*/	
	method totalDeAlcoholIngerido() {
		return jarrasCompradas.sum({ jarra => jarra.contenidoDeAlcohol() })
	}
	method estaEbria() {
		return self.totalDeAlcoholIngerido() * peso > nivelDeAguante 
	}
	/*Método adicional*/
	method esEbrioEmpedernido() {
		return self.estaEbria() and self.comproJarrasDe1LitroOMas()
	}
	method leGusta(unaMarca) {
		return true		
	}
	method quiereIngresarA(unaCarpa) {
		return self.leGusta(unaCarpa.marcaSponsor()) and leGustaLaMusicaTradicional == unaCarpa.tieneBandaMusical()
	}
	method puedeIngresarA(unaCarpa) {
		return self.quiereIngresarA(unaCarpa) and unaCarpa.dejaIngresarA(self)
	}
	method ingresarA(unaCarpa) {		
		if (self.puedeIngresarA(unaCarpa)) {
			unaCarpa.ingresarPersona(self)			
		}
		else {
			self.error("Acceso Denegado")
		}		
	}
	method esPatriota() {
		return jarrasCompradas.all({ jarra => jarra.marca().paisDeOrigen() == self.nacionalidad() })
	}
	
}

/*SUBCLASE*/
class Belga inherits Persona{ 		
	override method leGusta(unaMarca) {
		return unaMarca.lupuloPorLitro() > 4
	}	
}

/*SUBCLASE*/
class Checo inherits Persona { 
	override method leGusta(unaMarca) {
		return unaMarca.graduacionAlcoholica() > 8
	}
}
/*SUBCLASE*/
class Aleman inherits Persona {
	override method quiereIngresarA(unaCarpa) {
		return super(unaCarpa) and unaCarpa.cantidadDePersonas().even()
	}
}
