valor(ciento, 100).
valor(doscientos, 200).
valor(trescientos, 300).
valor(cuatrocientos, 400).
valor(quinientos, 500).
valor(seiscientos, 600).
valor(setecientos, 700).
valor(ochocientos, 800).
valor(novecientos, 900).

valor(uno, 1).
valor(dos, 2).
valor(tres, 3).
valor(cuatro, 4).
valor(cinco, 5).
valor(seis, 6).
valor(siete, 7).
valor(ocho, 8).
valor(nueve, 9).
valor(diez, 10).
valor(once, 11).
valor(doce, 12).
valor(trece, 13).
valor(catorce, 14).
valor(quince, 15).
valor(dieciseis, 16).
valor(decisiete, 17).
valor(dieciocho, 18).
valor(diecinueve, 19).
valor(veinte, 20).
valor(veintiuno, 21).
valor(veintidos, 22).
valor(veintitres, 23).
valor(veinticuatro, 24).
valor(veinticinco, 25).
valor(veintiseis, 26).
valor(veintisiete, 27).
valor(veintiocho, 28).
valor(veintinueve, 29).
valor(treinta, 30).
valor(cuarenta, 40).
valor(cincuenta, 50).
valor(sesenta,60).
valor(setenta,70).
valor(ochenta, 80).
valor(noventa, 90).
valor(cien, 100).

valor(cero,0).

deNombreANumero([PrimeraPalabra, SegundaPalabra, y, TerceraPalabra], Numero) :-
    deNombreANumero([PrimeraPalabra, SegundaPalabra, TerceraPalabra], Numero).

deNombreANumero([PrimeraPalabra, y, SegundaPalabra], Numero) :-
    deNombreANumero([PrimeraPalabra, SegundaPalabra, cero], Numero).

deNombreANumero([PrimeraPalabra, SegundaPalabra], Numero) :-
    deNombreANumero([PrimeraPalabra, SegundaPalabra, cero], Numero).

deNombreANumero([UnicaPalabra], Numero) :-
    deNombreANumero([UnicaPalabra, cero, cero], Numero).

deNombreANumero([PrimeraPalabra, SegundaPalabra, TerceraPalabra], Numero) :-
    valor(PrimeraPalabra, ValorPrimeraPalabra),
    valor(SegundaPalabra, ValorSegundaPalabra),
    valor(TerceraPalabra, ValorTerceraPalabra),
    Numero is ValorPrimeraPalabra + ValorSegundaPalabra + ValorTerceraPalabra.