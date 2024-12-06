;; 1. Definición de clases en CLIPS
;;; ---------------------------------------------------------
;;; Ontologia_SBC.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology Ontologia_SBC.ttl
;;; :Date 04/12/2024 10:47:17

(defclass Epoca
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot epoca_tiene_obra
        (type INSTANCE)
        (create-accessor read-write))
    (slot Nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Estilo
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot estilo_tiene_obra
        (type INSTANCE)
        (create-accessor read-write))
    (slot Nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Obra
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot obra_tiene_epoca
        (type INSTANCE)
        (create-accessor read-write))
    (slot obra_tiene_estilo
        (type INSTANCE)
        (create-accessor read-write))
    (slot obra_tiene_pintor
        (type INSTANCE)
        (create-accessor read-write))
    (slot obra_tiene_tematica
        (type INSTANCE)
        (create-accessor read-write))
    (slot Complejidad
        (type SYMBOL)
        (create-accessor read-write))
    (slot Data_creacion
        (type SYMBOL)
        (create-accessor read-write))
    (slot Dimensiones_alto
        (type FLOAT)
        (create-accessor read-write))
    (slot Dimensiones_largo
        (type FLOAT)
        (create-accessor read-write))
    (slot Importancia
        (type SYMBOL)
        (create-accessor read-write))
    (slot Nombre
        (type STRING)
        (create-accessor read-write))
    (slot Sala
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Pintor
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot pintor_tiene_obra
        (type INSTANCE)
        (create-accessor read-write))
    (slot Nacionalidad
        (type STRING)
        (create-accessor read-write))
    (slot Nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Preferencia
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot preferencia_de_epoca
        (type INSTANCE)
        (create-accessor read-write))
    (multislot preferencia_de_estilo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot preferencia_de_pintor
        (type INSTANCE)
        (create-accessor read-write))
    (multislot preferencia_de_tematica
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Tematica
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot tematica_tiene_obra
        (type INSTANCE)
        (create-accessor read-write))
    (slot Nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Visita
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot vista_tiene_preferencia
        (type INSTANCE)
        (create-accessor read-write))
    (slot Conocimiento_visita
        (type SYMBOL)
        (create-accessor read-write))
    (slot Duracion_visita
        (type INTEGER)
        (create-accessor read-write))
    (slot Hay_peques_visita
        (type SYMBOL)
        (create-accessor read-write))
    (slot Ndias_visita
        (type INTEGER)
        (create-accessor read-write))
    (slot Npersonas_visita
        (type INTEGER)
        (create-accessor read-write))
)


;;2. Exportación del MAIN y definicion módulos

(defmodule MAIN (export ?ALL) )

(defmodule getInput (import MAIN ?ALL) (export ?ALL) )

(defmodule abstraccion (import MAIN ?ALL) (import getInput ?ALL) (export ?ALL) )

(defmodule asociacionHeuristica (import MAIN ?ALL) (import abstraccion ?ALL) (export ?ALL) )

(defmodule impresionResultado (import MAIN ?ALL) (import asociacionHeuristica ?ALL) (export ?ALL) )

(defrule MAIN::reglaInicial
	(declare (salience 10))
	=>
	(printout t crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t "|                     Práctica SBC Museo                      |" crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t crlf)
	(focus getInput) 
)

;; 3. Templates
(deftemplate MAIN::datosVisita
    (slot Npersonas_visita (type INTEGER) (default 0))
    (slot Conocimiento_visita (type INTEGER) (default 0))
    (slot Ndias_visita (type INTEGER) (default 0))
    (slot Duracion_visita (type INTEGER) (default 0))
    (slot Hay_peques_visita (type SYMBOL) (default FALSE))
)

(deftemplate MAIN::preferenciasVisita
    (slot Tematica (type STRING))
    (slot Epoca (type STRING))
    (slot Estilo (type STRING))
    (slot Pintor (type STRING))
)

(deftemplate ResultadoFinal
    (slot descripcion (type STRING) (default "Resultado final"))
    (slot valor (type INTEGER) (default 0))
)

;; 4. Mensajes


;; 5. Funciones

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
    (bind ?indice 1)
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
    ?lista<23
)


