import Vikingos.*

class Expedicion {
	var objetivos = []
	var vikingos = []
	
	method agregarLugar(unLugar){
		objetivos.add(unLugar) 
	}
	
	method valeLaPena(){
		return objetivos.all{unLugar => unLugar.valeLaPena(vikingos)}
	}
	
	method meterALaExpedicion(unVikingo){
		unVikingo.puedeSubirseAExpedicion()
		vikingos.add(unVikingo)
	}
	
	method invadirObjetivos(){
		vikingos.forEach({vikingo => vikingo.recibirOro(self.gananciaPorVikingo(vikingos))})
		objetivos.forEach({unLugar => unLugar.serInvadido(vikingos)})
	}
	method gananciaPorVikingo(vikings){
		return objetivos.sum({unLugar => unLugar.botin(vikings)}).div(vikings.size())
	}
}

class Aldea {
	var crucifijos
	
	constructor(unosCrucifijos){crucifijos = unosCrucifijos}
	
	method valeLaPena(vikingos){
		return crucifijos > 14
	}
	method botin(vikingos){
		return crucifijos
	}
	method serInvadido(vikingos){
		crucifijos = 0
	}
}

class AldeaAmurallada inherits Aldea {
	var vikingosNecesarios
	constructor(unaCantidadDeCruci,unaCantidadDeVikingos) = super(unaCantidadDeCruci){
		vikingosNecesarios = unaCantidadDeVikingos
	}
	
	override method valeLaPena(vikingos){
		return super(vikingos) && vikingos.size() >= vikingosNecesarios
	}
}

class Capital {
	var defensores
	var factorDeRiqueza
	constructor(unaCantidadDeDefensores, unFactor){
		defensores = unaCantidadDeDefensores
		factorDeRiqueza = unFactor
	}
	
	method valeLaPena(vikingos){
		return self.botin(vikingos) + factorDeRiqueza >= vikingos.size() * 3
	}
	
	method botin(vikingos){
		if(vikingos.size() > defensores) return defensores
		else return vikingos.size()
	}
	
	method serInvadido(vikingos){
		defensores -= vikingos.size()
	}
	
}