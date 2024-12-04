;; Definición de instancias

;; Definición de las tematicas
(definstances tematicas
    (Tragedia of Tematica
        (Nombre "Tragedia")
        (Tematica_Cuadro [LaBalsadelaMedusa]))
    (Retrato of Tematica
        (Nombre "Retrato")
        (Tematica_Cuadro [LaGioconda, RetratoDeUnaJoven]))
    (Historico of Tematica
        (Nombre "Histórico")
        (Tematica_Cuadro [LasBodas, LaCoronacionDeNapoleon, LaLibertadGuiandoAlPueblo, LosCaballosDeMarly, ElLeonDeMonzon, GabrielleDeEstreesYSuHermanas, ElBanoTurco, LaMomia, LaVictoriaDeSamotracia, LaVenusDeMilo, ElEsclavoMoribundo, LaEncajera, ElTahur, LosTorosAlados, ElEscribaSentado, LasAves]))
)

;; Definición de las epocas
(definstances epocas
    (SigloXIX of Epoca
        (Nombre "Siglo XIX")
        (Epoca_Pintor [TheodoreGericault, EugeneDelacroix, JacquesLouisDavid])
        (Epoca_Cuadro [LaBalsadelaMedusa, LaLibertadGuiandoAlPueblo, LaCoronacionDeNapoleon]))
    (SigloXV of Epoca 
        (Nombre "Siglo XV")
        (Epoca_Pintor [LeonardoDaVinci, SandroBotticelli])
        (Epoca_Cuadro [LaGioconda, RetratoDeUnaJoven]))
    (SigloXVI of Epoca
        (Nombre "Siglo XVI")
        (Epoca_Pintor [PaoloVeronese, SandroBotticelli, MiguelAngelBuonarroti])
        (Epoca_Cuadro [LasBodasDeCana, RetratoDeUnaJoven, ElEsclavoMoribundo]))
    (SigloXVII of Epoca
        (Nombre "Siglo XVII")
        (Epoca_Pintor [JohannesVermeer, GeorgesdeLaTour])
        (Epoca_Cuadro [LaEncajera, ElTahur]))
    (SigloXVIII of Epoca
        (Nombre "Siglo XVIII")
        (Epoca_Pintor [GuillaumeCoustou])
        (Epoca_Cuadro [LosCaballosDeMarly]))
    (SigloXII of Epoca
        (Nombre "Siglo XII")
        (Epoca_Cuadro [ElLeonDeMonzon])
        (Epoca_Pintor [Desconocido]))
    (SigloXX of Epoca
        (Nombre "Siglo XX")
        (Epoca_Pintor [GeorgesBraque])
        (Epoca_Cuadro [LasAves]))
    (SigloIIaC of Epoca
        (Nombre "Siglo II a.C")
        (Epoca_Pintor [Desconocido])
        (Epoca_Cuadro [LaVictoria, LaVenusDeMilo, LaMomia])) 
    (SigloIXaC of Epoca
        (Nombre "Siglo IX a.C")
        (Epoca_Pintor [Desconocido])
        (Epoca_Cuadro [LosTorosAlados]))
    (SigloXXVIaC of Epoca
        (Nombre "Siglo XXVI a.C")
        (Epoca_Pintor [Desconocido])
        (Epoca_Cuadro [ElEscribaSentado]))
)

