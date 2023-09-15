object registroAbatidosCOD {  // en los metodos se nombra como "reg"
	const registro = []
	
	method agregarAbatidoDia( cantidad , dia ) {
		if (self.yaEstaElDia(dia)){
			self.error("ya existe ese dia")
		}
		registro.add( [ cantidad , dia ] )
	}
	method agregarAbatidosVariosDias(registroDeAbatidos){
		registroDeAbatidos.forEach { e => self.agregarAbatidoDia(e.get(0),e.get(1) )}
	}
	method dia(reg) = reg.get(1) //indica que es el 2do elemento del par (cantidad,2do dia) (0,1,...)
	method cantidad(reg) = reg.first() //indica que es el 2do elemento del par (cantidad,2do dia) o usar .get(0)
											
	
	method yaEstaElDia(dia) = registro.any( { reg => self.dia(reg) == dia } )
	method registroDia(dia) = registro.Find ( { reg => self.dia(reg) == dia } )
	
	method eliminarRegistrioDelDia(dia) {
		if ( !self.yaEstaElDia(dia)){
			self.error("el Dia no esta en la lista")
		}
		registro.remove(self.registroDia(dia))
	}
	method eliminarVariosRegistrosDeDiasConAll(listaDeDias) {
		if (!listaDeDias.all{ e => self.yaEstaElDia(e)}) {
			self.error("Algun dia del registro no esta en la lista")
		}
		listaDeDias.forEach{ e =>self.eliminarRegistrioDelDia(e)}
	}
	method eliminarVariosRegistrosDeDiasConAny(listaDeDias) {
		if (listaDeDias.any{ e  => !self.yaEstaElDia(e)}) {
			self.error("Algun dia del registro no esta en la lista")
		}
		listaDeDias.forEach{ e =>self.eliminarRegistrioDelDia(e)}
	}
	method cantidadDeDiasRegistrados() = registro.size()
	
	method estaVacioElRegistro() = registro.isEmpty()
	
	method algunDiaAbatido(cantidad) = registro.any( {r => self.cantidad(r) == cantidad} )
	
	method primerValorDeAbatidos() = self.cantidad(registro.first() )
	
	method ultimoValorAbatidos() = self.cantidad(registro.first() )
	
	
	method maximoValorDeAbatidos() = registro.max({r => self.cantidad(r) }).first() 
	method maximoValorDeAbatidosConMap() = registro.map( {r => self.cantidad(r)} ).max() // hay 3 maneras de buacarlo
	method maximoValorDeAbatidos3() = self.cantidad(registro.max({r => self.cantidad(r) })) // esta es la mas adecuada
	
	method totalDeAbatidos() = registro.sum ({ r => self.cantidad(r) })
	
	method cantidadDeAbatidosElDia(dia) = self.cantidad(self.registroDia(dia) )
	
	method ultimoValorDeAbatidos() = self.cantidad ( registro.get(registro.size() - 1) )
	
	
	
	
	
	
	method esCrack() = (1..registro.size() -1).all({ indice => self.cantidad( registro.get(indice) ) > self.cantidad(registro.get(indice - 1)) })   // hay q hacerlo con una lista auxiliar , este codigo es para ir comprobando uno con el anterior
	









}