;; 6. Reglas
;; (a) Módulos de preguntas.
(defrule getInput::preguntaNumeroPersonas
    =>
    (bind ?pregunta "¿Cuantas personas van a visitar el museo? ")
    (bind ?respuesta (pregunta_numero ?pregunta))
    (assert (datosVisita (Npersonas_visita ?respuesta)))
)
(defrule getInput::Ndias_visita
    =>
    (bind ?pregunta "¿Cuantos dias va a durar la visita? ")
    (bind ?respuesta (pregunta_numero ?pregunta))
    (assert (datosVisita (Ndias_visita ?respuesta)))
)
(defrule getInput::Duracion_visita
    =>
    (bind ?pregunta "¿Cuantas horas por dia va a durar la visita? ")
    (bind ?respuesta (pregunta_numero ?pregunta))
    (assert (datosVisita (Duracion_visita ?respuesta)))
)
(defrule getInput::pregunta_conocimiento
    =>
    (bind ?pregunta "¿Cuanto conocimiento tienen sobre arte? [1-10]")
    (bind ?respuesta (pregunta_numero ?pregunta))
    (assert (datosVisita (Conocimiento_visita ?respuesta)))
)
(defrule getInput::pregunta_peques
    =>
    (bind ?pregunta "¿Van a ir niños pequeños? ")
    (bind ?respuesta (pregunta_boolean ?pregunta))
    (assert (datosVisita (Hay_peques_visita ?respuesta)))
)

(defrule getInput::preguntaPreferencias
    =>
    (bind ?pregunta "¿Tiene alguna preferencia en cuanto a la tematica de las obras? ")
    (bind ?respuesta (pregunta_boolean ?pregunta))
    (if ?respuesta then
        (bind ?pregunta "¿Cual es su preferencia en cuanto a la tematica de las obras? ")
        (bind ?respuesta (pregunta_opcion_unica ?pregunta "Mitologico" "Historico"))
        (assert (preferenciasVisita (Tematica ?respuesta)))
    )

    (bind ?pregunta "¿Tiene alguna preferencia en cuanto a la epoca de las obras? ")
    (bind ?respuesta (pregunta_boolean ?pregunta))
    (if ?respuesta then
        (bind ?pregunta "¿Cual es su preferencia en cuanto a la epoca de las obras? ")
        (bind ?respuesta (pregunta_opcion_unica ?pregunta "s.XXVI a.C" "s.IX a.C" ))
        (assert (preferenciasVisita (Epoca ?respuesta)))
    )
    (bind ?pregunta "¿Tiene alguna preferencia en cuanto al estilo de las obras? ")
    (bind ?respuesta (pregunta_boolean ?pregunta))
    (if ?respuesta then
        (bind ?pregunta "¿Cual es su preferencia en cuanto al estilo de las obras? ")
        (bind ?respuesta (pregunta_opcion_unica ?pregunta "Barroco" "Gotico" ))
        (assert (preferenciasVisita (Estilo ?respuesta)))
    )
    (bind ?pregunta "¿Tiene alguna preferencia en cuanto al pintor de las obras? ")
    (bind ?respuesta (pregunta_boolean ?pregunta))
    (if ?respuesta then
        (bind ?pregunta "¿Cual es su preferencia en cuanto al pintor de las obras? ")
        (bind ?respuesta (pregunta_opcion_unica ?pregunta "Da Vinci" "Gericault"))
        (assert (preferenciasVisita (Pintor ?respuesta)))
    )
    (focus abstraccion)

);; Reglas de abstracción 
(defrule abstraccion::abstraccionDatosVisita
    ?datosVisita <- (datosVisita (Npersonas_visita ?n)
                                  (Conocimiento_visita ?c)
                                  (Ndias_visita ?d)
                                  (Duracion_visita ?h)
                                  (Hay_peques_visita ?p))
    =>
    (assert (Visita (Npersonas_visita ?n)
                    (Conocimiento_visita ?c)
                    (Ndias_visita ?d)
                    (Duracion_visita ?h)
                    (Hay_peques_visita ?p)))
    (retract ?datosVisita)
)