;; Definición de los estilos
(definstances estilos
    (Romanticismo of Estilo
        (Nombre "Romanticismo")
        (Estilo_Pintor [TheodoreGericault, EugeneDelacroix])
        (Estilo_Cuadro [LaBalsadelaMedusa, LaLibertadGuiandoAlPueblo]))
    (Renacimiento of Estilo
        (Nombre "Renacimiento")
        (Estilo_Pintor [LeonardoDaVinci, PaoloVeronese, SandroBotticelli, MiguelAngelBuonarroti])
        (Estilo_Cuadro [LaGioconda, LasBodasDeCana, RetratoDeUnaJoven, ElEsclavoMoribundo]))
    (Renacentista of Estilo
        (Nombre "Renacentista")
        (Estilo_Pintor [SandroBotticelli])
        (Estilo_Cuadro [RetratoDeUnaJoven]))
    (GriegoHelenistico of Estilo
        (Nombre "Griego Helenístico")
        (Estilo_Cuadro [LasBodasDeCana, LaVenusDeMilo, LaVictoriaDeSamotracia])
        (Estilo_Pintor [PaoloVeronese, Desconocido]))
    (Neoclasicismo of Estilo
        (Nombre "Neoclasicismo")
        (Estilo_Pintor [JacquesLouisDavid, JeanAugusteDominiqueIngres])
        (Estilo_Cuadro [LaCoronacionDeNapoleon, ElBanoTurco]))
    (Barroco of Estilo
        (Nombre "Barroco")
        (Estilo_Pintor [GuillaumeCoustou, JohannesVermeer, GeorgesdeLaTour])
        (Estilo_Cuadro [LosCaballosDeMarly, ElTahur, LaEncajera]))
    (Gotico of Estilo
        (Nombre "Gótico")
        (Estilo_Cuadro [ElLeonDeMonzon])
        (Estilo_Pintor [Desconocido]))
    (Asirio of Estilo
        (Nombre "Asirio")
        (Estilo_Cuadro [LosTorosAlados])
        (Estilo_Pintor [Desconocido]))
    (Egipcio of Estilo
        (Nombre "Egipcio")
        (Estilo_Cuadro [ElEscribaSentado, LaMomia])
        (Estilo_Pintor [Desconocido]))
    (Expresionismo of Estilo
        (Nombre "Expresionismo")
        (Estilo_Cuadro [LasAves])
        (Estilo_Pintor [GeorgesBraque]))
)

;; Definición de los pintores
(definstances pintores
    (TheodoreGericault of Pintor 
        (Nombre "Géricault")
        (Pintor_Estilo [Romanticismo])
        (Pintor_Epoca [SigloXIX])
        (Pintor_Cuadro [LaBalsadelaMedusa]))
        (Nacionalidad "Frances")
    (LeonardoDaVinci of Pintor
        (Nombre "Leonardo Da Vinci")
        (Pintor_Estilo [Renacimiento])
        (Pintor_Epoca [SigloXV])
        (Pintor_Cuadro [LaGioconda])
        (Nacionalidad "Italiano"))
    (PaoloVeronese of Pintor
        (Nombre "Paolo Veronese")
        (Pintor_Estilo [Renacimiento])
        (Pintor_Epoca [SigloXVI])
        (Pintor_Cuadro [LasBodasDeCana])
        (Nacionalidad "Italiano"))
    (JacquesLouisDavid of Pintor
        (Nombre "Jacques-Louis David")
        (Pintor_Estilo [Neoclasicismo])
        (Pintor_Epoca [SigloXIX])
        (Pintor_Cuadro [LaCoronacionDeNapoleon])
        (Nacionalidad "Frances"))
    (EugeneDelacroix of Pintor
        (Nombre "Eugène Delacroix")
        (Pintor_Estilo [Romanticismo])
        (Pintor_Epoca [SigloXIX])
        (Pintor_Cuadro [LaLibertadGuiandoAlPueblo])
        (Nacionalidad "Frances"))
    (GuillaumeCoustou of Pintor
        (Nombre "Guillaume Coustou")
        (Pintor_Estilo [Barroco])
        (Pintor_Epoca [SigloXVIII])
        (Pintor_Cuadro [LosCaballosDeMarly, LosTorosAlados])
        (Nacionalidad "Frances"))
    (SandroBotticelli of Pintor
        (Nombre "Sandro Botticelli")
        (Pintor_Estilo [Renacentista])
        (Pintor_Epoca [SigloXV])
        (Pintor_Cuadro [RetratoDeUnaJoven])
        (Nacionalidad "Italiano"))
    (MiguelAngelBuonarroti of Pintor
        (Nombre "Miguel Ángel Buonar")
        (Pintor_Estilo [Renacentista])
        (Pintor_Epoca [SigloXVI])
        (Pintor_Cuadro [ElEsclavoMoribundo])
        (Nacionalidad "Italiano"))
    (JohannesVermeer of Pintor
        (Nombre "Johannes Vermeer")
        (Pintor_Estilo [Barroco])
        (Pintor_Epoca [SigloXVII])
        (Pintor_Cuadro [LaEncajera])
        (Nacionalidad "Holandes"))
    (JeanAugusteDominiqueIngres of Pintor
        (Nombre "Jean-Auguste-Dominique Ingres")
        (Pintor_Estilo [Neoclasicismo])
        (Pintor_Epoca [SigloXIX])
        (Pintor_Cuadro [ElBanoTurco])
        (Nacionalidad "Frances"))
    (GeorgesdeLaTour of Pintor
        (Nombre "Georges de La Tour")
        (Pintor_Estilo [Barroco])
        (Pintor_Epoca [SigloXVII])
        (Pintor_Cuadro [ElTahur])
        (Nacionalidad "Frances"))
    (GeorgesBraque of Pintor
        (Nombre "Georges Braque")
        (Pintor_Estilo [Expresionismo])
        (Pintor_Epoca [SigloXX])
        (Pintor_Cuadro [LasAves])
        (Nacionalidad "Frances"))
    (Desconocido of Pintor
        (Nombre "Desconocido")
        (Pintor_Estilo [GriegoHelenistico, Egipcio])
        (Pintor_Epoca [SigloIIaC, SigloIXaC, SigloXXVIaC])
        (Pintor_Cuadro [LaVictoriaDeSamotracia, LaVenusDeMilo, ElLeonDeMonzon, LaMomia, ElEscribaSentado, GabrielleDeEstreesYSuHermanas])
        (Nacionalidad "Desconocido"))
)

