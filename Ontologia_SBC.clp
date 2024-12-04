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
)

(defclass Estilo
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot estilo_tiene_obra
        (type INSTANCE)
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
    (multislot Complejidad
        (type SYMBOL)
        (create-accessor read-write))
    (multislot Data_creacion
        (type SYMBOL)
        (create-accessor read-write))
    (multislot Dimensiones_alto
        (type FLOAT)
        (create-accessor read-write))
    (multislot Dimensiones_largo
        (type FLOAT)
        (create-accessor read-write))
    (multislot Importancia
        (type SYMBOL)
        (create-accessor read-write))
    (multislot Nombre
        (type STRING)
        (create-accessor read-write))
    (multislot Sala
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
    (multislot Nacionalidad
        (type STRING)
        (create-accessor read-write))
    (multislot Nombre
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
)

(defclass Visita
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot vista_tiene_preferencia
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Conocimiento_visita
        (type SYMBOL)
        (create-accessor read-write))
    (multislot Duracion_visita
        (type INTEGER)
        (create-accessor read-write))
    (multislot Hay_peques_visita
        (type SYMBOL)
        (create-accessor read-write))
    (multislot Ndias_visita
        (type INTEGER)
        (create-accessor read-write))
    (multislot Npersonas_visita
        (type INTEGER)
        (create-accessor read-write))
)

(definstances instances
)