;; Reglas de asociación heurística
(defrule asociacionHeuristica::buscar-preferencias-visita
    ?visita <- (datosVisita 
                  (Duracion_visita ?duracionVisita))
    ?preferencias <- (preferenciasVisita 
                  (Tematica ?prefiereTematicas)
                  (Epoca ?prefiereEpocas)
                  (Estilo ?prefiereEstilos)
                  (Pintor ?prefierePintores))
    ?obra <- (object (is-a Obra) 
               (obra_tiene_epoca ?obra_epocas) 
               (obra_tiene_estilo ?obra_estilos) 
               (obra_tiene_pintor ?obra_pintores) 
               (obra_tiene_tematica ?obra_tematicas)
               (Importancia ?importancia) 
               (Sala ?sala))
   =>
   (bind ?prioridad 0)

   (foreach ?preferencia $?preferencias
      
      (foreach ?obra_epoca ?obra_epocas
         (if (member$ ?obra_epoca ?prefiereEpocas) then 
            (bind ?prioridad (+ ?prioridad 10))
         )
      )

      (foreach ?obra_estilo ?obra_estilos
         (if (member$ ?obra_estilo ?prefiereEstilos) then 
            (bind ?prioridad (+ ?prioridad 10))
         )
      )

      (foreach ?obra_pintor ?obra_pintores
         (if (member$ ?obra_pintor ?prefierePintores) then 
            (bind ?prioridad (+ ?prioridad 10))
         )
      )

      (foreach ?tematica ?obra_tematicas
         (if (member$ ?tematica ?prefiereTematicas) then 
            (bind ?prioridad (+ ?prioridad 10))
         )
      )
   )

   (if (eq ?importancia 3) then 
      (bind ?prioridad (+ ?prioridad 5))
   )

   (assert (Obra_Preferente 
               (Obra ?obra) 
               (Prioridad ?prioridad) 
               (Sala ?sala)
               (Duracion 1)))
)

(defrule asociacionHeuristica::crear-y-ordenar-ruta
   (declare (salience 10))
   ?visita <- (object (is-a Visita) (Duracion_visita ?tiempo_visita))
   =>
   (bind $?prioridades (find-all-instances (Obra_Preferente) TRUE))

   (bind $?ruta (create$))
   (bind ?tiempoRestante ?tiempo_visita)

   (foreach ?obra $?prioridades
      (if (> ?tiempoRestante 0) then 
         (bind ?duracion (send ?obra get-Duracion))

         (if (<= ?duracion ?tiempoRestante) then
            (bind ?tiempoRestante (- ?tiempoRestante ?duracion))

            (bind $?ruta (insert$ $?ruta (+ (length$ $?ruta) 1) ?obra))
         )
      )
   )

=   (bind $?rutaOrdenadaSala (sort-by-slot $?ruta Sala))

=   (assert (Ruta (Obras $?rutaOrdenadaSala)))

=   (focus impresionResultado)
)

;; Reglas de impresión del resultado

(deftemplate impresionResultado::contador ;; <--- aqui no va
    (slot count (type INTEGER))
)

(deffacts impresionResultado::hechos-iniciales
    (contador (count 1))
)

(defrule impresionResultado::imprimir-cabecera
    (declare (salience 10))
    =>
    (printout t crlf)
    (printout t "-------------------------------------------------------------" crlf)
    (printout t "-------------------- Resultados de la Ruta ------------------" crlf)
    (printout t "-------------------------------------------------------------" crlf)
    (printout t "---------------- Sala - Obra - Autor - Tiempo ---------------" crlf)
    (printout t crlf)
)

(defrule impresionResultado::imprimir-resultado
    ?contador <- (contador (count ?n))
    (ruta ?obras)
    (nth$ ?n ?obras ?obra)
    =>
    (bind ?sala (send ?obra get-sala))
    (bind ?nombre (send ?obra get-nombre))
    (bind ?autor (send ?obra get-autor))
    (bind ?tiempo (send ?obra get-tiempo)) ;; lo quitamos si quereis

    (format t "Sala %d:" ?sala)
    (printout t crlf)
    (printout t "-------------------------------------------------------------" crlf)
    (printout t crlf)
    (format t "%s - %s - %s - %d min" ?sala ?nombre ?autor ?tiempo)
    (printout t crlf)
    (printout t crlf)
    (assert (contador (count (+ ?n 1))))
    (retract ?contador)
)



