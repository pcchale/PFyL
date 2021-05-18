
%a) Todos los hombres son libres
%b) Nicolás es un hombre
%c) Nicolás es libre
libre(Persona) :-
    hombre(Persona).

hombre(nicolas).

%Query: libre(nicolas) -> True


%a) Los planetas son todos redondos
%b) Júpiter es un planeta
%c) Júpiter es redondo
planeta(cosa) :-
    redondo(cosa).
    
planeta(jupiter).
redondo(pelota).

%Query: redondo(jupiter) -> True

%a) Los vehículos deportivos son costosos
%b) El nuevo Ferrari es un vehículo deportivo
%c) El nuevo Ferrari es costoso

costoso(vehiculo) :-
    vehiculoDeportivo(vehiculo).

vehiculoDeportivo(ferrari).

%Query: costoso(ferrari) -> True

