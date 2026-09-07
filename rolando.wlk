object rolando{
	const mochila = #{}
	var capacidadDeMochila = 2
	var hogar = castillo
	var encuentros = []
	var poderBase = 5
	var poderPelea = 0

	method batallar(){
		poderBase += 1
		poderPelea = poderBase + self.poderArtefactos()
//sigo por aca 
		
	}

	method poderArtefactos(){
		return mochila.sum{artefacto => artefacto.poder(self)}
	}

	method poderBase(_poderBase){
		poderBase = _poderBase
	}

	method poderBase(){
		return poderBase
	}

	method poderDePelea(){
		return poderPelea
	}	

	//punto 4

	method historialDeEncuentros(){
		return encuentros
	}

	//punto 3
 	method posesiones() {
		return mochila + hogar.artefactos()
 	}

	

	method poseeArtefacto(artefacto){
		self.posesiones().contains(artefacto)
	}

	//punto 2

	method dejarArtefactos(){
			hogar.dejarArtefactos(self)
			mochila.clear()
	}


	

	method llegarAlCastillo(){
		hogar = castillo
	}

	method artefactos(){
		return mochila
	}

	method capacidadDeMochila(_capacidadDeMochila){
		capacidadDeMochila = _capacidadDeMochila
	}

	method mochila(){
		return mochila
	}

	method puedeLlevar(artefacto){
		return mochila.size() < capacidadDeMochila
	}

	method encontrar(artefacto){
		encuentros.add(artefacto)
		if(mochila.size() < capacidadDeMochila){
			mochila.add(artefacto)
		}
	}
}	

object espadaDelDestino{
	var usos = 0
	method poder(personaje){
		if(usos == 0){
			return personaje.poderBase()
		}else{
			personaje.poderBase() / 2
		}
	}
}

object libroDeHechizos{
	
}

object collarDivino{
	var aparicionesEnBatalla = 0

	method aparicionesEnBatalla(){
		return aparicionesEnBatalla
	}

	method poder(personaje){
		if(personaje.poderBase() > 6){
			return 3 + self.aparicionesEnBatalla()
		}else{
			return 3
		}
	}
}

object armaduraDeAceroValyrio{
	method poder(personaje){
		return 6
	}
}



/*
test
rolando.suMochila.esVacia()
rolando.recolectar(libroDeHechizos)
rolando.recolectar(espadaDelDestino)
rolando.recolectar(collarDivino) //deberia no poder hacerlo
rolando.artefactos()
*/

object castillo{
	const artefactos = #{}

	method artefactos(){
		return artefactos
	}

	method dejarArtefactos(personaje){
		artefactos + personaje.mochila()
	}

}