;; Definición de los cuadros y estatuas
;Cuadro

(make-instance LaBalsadelaMedusa of Cuadro
    (Titulo "La Balsa de la Medusa")
    (Dimensiones "491 x 716 cm")
    (Anyo 1819)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Tragedia])
    (Cuadro_Epoca [SigloXIX]) 
    (Cuadro_Estilo [Romanticismo])
    (Cuadro_Pintor [TheodoreGericault]))

;Cuadro
(make-instance LaGioconda of Cuadro
    (Titulo "La Gioconda")
    (Dimensiones "77 x 53 cm")
    (Anyo 1503)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Retrato])
    (Cuadro_Epoca [SigloXV]) 
    (Cuadro_Estilo [Renacimiento])
    (Cuadro_Pintor [LeonardoDaVinci]))

;Cuadro
(make-instance LasBodasDeCana of Cuadro 
    (Titulo "Las Bodas de Caná")
    (Dimensiones "666 x 990 cm")
    (Anyo 1563)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico])
    (Cuadro_Epoca [SigloXVI]) 
    (Cuadro_Estilo [GriegoHelenistico])
    (Cuadro_Pintor [PaoloVeronese]))

;Estatua
(make-instance LaVictoriaDeSamotracia of Cuadro 
    (Titulo "La Victoria de Samotracia")
    (Dimensiones "244 cm")
    (Anyo 190 a.C)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico])
    (Cuadro_Epoca [SigloIIaC]) 
    (Cuadro_Estilo [GriegoHelenistico])
    (Cuadro_Pintor [Desconocido]))

;Estatua
(make-instance LaVenusDeMilo of Cuadro 
    (Titulo "La Venus de Milo")
    (Dimensiones "202 cm")
    (Anyo 100) ;Como definimos antes de cristo y despues
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico])
    (Cuadro_Epoca [SigloIIaC]) 
    (Cuadro_Estilo [GriegoHelenistico])
    (Cuadro_Pintor [Desconocido]))

;Cuadro
(make-instance LaCoronacionDeNapoleon of Cuadro 
    (Titulo "La Coronación de Napoleón")
    (Dimensiones "100 x 66 cm")
    (Anyo 1807)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico])
    (Cuadro_Epoca [SigloXIX]) 
    (Cuadro_Estilo [Neoclasicsmo])
    (Cuadro_Pintor [JacquesLouisDavid]))

;Cuadro
(make-instance LaLibertadGuiandoAlPueblo of Cuadro
    (Titulo "La Libertad Guiando al Pueblo")
    (Dimensiones "260 x 325 cm")
    (Anyo 1830)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloXIX]) 
    (Cuadro_Estilo [Romanticismo])
    (Cuadro_Pintor [EugeneDelacroix]))

