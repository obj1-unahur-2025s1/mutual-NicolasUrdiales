class Viaje{
  const property idiomas = #{}
  method implicaEsfuerzo()
  method sirveParaBroncearse()
  method diasQueLleva()
  method idiomasQueSeUsan(listaIdiomas){idiomas.addAll(listaIdiomas)}
  method esInteresante() = self.cantidadDeIdiomas() > 1
  method cantidadDeIdiomas() = idiomas.size()
}

class ViajeDePlaya inherits Viaje{
  const largoPlaya
  override method diasQueLleva() = largoPlaya / 500
  override method implicaEsfuerzo() = largoPlaya > 1200
  override method sirveParaBroncearse() = true
}

class ExcursionACiudad inherits Viaje{
  const cantidadDeAtracciones
  override method diasQueLleva() = cantidadDeAtracciones / 2
  override method implicaEsfuerzo() = cantidadDeAtracciones.between(5, 8)
  override method sirveParaBroncearse() = false
  override method esInteresante() = super() || cantidadDeAtracciones == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad{
  override method diasQueLleva() = super() + 1
  override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Viaje{
  const kilometrosDeSenderos
  const diasDeSol
  override method diasQueLleva() = kilometrosDeSenderos / 50
  override method implicaEsfuerzo() = kilometrosDeSenderos > 80
  override method sirveParaBroncearse() =
    diasDeSol > 200 || (diasDeSol.between(100, 200) && kilometrosDeSenderos > 120)
  override method esInteresante() = super() && diasDeSol > 140
}




