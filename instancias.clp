;; Definición de instancias

;; Definición de las tematicas
(make-instance Tragedia of Tematica
    (Nombre "Tragedia"))
    
(make-instance Retrato of Tematica
    (Nombre "Retrato"))

(make-instance Historico of Tematica
    (Nombre "Histórico"))

;; Definición de las epocas
(make-instance SigloXIX of Epoca
    (Nombre "Siglo XIX"))

(make-instance SigloXV of Epoca
    (Nombre "Siglo XV"))

(make-instance SigloXVI of Epoca
    (Nombre "Siglo XVI"))
    
(make-instance SigloXVII of Epoca
    (Nombre "Siglo XVII"))
    
(make-instance SigloXVIII of Epoca
    (Nombre "Siglo XVIII"))
    
(make-instance SigloXII of Epoca
    (Nombre "Siglo XII"))
    
(make-instance SigloXX of Epoca
    (Nombre "Siglo XX"))
    
(make-instance SigloIIaC of Epoca
    (Nombre "Siglo II a.C"))
    
(make-instance SigloIXaC of Epoca
    (Nombre "Siglo IX a.C"))
    
(make-instance SigloXXVIaC of Epoca
    (Nombre "Siglo XXVI a.C"))

;; Definición de los estilos
(make-instance Romanticismo of Estilo
    (Nombre "Romanticismo"))

(make-instance Renacimiento of Estilo
    (Nombre "Renacimiento"))

(make-instance Renacentista of Estilo
    (Nombre "Renacentista"))

(make-instance GriegoHelenistico of Estilo
    (Nombre "Griego Helenístico"))
    
(make-instance Neoclasicismo of Estilo
    (Nombre "Neoclasicismo"))
    
(make-instance Barroco of Estilo
    (Nombre "Barroco"))
    
(make-instance Gotico of Estilo
    (Nombre "Gótico"))
    
(make-instance Asirio of Estilo
    (Nombre "Asirio"))
    
(make-instance Egipcio of Estilo
    (Nombre "Egipcio"))
    
(make-instance Expresionismo of Estilo
    (Nombre "Expresionismo"))


;; Definición de los pintores
(make-instance TheodoreGericault of Pintor
    (Nombre "Géricault")
    (Pintor_Estilo (create$ Romanticismo))
    (Pintor_Epoca (create$ SigloXIX)))

(make-instance LeonardoDaVinci of Pintor
    (Nombre "Leonardo Da Vinci")
    (Pintor_Estilo (create$ Renacimiento))
    (Pintor_Epoca (create$ SigloXV)))

(make-instance PaoloVeronese of Pintor
    (Nombre "Paolo Veronese")
    (Pintor_Estilo (create$ Renacimiento))
    (Pintor_Epoca (create$ SigloXV)))

(make-instance JacquesLouisDavid of Pintor
    (Nombre "Jacques-Louis David")
    (Pintor_Estilo (create$ Neoclasicismo))
    (Pintor_Epoca (create$ SigloXIX)))

(make-instance EugeneDelacroix of Pintor
    (Nombre "Eugène Delacroix")
    (Pintor_Estilo (create$ Romanticismo))
    (Pintor_Epoca (create$ SigloXIX)))

(make-instance GuillaumeCoustou of Pintor
    (Nombre "Guillaume Coustou")
    (Pintor_Estilo (create$ Barroco))
    (Pintor_Epoca (create$ SigloXVIII)))

(make-instance SandroBotticelli of Pintor
    (Nombre "Sandro Botticelli")
    (Pintor_Estilo (create$ Renacentista))
    (Pintor_Epoca (create$ SigloXV)))

(make-instance MiguelAngelBuonarroti of Pintor
    (Nombre "Miguel Ángel Buonarroti")
    (Pintor_Estilo (create$ Renacentista))
    (Pintor_Epoca (create$ SigloXVI)))

(make-instance JohannesVermeer of Pintor
    (Nombre "Johannes Vermeer")
    (Pintor_Estilo (create$ Barroco))
    (Pintor_Epoca (create$ SigloXVII)))

(make-instance JeanAugusteDominiqueIngres of Pintor
    (Nombre "Jean-Auguste-Dominique Ingres")
    (Pintor_Estilo (create$ Neoclasicismo))
    (Pintor_Epoca (create$ SigloXIX)))

(make-instance GeorgesdeLaTour of Pintor
    (Nombre "Georges de La Tour")
    (Pintor_Estilo (create$ Barroco))
    (Pintor_Epoca (create$ SigloXVII)))

(make-instance GeorgesBraque of Pintor
    (Nombre "Georges Braque")
    (Pintor_Estilo (create$ Expresionismo))
    (Pintor_Epoca (create$ SigloXX)))

;; Definición de los cuadros y estatuas
;Cuadro
(make-instance LaBalsadelaMedusa of Cuadro
    (Titulo "La Balsa de la Medusa")
    (Dimensiones "491 x 716 cm")
    (Anyo 1819)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Tragedia))
    (Cuadro_Epoca (create$ SigloXIX)) 
    (Cuadro_Estilo (create$ Romanticismo))
    (Cuadro_Pintor TheodoreGericault))

;Cuadro
(make-instance LaGioconda of Cuadro
    (Titulo "La Gioconda")
    (Dimensiones "77 x 53 cm")
    (Anyo 1503)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Retrato))
    (Cuadro_Epoca (create$ SigloXV)) 
    (Cuadro_Estilo (create$ Renacimiento))
    (Cuadro_Pintor LeonardoDaVinci))

