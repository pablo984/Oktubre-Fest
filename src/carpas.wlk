import cervezasYJarras.*
import personas.*

class Carpa {
	var property limiteDeGente //número
	var property tieneBandaMusical // booleano
	var property marcaSponsor //una marca de cerveza
	const property personasDentro = []
		
	method ingresarPersona(unaPersona) {
		if (unaPersona.puedeIngresarA(self)) {
		personasDentro.add(unaPersona)
	   }
	   else {
	   	console.println("Exception raised!")
	   }
	}
	method cantidadDePersonas() {
		return personasDentro.size()
	}
	method dejaIngresarA(unaPersona) {
		return not unaPersona.estaEbria() and self.cantidadDePersonas() < limiteDeGente
	}
	method venderUnaJarra(unaJarra, capacidad) {
		if (not personasDentro.isEmpty()) {
			unaJarra.litros(capacidad)
			unaJarra.marca(marcaSponsor)
			personasDentro.forEach({ per => per.comprarJarra(unaJarra) })
		}
		else {
			self.error("No hay gente para vender")
		}
	}
	method cantidadDeEbriosEmpedernidos() {
		return personasDentro.count({ per => per.esEbrioEmpedernido() })
	}
}

