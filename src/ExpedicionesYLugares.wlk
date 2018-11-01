import Vikingos.*

class Expedicion {
	var lugaresAExpedicionar = []
	var participantes = []
	

	method agregarLugar(unLugar){
		lugaresAExpedicionar += [unLugar] 
	}
	
	method valeLapena(cantidadDeVikingos){
		lugaresAExpedicionar.all{unLugar => unLugar.valeLapena()}
	}
	
	method meterALaExpedicion(unVikingo){
		unVikingo.puedeSubirseAExpedicion()
		participantes += [unVikingo]
	}
}

class Aldea {
	var cantidadDeCrucifijos
	
	constructor(unaCantidadDeCruci){
		cantidadDeCrucifijos = unaCantidadDeCruci
	}
	
	method valeLaPena(cantidadDeVikingos){
		return cantidadDeCrucifijos > 14
	}
}

class AldeaAmurallada inherits Aldea {
	var vikingosNecesarios
	constructor(unaCantidadDeCruci,unaCantidadDeVikingos) = super(unaCantidadDeCruci){
		vikingosNecesarios = unaCantidadDeVikingos
	}
	
	override method valeLaPena(cantidadDeVikingos){
		return super(cantidadDeVikingos) && cantidadDeVikingos >= vikingosNecesarios
	}
}

class Capital {
	var defensoresIngleses
	var factorDeRiqueza
	constructor(unaCantidadDeDefensores, unFactor){
		defensoresIngleses = unaCantidadDeDefensores
		factorDeRiqueza = unFactor
	}
	
	method valeLaPena(cantidadDeVikingos){
		return self.botin(cantidadDeVikingos) + factorDeRiqueza >= cantidadDeVikingos * 3
	}
	
	method botin(cantidadDeVikingos){
		if(cantidadDeVikingos > defensoresIngleses) return defensoresIngleses
		else return cantidadDeVikingos
	}
}