; Definición de clases en CLIPS
;;; ---------------------------------------------------------
;;; Ontologia_SBC.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology Ontologia_SBC.ttl
;;; :Date 04/12/2024 10:47:17
load "Ontologia_SBC.clp"

;;Definicion modulos
;;Clasificación heurística
(defmodule MAIN (export ?ALL) )

(defmodule getInput (import MAIN ?ALL) (export ?ALL) )

;Pasar de problema concreto a uno abstracto
(defmodule abstraccion (import MAIN ?ALL) (import getInput ?ALL) (export ?ALL) )

;Realizar asociación heurística
(defmodule asociacionHeuristica (import MAIN ?ALL) (import abstraccion ?ALL) (export ?ALL) )

;Generar resultado
(defmodule getResultado (import MAIN ?ALL) (import asociacionHeuristica ?ALL) (export ?ALL) )

(defrule MAIN::reglaInicial
	(declare (salience 10))
	=>
	(printout t crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t "-------------------- Practica SBC Museo ----------------------" crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t crlf)
	(focus getInput) 
)

;; Definición de Templates
(deftemplate MAIN::datosVisita
    (slot Npersonas_visita)
    (slot Conocimiento_visita)
    (slot Ndias_visita)
    (slot Duracion_visita)
    (slot Hay_peques_visita)
)

(deftemplate MAIN::preferenciasVisita
    (slot Tematica)
    (slot Epoca)
    (slot Estilo)
    (slot Pintor)
)
;; Definición de funciones

(deffunction MAIN::pregunta_numero (?pregunta)
    (printout t ?pregunta)
    (bind ?respuesta (read))
    ?respuesta
)

(deffunction MAIN::pregunta_boolean (?pregunta)
    (format t "%s [T/F] " ?pregunta)
    (bind ?respuesta (read))

    (while (not (or (eq ?respuesta "T") (eq ?respuesta "F")))
        (format t "Por favor, responda con T o F: ")
        (bind ?respuesta (read))
    )

    (if (eq ?respuesta "T") then
        TRUE
    else
        FALSE
    )
    
)

(deffunction MAIN::pregunta_opcion_unica (?pregunta $?opciones)
   (bind ?indice 1)
   (bind ?linea (format nil "%s" ?pregunta))
   (printout t ?linea crlf)

   (progn$ (?valor $?opciones)
      (bind ?linea (format nil "  %d. %s" ?indice ?valor))
      (printout t ?linea crlf)
      (bind ?indice (+ ?indice 1))
   )

   (format t "%s" "Indica tu respuesta (Escoge el indice correspondiente): ")
   (bind ?resp (read))
   ?resp
)

(deffunction MAIN::pregunta_opciones_multiples (?pregunta $?opciones)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?opciones)
            (bind ?linea (format nil "  %d. %s" ?indice ?var))
            (printout t ?linea crlf)
    )
    (format t "%s" "Indica tu respuesta (Escogiendo el indice correspondiente, separados por un espacio): ")
    (bind ?respuesta (readline))
    (bind ?numeros (str-explode ?respuesta))
    (bind $?lista (create$ ))
    (progn$ (?var ?numeros)
        (if (and (integerp ?var) (and (>= ?var 1) (<= ?var (length$ ?opciones))))
            then
                (if (not (member$ ?var ?lista))
                    then (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) ?var))
                )
        )
    )
    ?lista
)

