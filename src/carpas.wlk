import cervezasYJarras.*
import personas.*

class Carpa {
	var property limiteDeGente //número
	var property tieneBandaMusical // booleano
	var property marcaSponsor //una marca de cerveza
	const property personasDentro = []
		
	method ingresarPersona(unaPersona) {
		personasDentro.add(unaPersona)
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
			console.println("No hay gente adentro para vender una jarra")
		}
	}
	method cantidadDeEbriosEmpedernidos() {
		return personasDentro.count({ per => per.esEbrioEmpedernido() })
	}
}