;Estatua
(make-instance LosCaballosDeMarly of Cuadro
    (Titulo "Los Caballos de Marly")
    (Dimensiones "315 cm")
    (Anyo 1739)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloXVIII]) 
    (Cuadro_Estilo [Barroco])
    (Cuadro_Pintor [GuillaumeCoustou]))

;Estatua
(make-instance ElLeonDeMonzon of Cuadro
    (Titulo "El León de Monzón")
    (Dimensiones "31 cm")
    (Anyo 1100)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloXII])
    (Cuadro_Estilo [Gotico])
    (Cuadro_Pintor [Desconocido]))

;Cuadro
(make-instance RetratoDeUnaJoven of Cuadro
    (Titulo "Retrato de una Joven")
    (Dimensiones "77 x 53 cm")
    (Anyo 1480)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Retrato])
    (Cuadro_Epoca [SigloXV]) 
    (Cuadro_Estilo [Renacentista])
    (Cuadro_Pintor [SandroBotticelli]))

;Estatua
(make-instance LosTorosAlados of Cuadro
    (Titulo "Los Toros Alados")
    (Dimensiones "315 cm")
    (Anyo 1739)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloIXaC]) 
    (Cuadro_Estilo [Asirio])
    (Cuadro_Pintor [Desconocido]))

;Estatua
(make-instance ElEsclavoMoribundo of Cuadro
    (Titulo "El Esclavo Moribundo")
    (Dimensiones "229 cm")
    (Anyo 1513)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloXVI]) 
    (Cuadro_Estilo [Renacentista])
    (Cuadro_Pintor [MiguelAngelBuonarroti]))

;Estatua
(make-instance ElEscribaSentado of Cuadro
    (Titulo "El Escriba Sentado")
    (Dimensiones "53.7 cm")
    (Anyo 2600 a.C)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloXXVIaC]) 
    (Cuadro_Estilo [Egipcio])
    (Cuadro_Pintor [Desconocido]))

(make-instance LaEncajera of Cuadro
    (Titulo "La Encajera")
    (Dimensiones "24.5 x 21 cm")
    (Anyo 1669)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloXVII]) 
    (Cuadro_Estilo [Barroco])
    (Cuadro_Pintor [JohannesVermeer]))

(make-instance GabrielleDeEstreesYSuHermanas of Cuadro
    (Titulo "Gabrielle d'Estrees y su hermana")
    (Dimensiones "96 x 125 cm")
    (Anyo 1594)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloXVI]) 
    (Cuadro_Estilo [Renacentista])
    (Cuadro_Pintor [Desconocido]))

(make-instance ElBanoTurco of Cuadro
    (Titulo "El baño turco")
    (Dimensiones "110 x 110 cm")
    (Anyo 1862)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloXIX]) 
    (Cuadro_Estilo [Neoclasicismo])
    (Cuadro_Pintor [JeanAugusteDominiqueIngres]))

(make-instance ElTahur of Cuadro
    (Titulo "El tahúr")
    (Dimensiones "106 x 146 cm")
    (Anyo 1635)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloXVII]) 
    (Cuadro_Estilo [Barroco])
    (Cuadro_Pintor [GeorgesdeLaTour]))

(make-instance LaMomia of Cuadro
    (Titulo "La momia")
    (Dimensiones "160 cm") ;No se
    (Anyo 1550 a.C)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloIIaC]) 
    (Cuadro_Estilo [Egipcio])
    (Cuadro_Pintor [Desconocido]))

(make-instance LasAves of Cuadro
    (Titulo "The Birds")
    (Dimensiones "501 x 347 cm") ;No se
    (Anyo 1953)
    (Complejidad 5) ;Falta definir el rango de complejidad
    (Relevancia 3) ;Falta definir la relevancia de los cuadtros
    (Sala 1) ;Falta definir en que sala estan
    (Cuadro_Tematica [Historico]) ;Falta definir las tematicas
    (Cuadro_Epoca [SigloXX]) 
    (Cuadro_Estilo [Expresionismo])
    (Cuadro_Pintor [GeorgesBraque]))