;;Reglas 
(defrule getInput::preguntaNumeroPersonas
    (declare (salience 10))
    =>
    (bind ?pregunta "¿Cuantas personas van a visitar el museo? ")
    (bind ?respuesta (pregunta_numero ?pregunta))
    (assert (datosVisita (Npersonas_visita ?respuesta)))
)
(defrule getInput::Ndias_visita
    (declare (salience 10))
    =>
    (bind ?pregunta "¿Cuantos dias va a durar la visita? ")
    (bind ?respuesta (pregunta_numero ?pregunta))
    (assert (datosVisita (Ndias_visita ?respuesta)))
)
(defrule getInput::Duracion_visita
    (declare (salience 10))
    =>
    (bind ?pregunta "¿Cuantas horas por dia va a durar la visita? ")
    (bind ?respuesta (pregunta_numero ?pregunta))
    (assert (datosVisita (Duracion_visita ?respuesta)))
)
(defrule getInput::pregunta_conocimiento
    (declare (salience 10))
    =>
    (bind ?pregunta "¿Cuanto conocimiento tienen sobre arte? ")
    (bind ?respuesta (pregunta_opcion_unica ?pregunta "Nada" "Poco" "Mucho"))
    (assert (datosVisita (Conocimiento_visita ?respuesta)))
)
(defrule getInput::pregunta_peques
    (declare (salience 10))
    =>
    (bind ?pregunta "¿Van a ir niños pequeños? ")
    (bind ?respuesta (pregunta_boolean ?pregunta))
    (assert (datosVisita (Hay_peques_visita ?respuesta)))
)

(defrule getInput::preguntaPreferencias
    (declare (salience 10))
    =>
    (bind ?pregunta "¿Tiene alguna preferencia en cuanto a la tematica de las obras? ")
    (bind ?respuesta (pregunta_boolean ?pregunta))
    (if ?respuesta then
        (bind ?pregunta "¿Cual es su preferencia en cuanto a la tematica de las obras? ")
        (bind ?respuesta (pregunta_opcion_unica ?pregunta "Religioso" "Historico" "Retrato" "Paisaje" "Costumbrista" "Bodegon"))
        (assert (preferenciasVisita (Tematica ?respuesta)))
    )

    (bind ?pregunta "¿Tiene alguna preferencia en cuanto a la epoca de las obras? ")
    (bind ?respuesta (pregunta_boolean ?pregunta))
    (if ?respuesta then
        (bind ?pregunta "¿Cual es su preferencia en cuanto a la epoca de las obras? ")
        (bind ?respuesta (pregunta_opcion_unica ?pregunta "Antigua" "Moderna" "Contemporanea"))
        (assert (preferenciasVisita (Epoca ?respuesta)))
    )
    (bind ?pregunta "¿Tiene alguna preferencia en cuanto al estilo de las obras? ")
    (bind ?respuesta (pregunta_boolean ?pregunta))
    (if ?respuesta then
        (bind ?pregunta "¿Cual es su preferencia en cuanto al estilo de las obras? ")
        (bind ?respuesta (pregunta_opcion_unica ?pregunta "Clasico" "Romantico" "Realista" "Impresionista" "Expresionista" "Abstracto"))
        (assert (preferenciasVisita (Estilo ?respuesta)))
    )
    (bind ?pregunta "¿Tiene alguna preferencia en cuanto al pintor de las obras? ")
    (bind ?respuesta (pregunta_boolean ?pregunta))
    (if ?respuesta then
        (bind ?pregunta "¿Cual es su preferencia en cuanto al pintor de las obras? ")
        (bind ?respuesta (pregunta_opcion_unica ?pregunta "Velazquez" "Goya" "Picasso" "Dali" "Van Gogh" "Rembrandt"))
        (assert (preferenciasVisita (Pintor ?respuesta)))
    )
    (focus abstraccion)
)

;;Reglas de abstracción EN ESTA PARTE HAY QUE HACER UNA INSTANCIA DE LA VISITA CON LOS DATOS RECOGIDOS
(defrule abstraccion::abstraccionVisita
    (declare (salience 10))
    ?datosVisita <- (datosVisita (Npersonas_visita ?n) (Conocimiento_visita ?c) (Ndias_visita ?d) (Duracion_visita ?h) (Hay_peques_visita ?p))
    ?preferenciasVisita <- (preferenciasVisita (Tematica ?t) (Epoca ?e) (Estilo ?s) (Pintor ?pi))
    =>
    (assert (Visita (Npersonas_visita ?n) (Conocimiento_visita ?c) (Ndias_visita ?d) (Duracion_visita ?h) (Hay_peques_visita ?p) (Tematica ?t) (Epoca ?e) (Estilo ?s) (Pintor ?pi)))
    (focus asociacionHeuristica)
)
