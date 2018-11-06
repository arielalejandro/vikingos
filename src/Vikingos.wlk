/** First Wollok example */
import Castas.*
import ExpedicionesYLugares.*

class VikingoNoPuedeSubirExep inherits Exception{} 
class CantidadNegativaDeOro inherits Exception{}


class Vikingo {
	var oro
	
	method esProductivo()
	method ascenderEscala()
	
	method oro(){
		return oro
	}
	
	method recibirOro(cantidad){
		if(cantidad<0){throw new CantidadNegativaDeOro("cantidad de oro negativa")}
		oro += cantidad
	}
	
	method puedeSubirseAExpedicion(){
		if(!self.esProductivo()) {throw new VikingoNoPuedeSubirExep("NDEAAAH")}
		else return true
		}

	
	
}

class Soldado inherits Vikingo{
	var vidasTomadas
	var armas
	var casta
	
	constructor(oros,cantidadVidas, cantidadArmas, unaCasta){
		oro = oros
		vidasTomadas = cantidadVidas
		armas = cantidadArmas
		casta = unaCasta
	}
	
	override method esProductivo(){
		return vidasTomadas > 20 && armas > 0
	}
	
	override method ascenderEscala(){
		if(casta == jarl) {
			casta = casta.evoluconar()
			armas += 10
		}
		else casta = casta.evoluconar()
	
	}
	override method puedeSubirseAExpedicion(){
		if(casta == jarl && armas > 0) throw new VikingoNoPuedeSubirExep("Es un jarl con armas")
		else return super()
	}
	method castaSocial(){
		return casta
	}
}

class Granjero inherits Vikingo{
	var hectareas
	var hijos
	var casta
	constructor(oros,cantHectareas,cantHijos,unaCasta){
		oro = oros
		hectareas = cantHectareas
		hijos = cantHijos
		casta = unaCasta
	}
	
	override method esProductivo(){
		return hectareas / 2 >= hijos 
	}
	
	override method ascenderEscala(){
		if(casta == jarl){
			casta = casta.evoluconar()
			hijos += 2
			hectareas += 2
		}
		else casta = casta.evoluconar()
	}
	method castaSocial(){
		return casta
	}
}