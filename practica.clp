; Definición de clases en CLIPS
(load "classes.clp")
(load "instancias.clp")

;;Definicion modulos
;;Clasificación heurística
(defmodule MAIN (export ?ALL) )

(defmodule getInput (import MAIN ?ALL) (export ?ALL) )

;Pasar de problema concreto a uno abstracto
(defmodule getPreferenciasVisita (import MAIN ?ALL) (import getInput ?ALL) (export ?ALL) )

;Realizar asociación heurística
(defmodule getPrioridadesVisita (import MAIN ?ALL) (import getPreferenciasVisita ?ALL) (export ?ALL) )

;Generar resultado
(defmodule getResultado (import MAIN ?ALL) (import getPrioridadesVisita ?ALL) (export ?ALL) )