object rolando{
	var suMochila = mochila
	
	method artefactos(){
		return suMochila.map()
	}

	method puedeLlevar(artefacto){
		longitud suMochila < suMochila.tamaño()
	}

	method recolectar(artefacto){
	 	validarRecolectar(artefacto)
		suMochila.add(artefacto)
	}

	method validarRecolectar(artefacto){
		if(!puedeLlevar(artefacto)){
			self.error("capacidad llena")
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

object mochila{
	var artefactos = [collarDivino, libroDeHechizos]
	var tamaño = 2

	method cantidadArtefactos(){
		return longitud
	}

	method tamaño(){
		return tamaño		
	}

	method tamaño(_tamaño){
		tamaño = _tamaño
	}

	method esVacia(){
		return tamaño == 0
	}
}

//test
rolando.suMochila.esVacia()
rolando.recolectar(libroDeHechizos)
rolando.recolectar(espadaDelDestino)
rolando.recolectar(collarDivino) //deberia no poder hacerlo
rolando.artefactos()
