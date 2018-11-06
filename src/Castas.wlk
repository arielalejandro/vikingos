class Rangos{
	var rango
	constructor(rangoSuperior){
	rango = rangoSuperior
	}
	
    method evoluconar(){
		return rango
	}
}

object jarl inherits Rangos(karl){}

object karl inherits Rangos(thrall) {}

object thrall {
	method evoluconar(){
		return self
	}
}