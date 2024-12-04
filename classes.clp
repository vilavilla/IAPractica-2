(defclass Pintor
    (is-a USER)
    (role concrete)
    (single-slot Nombre
        (type STRING)
        (create-accessor read-write))
    (multislot Pintor_Estilo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Pintor_Epoca
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Pintor_Cuadro
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Nacionalidad
        (type STRING)
        (create-accessor read-write)))

(defclass Estilo
    (is-a USER)
    (role concrete)
    (single-slot Nombre
        (type STRING)
        (create-accessor read-write))
    (multislot Estilo_Pintor
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Estilo_Cuadro
        (type INSTANCE)
        (create-accessor read-write)))

(defclass Epoca
    (is-a USER)
    (role concrete)
    (single-slot Nombre
        (type STRING)
        (create-accessor read-write))
    (multislot Epoca_Pintor
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Epoca_Cuadro
        (type INSTANCE)
        (create-accessor read-write)))

(defclass Cuadro
    (is-a USER)
    (role concrete)
    (single-slot Titulo
        (type STRING)
        (create-accessor read-write))
    (single-slot Dimensiones
        (type STRING)
        (create-accessor read-write))
    (single-slot Anyo
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Complejidad
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Relevancia
        (type INTEGER)
        (range 1 3)
        (create-accessor read-write))
    (single-slot Sala
        (type INTEGER)
        (create-accessor read-write))
    (multislot Cuadro_Tematica
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Cuadro_Epoca
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Cuadro_Estilo
        (type INSTANCE)
        (create-accessor read-write))
    (single-slot Cuadro_Pintor
        (type INSTANCE)
        (create-accessor read-write)))

(defclass Tematica
    (is-a USER)
    (role concrete)
    (single-slot Nombre
        (type STRING)
        (create-accessor read-write))
    (multislot Tematica_Cuadro
        (type INSTANCE)
        (create-accessor read-write)))

(defclass PrioridadCuadro
    (is-a USER)
    (role concrete)
    (slot Cuadro
        (type INSTANCE)
        (create-accessor read-write))
    (slot Prioridad 
        (type INTEGER)
        (create-accessor read-write))
    (slot Duracion 
        (type INTEGER)
        (create-accessor read-write)))

(defclass Visita
    (is-a USER)
    (role concrete)
    (single-slot Personas
        (type INTEGER; Definición de clases en CLIPS
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
(defmodule getResultado (import MAIN ?ALL) (import getPrioridadesVisita ?ALL) (export ?ALL) ))
        (create-accessor read-write))
    (single-slot Conocimiento
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Ninos
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (create-accessor read-write))
    (single-slot Dias
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Mas_Ninos
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (create-accessor read-write))
    (single-slot Tiempo
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Horas
        (type INTEGER)
        (create-accessor read-write))
    (single-slot Visita_Preferencias
        (type INSTANCE)
        (create-accessor read-write)))

(defclass Preferencias
    (is-a USER)
    (role concrete)
    (multislot Preferencias_Estilo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Preferencias_Pintor
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Preferencias_Epoca
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Preferencias_Tematica
        (type INSTANCE)
        (create-accessor read-write)))
