/*
Escribir un predicado y la base de hechos 
necesaria que permitan conocer el costo de 
un viaje a partir del costo del transporte 
y alojamiento (considerando el número de días 
de alojamiento). Cada destino tiene un costo de transporte,
a saber: Bariloche $5000, Salta $7000, Mar del Plata $3500. 
El turista puede alojarse en hotel, cabaña o camping, el costo 
está dado por noche: hotel en Bariloche 800, cabaña en Bariloche 1400, 
camping en Bariloche 1350; hotel en Salta $2800, cabaña en Salta 3200, 
camping en Salta 12500, hotel en Mar del Plata 3500, cabaña en Mar del Plata 2900, 
camping en Mar del Plata 1500.

*/

transporte(bariloche, 5000).
transporte(salta, 7000).
transporte(marDelPlata, 3500).

alojamiento(bariloche, hotel, 800).
alojamiento(bariloche, cabania, 1400).
alojamiento(bariloche, camping, 1350).

alojamiento(salta, hotel, 2800).
alojamiento(salta, cabania, 3200).
alojamiento(salta, camping, 12500).

alojamiento(marDelPlata, hotel, 3500).
alojamiento(marDelPlata, cabania, 2900).
alojamiento(marDelPlata, camping, 1500).

costoDeViaje(CostoTotalViaje, Destino, TipoAlojamiento, DiasDeAlojamiento) :-
    transporte(Destino, CostoDeTransporte),
    alojamiento(Destino, TipoAlojamiento, CostoAlojamientoPorDia),
    CostoTotalViaje is CostoAlojamientoPorDia * DiasDeAlojamiento + CostoDeTransporte * 2.
