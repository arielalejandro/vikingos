class Rangos{
	var rangoSuperman
	constructor(rangoSuperior){
	rangoSuperman = rangoSuperior
	}
	
    method rangoSuperior(){
		return rangoSuperman
	}
}

object jarl inherits Rangos(karl){}

object karl inherits Rangos(thrall) {}

object thrall {
	method rangoSuperior(){
		return self
	}
}