import clases.*
import viajes.*
class Socio{
    const edad
    const idiomas = #{}
    const actividades = []
    const cantidadMaxActividades
    method agregarIdioma(idioma){idiomas.add(idioma)}
    method realizarActividad(actividad){
        if(self.actividadesRealizadas() < cantidadMaxActividades){
            actividades.add(actividad)
        }
        else{
            self.error("Ya cumpliste el maximo de actividades")
        }
    }
    method actividadesRealizadas() = actividades.size()
    method quitarActividad(actividad) {actividades.remove(actividad)}
    method esAdoradorDelSol() =
        actividades.all({a => a.sirveParaBroncearse()})
    method actividadesEsforzadas() = 
        actividades.filter({a => a.implicaEsfuerzo()})
    method leAtrae(actividad)
}

class SocioTranquilo inherits Socio{
    override method leAtrae(actividad) = actividad.diasQueLleva() >= 4
}

class SocioCoherente inherits Socio{
    override method leAtrae(actividad) = 
        if(self.esAdoradorDelSol()) actividad.sirveParaBroncearse() 
        else actividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socio{
    override method leAtrae(actividad) = 
        !idiomas.intersection(actividad.idiomas()).isEmpty()
}
