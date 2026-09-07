object rolando{
	const mochila = #{}
	var capacidadDeMochila = 2
	var hogar = castillo
	var encuentros = []

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
	
}

object libroDeHechizos{

}

object collarDivino{

}

object armaduraDeAceroValyrio{

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