;Cuadro
(make-instance LasBodasDeCana of Cuadro 
    (Titulo "Las Bodas de Caná")
    (Dimensiones "666 x 990 cm")
    (Anyo 1563)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico))
    (Cuadro_Epoca (create$ SigloXVI)) 
    (Cuadro_Estilo (create$ GriegoHelenistico))
    (Cuadro_Pintor PaoloVeronese))

;Estatua
(make-instance LaVictoriaDeSamotracia of Cuadro 
    (Titulo "La Victoria de Samotracia")
    (Dimensiones "244 cm")
    (Anyo -190) ;- == a.C
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico))
    (Cuadro_Epoca (create$ SigloIIaC)) 
    (Cuadro_Estilo (create$ GriegoHelenistico))
    (Cuadro_Pintor Desconocido))

;Estatua
(make-instance LaVenusDeMilo of Cuadro 
    (Titulo "La Venus de Milo")
    (Dimensiones "202 cm")
    (Anyo 100) ;Como definimos antes de cristo y despues
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico))
    (Cuadro_Epoca (create$ SigloIIaC)) 
    (Cuadro_Estilo (create$ GriegoHelenistico))
    (Cuadro_Pintor Desconocido))

;Cuadro
(make-instance LaCoronacionDeNapoleon of Cuadro 
    (Titulo "La Coronación de Napoleón")
    (Dimensiones "100 x 66 cm")
    (Anyo 1807)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico))
    (Cuadro_Epoca (create$ SigloXIX)) 
    (Cuadro_Estilo (create$ Neoclasicsmo))
    (Cuadro_Pintor JacquesLouisDavid))

;Cuadro
(make-instance LaLibertadGuiandoAlPueblo of Cuadro
    (Titulo "La Libertad Guiando al Pueblo")
    (Dimensiones "260 x 325 cm")
    (Anyo 1830)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloXIX)) 
    (Cuadro_Estilo (create$ Romanticismo))
    (Cuadro_Pintor EugeneDelacroix))

;Estatua
(make-instance LosCaballosDeMarly of Cuadro
    (Titulo "Los Caballos de Marly")
    (Dimensiones "315 cm")
    (Anyo 1739)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloXVIII)) 
    (Cuadro_Estilo (create$ Barroco))
    (Cuadro_Pintor GuillaumeCoustou))

;Estatua
(make-instance ElLeonDeMonzon of Cuadro
    (Titulo "El León de Monzón")
    (Dimensiones "31 cm")
    (Anyo 1100)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloXII))
    (Cuadro_Estilo (create$ Gotico))
    (Cuadro_Pintor Desconocido))

;Cuadro
(make-instance RetratoDeUnaJoven of Cuadro
    (Titulo "Retrato de una Joven")
    (Dimensiones "77 x 53 cm")
    (Anyo 1480)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Retrato))
    (Cuadro_Epoca (create$ SigloXV)) 
    (Cuadro_Estilo (create$ Renacentista))
    (Cuadro_Pintor SandroBotticelli))

;Estatua
(make-instance LosTorosAlados of Cuadro
    (Titulo "Los Toros Alados")
    (Dimensiones "315 cm")
    (Anyo 1739)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloIXaC)) 
    (Cuadro_Estilo (create$ Asirio))
    (Cuadro_Pintor GuillaumeCoustou))

;Estatua
(make-instance ElEsclavoMoribundo of Cuadro
    (Titulo "El Esclavo Moribundo")
    (Dimensiones "229 cm")
    (Anyo 1513)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloXVI)) 
    (Cuadro_Estilo (create$ Renacentista))
    (Cuadro_Pintor MiguelAngelBuonarroti))

;Estatua
(make-instance ElEscribaSentado of Cuadro
    (Titulo "El Escriba Sentado")
    (Dimensiones "53.7 cm")
    (Anyo -2600) ;- == a.C
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloXXVIaC)) 
    (Cuadro_Estilo (create$ Egipcio))
    (Cuadro_Pintor Desconocido))

(make-instance LaEncajera of Cuadro
    (Titulo "La Encajera")
    (Dimensiones "24.5 x 21 cm")
    (Anyo 1669)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloXVII)) 
    (Cuadro_Estilo (create$ Barroco))
    (Cuadro_Pintor JohannesVermeer))

(make-instance GabrielleDeEstreesYSuHermanas of Cuadro
    (Titulo "Gabrielle d'Estrees y su hermana")
    (Dimensiones "96 x 125 cm")
    (Anyo 1594)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloXVI)) 
    (Cuadro_Estilo (create$ Renacentista))
    (Cuadro_Pintor Desconocido))

(make-instance ElBanoTurco of Cuadro
    (Titulo "El baño turco")
    (Dimensiones "110 x 110 cm")
    (Anyo 1862)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloXIX)) 
    (Cuadro_Estilo (create$ Neoclasicismo))
    (Cuadro_Pintor JeanAugusteDominiqueIngres))

(make-instance ElTahur of Cuadro
    (Titulo "El tahúr")
    (Dimensiones "106 x 146 cm")
    (Anyo 1635)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloXVII)) 
    (Cuadro_Estilo (create$ Barroco))
    (Cuadro_Pintor GeorgesdeLaTour))

(make-instance LaMomia of Cuadro
    (Titulo "La momia")
    (Dimensiones "160 cm") ;No se
    (Anyo -1550) ; - == a.C
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloIIaC)) 
    (Cuadro_Estilo (create$ Egipcio))
    (Cuadro_Pintor Desconocido))

(make-instance TheBirds of Cuadro
    (Titulo "The Birds")
    (Dimensiones "501 x 347 cm") ;No se
    (Anyo 1953)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica (create$ Historico)) ;Falta definir las tematicas
    (Cuadro_Epoca (create$ SigloXX)) 
    (Cuadro_Estilo (create$ Expresionismo))
    (Cuadro_Pintor GeorgesBraque))

