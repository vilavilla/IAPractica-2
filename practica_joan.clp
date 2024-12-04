; Gestión de Estilos
(bind ?estiloNombres (create$)) ; Inicializa lista vacía para nombres de estilos
(bind ?estilos (find-all-instances ((?instancia Estilo)) TRUE)) ; Encuentra todas las instancias de Estilo
(do-for-all-facts (?estilo ?estilos) ; Recorre cada instancia de Estilo
    (bind ?nombreEstilo (send ?estilo get-Nombre))
    (bind ?estiloNombres (insert$ ?estiloNombres (length$ ?estiloNombres) ?nombreEstilo)) ; Añade nombre del estilo a la lista
)
(bind ?estiloIndices (pregunta-multiple "Seleccione los estilos preferidos:" ?estiloNombres))
(bind ?preferenciasEstilos (create$)) ; Inicializa lista de preferencias de estilos
(do-for-all-facts (?indice ?estiloIndices)
    (bind ?estiloSeleccionado (nth$ ?indice ?estilos))
    (bind ?preferenciasEstilos (insert$ ?preferenciasEstilos (length$ ?preferenciasEstilos) ?estiloSeleccionado)) ; Añade estilo seleccionado a las preferencias
)

; Gestión de Pintores
(bind ?pintorNombres (create$)) ; Inicializa lista vacía para nombres de pintores
(bind ?pintores (find-all-instances ((?instancia Pintor)) TRUE)) ; Encuentra todas las instancias de Pintor
(do-for-all-facts (?pintor ?pintores) ; Recorre cada instancia de Pintor
    (bind ?nombrePintor (send ?pintor get-Nombre))
    (bind ?pintorNombres (insert$ ?pintorNombres (length$ ?pintorNombres) ?nombrePintor)) ; Añade nombre del pintor a la lista
)
(bind ?pintorIndices (pregunta-multiple "Seleccione los pintores preferidos:" ?pintorNombres))
(bind ?preferenciasPintores (create$)) ; Inicializa lista de preferencias de pintores
(do-for-all-facts (?indice ?pintorIndices)
    (bind ?pintorSeleccionado (nth$ ?indice ?pintores))
    (bind ?preferenciasPintores (insert$ ?preferenciasPintores (length$ ?preferenciasPintores) ?pintorSeleccionado)) ; Añade pintor seleccionado a las preferencias
)

; Gestión de Épocas
(bind ?epocaNombres (create$)) ; Inicializa lista vacía para nombres de épocas
(bind ?epocas (find-all-instances ((?instancia Epoca)) TRUE)) ; Encuentra todas las instancias de Época
(do-for-all-facts (?epoca ?epocas) ; Recorre cada instancia de Época
    (bind ?nombreEpoca (send ?epoca get-Nombre))
    (bind ?epocaNombres (insert$ ?epocaNombres (length$ ?epocaNombres) ?nombreEpoca)) ; Añade nombre de la época a la lista
)
(bind ?epocaIndices (pregunta-multiple "Seleccione las épocas preferidas:" ?epocaNombres))
(bind ?preferenciasEpocas (create$)) ; Inicializa lista de preferencias de épocas
(do-for-all-facts (?indice ?epocaIndices)
    (bind ?epocaSeleccionada (nth$ ?indice ?epocas))
    (bind ?preferenciasEpocas (insert$ ?preferenciasEpocas (length$ ?preferenciasEpocas) ?epocaSeleccionada)) ; Añade época seleccionada a las preferencias
)

; Gestión de Temáticas
(bind ?tematicaNombres (create$)) ; Inicializa lista vacía para nombres de temáticas
(bind ?tematicas (find-all-instances ((?instancia Tematica)) TRUE)) ; Encuentra todas las instancias de Temática
(do-for-all-facts (?tematica ?tematicas) ; Recorre cada instancia de Temática
    (bind ?nombreTematica (send ?tematica get-Nombre))
    (bind ?tematicaNombres (insert$ ?tematicaNombres (length$ ?tematicaNombres) ?nombreTematica)) ; Añade nombre de la temática a la lista
)
(bind ?tematicaIndices (pregunta-multiple "Seleccione las temáticas preferidas:" ?tematicaNombres))
(bind ?preferenciasTematicas (create$)) ; Inicializa lista de preferencias de temáticas
(do-for-all-facts (?indice ?tematicaIndices)
    (bind ?tematicaSeleccionada (nth$ ?indice ?tematicas))
    (bind ?preferenciasTematicas (insert$ ?preferenciasTematicas (length$ ?preferenciasTematicas) ?tematicaSeleccionada)) ; Añade temática seleccionada a las preferencias
)

