/** First Wollok example */
import Castas.*
import ExpedicionesYLugares.*

class VikingoNoPuedeSubirExep inherits Exception{} 

class Vikingo {
	
	method esProductivo()
	
	method puedeSubirseAExpedicion(){
		
		try{
		if(!self.esProductivo()) throw new VikingoNoPuedeSubirExep("NDEAAAH")
		else return true
		}
		catch e : VikingoNoPuedeSubirExep{
			return "No es Productivo"
		}
		}
	
	method ascenderEscala()
}

class Soldado inherits Vikingo{
	var vidasTomadas
	var cantidadDeArmas
	var casta
	
	constructor(unaCantiDeVidas, unaCantidadDeArmas, unaCasta){
		vidasTomadas = unaCantiDeVidas
		cantidadDeArmas = unaCantidadDeArmas
		casta = unaCasta
	}
	
	override method esProductivo(){
		return vidasTomadas > 20 && cantidadDeArmas > 0
	}
	
	override method ascenderEscala(){
		if(casta == jarl) {
			casta = casta.evoluconar()
			cantidadDeArmas += 10
		}
		else casta = casta.evoluconar()
	
	}
	
	override method puedeSubirseAExpedicion(){
		if(casta == jarl && cantidadDeArmas > 0) throw new VikingoNoPuedeSubirExep("Es un jarl con armas")
		else return super()
	}
}

class Granjero inherits Vikingo{
	var hectareas
	var cantidadDeHijos
	
	constructor(unaCantidadDeHectareas,unaCantidadDeHijos){
		hectareas = unaCantidadDeHectareas
		cantidadDeHijos = unaCantidadDeHijos
	}
	
	override method esProductivo(){
		return hectareas / 2 >= cantidadDeHijos 
	}
	
	override method ascenderEscala(){
		cantidadDeHijos += 2
		hectareas += 2
	}
}