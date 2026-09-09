object erethia{
	const enemigos = #{caterina, archibaldo, astra}

	method enemigos(){
		return enemigos
	}


	method enemigosVencibles(personaje){
		return enemigos.filter({enemigo => personaje.puedeVencer(enemigo)})
	}

	method moradasConquistables(personaje){
		return self.enemigosVencibles(personaje).map({enemigo => enemigo.morada()})
	}

	method esPoderoso(personaje) {
		return personaje.enemigos().all({enemigo => personaje.puedeVencer(enemigo)})
	}
}

object rolando{
	const mochila = #{}
	var capacidadDeMochila = 2
	var hogar = castillo
	var encuentros = []
	var poderBase = 5

method puedeVencer(enemigo){
	return enemigo.poderDePelea() < self.poderDePelea()
}

	method batallar(){
		poderBase += 1
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
		return poderBase + self.poderArtefactos()
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

object caterina{

	method poderDePelea(){
		return 28
	}

	method morada(){
		return fortalezaDeAcero
	}

}

object archibaldo{
	
	method poderDePelea(){
		return 16
	}

	method morada(){
		return palacioDeMarmol
	}
} 

object astra{ 

	method poderDePelea(){
		return 14
	}

	method morada(){
		return torreDeMarfil
	}
}

object torreDeMarfil{}

object fortalezaDeAcero{}

object palacioDeMarmol{}