; Creación de hechos de preferencias de visita
(assert (auxEstilo aux))
(assert (auxPintor aux))
(assert (auxEpoca aux))
(assert (auxTematica aux))
(assert (auxCuadros aux))
(assert (PreferenciasVisita 
    (PreferenciasEstilo ?preferenciasEstilos)
    (PreferenciasPintor ?preferenciasPintores)
    (PreferenciasEpoca ?preferenciasEpocas)
    (PreferenciasTematica ?preferenciasTematicas)
))
(focus crearPrioridades)

; Generación de prioridades para cada cuadro
(defrule crearPrioridades::generar_prioridades "Generar prioridades para cada cuadro basado en las preferencias"
    (declare (salience 10))
    (Visita (conocimiento ?conocimiento) (personas ?personas) (ninos ?ninos) (masninos ?masninos))
    ?aux <- (auxCuadros aux)
    =>
    (retract ?aux)
    (bind ?cuadros (find-all-instances ((?instancia Cuadro)) TRUE))
    (progn$ (?cuadro ?cuadros)
        (bind ?prioridad 0)
        (bind ?duracion 9)
        (bind ?relevancia (send ?cuadro get-Relevancia))
        (bind ?complejidad (send ?cuadro get-Complejidad))
        
        ; Ajuste de prioridad basado en el conocimiento del visitante
        (if (or (eq ?conocimiento 1) (eq ?conocimiento 0)) then (bind ?prioridad (+ ?prioridad (* ?relevancia 2))))
        (if (eq ?conocimiento 2) then (bind ?prioridad (+ ?prioridad ?relevancia)))
        
        ; Ajuste de duración basado en diferentes factores
        (bind ?duracion (+ ?duracion (round (/ ?personas 10))))
        (bind ?duracion (+ ?duracion (round (/ ?conocimiento 2))))
        (bind ?duracion (+ ?duracion ?relevancia))
        (bind ?duracion (+ ?duracion (round (/ ?complejidad 20000))))
        
        ; Ajuste de duración si hay niños
        (if ?ninos
            then (if ?masninos
                then (bind ?duracion (- ?duracion 4))
                else (bind ?duracion (- ?duracion 2))
            )
        )
        
        (make-instance (gensym) of PrioridadCuadro (Cuadro ?cuadro) (Prioridad ?prioridad) (Duracion ?duracion))
    )
)

; Reglas para crear hechos de preferencias
(defrule crearPrioridades::crear_estilos_preferencias "Crea hechos para estilos preferidos"
    (declare (salience 10))
    (PreferenciasVisita (PreferenciasEstilo $?estilos))
    ?aux <- (auxEstilo aux)
    =>
    (retract ?aux)
    (progn$ (?estilo $?estilos)
        (assert (estilo ?estilo))
    )
)

(defrule crearPrioridades::crear_pintores_preferencias "Crea hechos para pintores preferidos"
    (declare (salience 10))
    (PreferenciasVisita (PreferenciasPintor $?pintores))
    ?aux <- (auxPintor aux)
    =>
    (retract ?aux)
    (progn$ (?pintor $?pintores)
        (assert (pintor ?pintor))
    )
)

(defrule crearPrioridades::crear_epocas_preferencias "Crea hechos para épocas preferidas"
    (declare (salience 10))
    (PreferenciasVisita (PreferenciasEpoca $?epocas))
    ?aux <- (auxEpoca aux)
    =>
    (retract ?aux)
    (progn$ (?epoca $?epocas)
        (assert (epoca ?epoca))
    )
)

(defrule crearPrioridades::crear_tematicas_preferencias "Crea hechos para temáticas preferidas"
    (declare (salience 10))
    (PreferenciasVisita (PreferenciasTematica $?tematicas))
    ?aux <- (auxTematica aux)
    =>
    (retract ?aux)
    (progn$ (?tematica $?tematicas)
        (assert (tematica ?tematica))
    )
)

