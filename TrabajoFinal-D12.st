!classDefinition: #TestMiniMiUNQ category: 'Mini-MiUNQ'!
TestCase subclass: #TestMiniMiUNQ
	instanceVariableNames: 'unaCarpeta unArchivoDeTexto miniMiUNQ unaCarpeta2 unUsuario unAdmin unArchivoDeTexto2 unUsuario2 unRoot unAdmin2 unAdminCopia unRootFalso unUsuario3 directorioActualDeUnUsuario laCarpetaRaiz unFiltroPorFechaDeHoy unFiltroPorFechaDeAyer unFiltroPorLaPalabraHola'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/16/2023 08:17:08'!
test_000_InicialmenteUnaCarpetaSeEncuentraVacia
"SetUp - > creado en los tests"


"Assert"
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 0.
	Assert isFalse: unaCarpeta tieneElementos.
	! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/20/2023 19:45:53'!
test_001_UnaCarpetaLeAniadimosUnArchivoDeTexto
"SetUp - > creado en los tests"


"Exercise"
	unaCarpeta agregar: unArchivoDeTexto.

"Assert"
	Assert isTrue: (unaCarpeta contieneA: unArchivoDeTexto).
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 1.
	Assert isTrue: unaCarpeta tieneElementos.
	

! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/20/2023 19:49:58'!
test_002_NoSePuedenAgregarDosElementosConElMismoNombre_EnUnaCarpeta

"SetUp - > creado en los tests"

"Exercise"
	unaCarpeta agregar: unArchivoDeTexto.

"Assert"
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 1.
	Assert isTrue: unaCarpeta tieneElementos.
	Assert isTrue: (unaCarpeta contieneA: unArchivoDeTexto).
	
	Assert should:[unaCarpeta agregar: unArchivoDeTexto2.]  signal: Error withDescription: unaCarpeta mensajeErrorCuandoSeQuiereAgregarElementosConElMismoNombre.! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/16/2023 08:17:24'!
test_003_AUnaCarpetaSeLeAgregaUnaCarpeta

"SetUp - > creado en los tests"

"Exercise"
	unaCarpeta agregar: unaCarpeta2.

"Assert"
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 1.
	Assert isTrue: unaCarpeta tieneElementos.
	Assert isTrue: (unaCarpeta contieneA: unaCarpeta2).! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/16/2023 08:17:30'!
test_004_UnaCarpetaMeSabeDecirSuNombre

"SetUp - > creado en los tests"

"Assert"
	Assert that: unaCarpeta nombre isEqualTo: 'Prueba'.! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/16/2023 08:17:55'!
test_005_AUnaCarpetaSeLePuedeModificarSuNombre
"SetUp - > creado en los tests"


"Exercise"
	unaCarpeta renombrarA: 'NombreNuevo'.

"Assert"
	Assert that: unaCarpeta nombre isNotEqualTo: 'Prueba'. "inicialmente era este el nombre"
	Assert that: unaCarpeta nombre isEqualTo: 'NombreNuevo'. "deberia tener este nuevo nombre"
	! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/16/2023 08:25:18'!
test_006_AUnaCarpetaSeLePuedeAgregarUnArchivoYUnaCarpeta

"SetUp - > creado en los tests"

"Exercise"
	unaCarpeta agregar: unaCarpeta2.
	unaCarpeta agregar: unArchivoDeTexto.

"Assert"
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 2.
	Assert isTrue: unaCarpeta tieneElementos.
	Assert isTrue: (unaCarpeta contieneA: unaCarpeta2).
	Assert isTrue: (unaCarpeta contieneA: unArchivoDeTexto).! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/20/2023 20:01:07'!
test_007_CuandoAUnaCarpetaSeLeAgrega1ArchivoYOtraCarpeta_NoSeLePuedeAgregarLosMismos2Veces

"SetUp - > creado en los tests"

"Exercise"
	unaCarpeta agregar: unaCarpeta2.
	unaCarpeta agregar: unArchivoDeTexto.

"Assert"
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 2.
	Assert that: unaCarpeta cantidadDeElementos isNotEqualTo: 4.
	Assert isTrue: unaCarpeta tieneElementos.
	Assert isTrue: (unaCarpeta contieneA: unaCarpeta2).
	Assert isTrue: (unaCarpeta contieneA: unArchivoDeTexto).
	
	Assert should:[unaCarpeta agregar: unaCarpeta2.]  signal: Error withDescription: unaCarpeta mensajeErrorCuandoSeQuiereAgregarElementosConElMismoNombre.
	
	Assert should:[unaCarpeta agregar: unArchivoDeTexto.]  signal: Error withDescription: unaCarpeta mensajeErrorCuandoSeQuiereAgregarElementosConElMismoNombre.! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'TN 11/27/2023 11:44:08'!
test_008_AUnaCarpetaQueContieneUnSoloArchivo_SeLoPuedeEliminar

"SetUp - > creado en los tests"
	unaCarpeta agregar: unArchivoDeTexto.
	
"Exercise"
	unaCarpeta eliminarElemento: unArchivoDeTexto.
	
"Assert"  
	Assert isFalse: unaCarpeta tieneElementos. "La carpeta solo tiene ese archivo"
	Assert isFalse: (unaCarpeta contieneA: unArchivoDeTexto).
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 0.
	
! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'TN 11/28/2023 10:18:33'!
test_009_AUnaCarpetaQueNoTieneArchivos_NoSeLoPuedeEliminar

"SetUp - > creado en los tests"

	
"Exercise"
	
	
"Assert"  
	Assert isFalse: unaCarpeta tieneElementos. 
	Assert isFalse: (unaCarpeta contieneA: unArchivoDeTexto).
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 0.
	
	Assert should:[unaCarpeta eliminarElemento: unArchivoDeTexto]  signal: Error withDescription: unaCarpeta mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado.
	
! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'TN 11/27/2023 11:45:18'!
test_010_AUnaCarpetaQueTieneUnaCarpetaVacia_SeLaPuedeEliminar

"SetUp - > creado en los tests"
	unaCarpeta  agregar: unaCarpeta2.
	
"Exercise"
	unaCarpeta eliminarElemento: unaCarpeta2.
	
	
"Assert"  
	Assert isFalse: unaCarpeta tieneElementos. 
	Assert isFalse: (unaCarpeta contieneA: unaCarpeta2 ).
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 0.


! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/29/2023 10:24:42'!
test_011_AUnaCarpetaQueTieneUnaCarpetaQueNoEstaVacia_NoSeLaPuedeEliminar

"SetUp - > creado en los tests"
	unaCarpeta2 agregar: unArchivoDeTexto. 
	unaCarpeta  agregar: unaCarpeta2.
	"la carpeta a eliminar tiene un archivo como minimo -> no podria ser eliminada"
	
"Assert"  
	Assert isTrue: unaCarpeta tieneElementos. 
	Assert isTrue: (unaCarpeta contieneA: unaCarpeta2).
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 1. "asserts de la carpeta 1"
	
	Assert isTrue: unaCarpeta2 tieneElementos. 
	Assert isTrue: (unaCarpeta2 contieneA: unArchivoDeTexto).
	Assert that: unaCarpeta2 cantidadDeElementos isEqualTo: 1. "asserts de la carpeta 2"
	
	Assert should:[unaCarpeta eliminarElemento: unaCarpeta2]  signal: Error withDescription: unaCarpeta mensajeErrorCuandoLaCarpetaAEliminarTieneUnElemento.

! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'TN 11/28/2023 10:18:39'!
test_012_SiSeQuiereEliminarUnArchivoDeUnaCarpeta_SiNoSeEncuentraEnLaCarpeta_NoSePuedeEliminar

"SetUp - > creado en los tests"
	
	unaCarpeta agregar: unaCarpeta2.
	"el archivo a eliminar es unArchivoDeTexto -> no estaria en la carpeta unaCarpeta
	pero en simultaneo, la carpeta puede tener otros elementos."
	
"Assert"  
	Assert isTrue: unaCarpeta tieneElementos. 
	Assert isFalse: (unaCarpeta contieneA: unArchivoDeTexto).
	Assert isTrue: (unaCarpeta contieneA: unaCarpeta2).
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 1.
	
	Assert should:[unaCarpeta eliminarElemento: unArchivoDeTexto]  signal: Error withDescription: unaCarpeta mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado.
	
! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/29/2023 10:23:32'!
test_013_SiSeQuiereEliminarUnaCarpetaDeUnaCarpeta_SiNoSeEncuentraEnLaCarpeta_NoSePuedeEliminar

"SetUp - > creado en los tests"
	
	unaCarpeta agregar: unArchivoDeTexto.
	"el elemento a eliminar es unaCarpeta2 -> no estaria en la carpeta unaCarpeta
	pero en simultaneo, la carpeta puede tener otros elementos, como unArchivoDeTexto"
	
"Assert"  
	Assert isTrue: unaCarpeta tieneElementos. 
	Assert isTrue: (unaCarpeta contieneA: unArchivoDeTexto).
	Assert isFalse: (unaCarpeta contieneA: unaCarpeta2).
	Assert that: unaCarpeta cantidadDeElementos isEqualTo: 1.
	
	Assert should:[unaCarpeta eliminarElemento: unaCarpeta2]  signal: Error withDescription: unaCarpeta mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado .
	
! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/20/2023 19:23:10'!
test_014_AUnaCarpetaNoSeLePuedeAgregarASiMisma
"SetUp - > creado en los tests"
	

	
"Assert"  
	
	Assert isFalse: (unaCarpeta contieneA: unaCarpeta).
	Assert should: [ unaCarpeta agregar: unaCarpeta]  signal: Error withDescription: unaCarpeta mensajeErrorNoPuedeAgregarseASiMismo.
! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/29/2023 12:03:49'!
test_015_UnaCarpetaBaseSabeSiEsRaizONo

"SetUp - > creado en los tests"

"Exercise"

	
"Assert"
	
	Assert isFalse: (unaCarpeta esRaiz).
	Assert isTrue: (laCarpetaRaiz esRaiz).
! !

!TestMiniMiUNQ methodsFor: 'tests - CarpetaBase' stamp: 'JR 11/29/2023 12:04:19'!
test_016_AUnaCarpetaRaiz_No_SeLePuedeModificarElNombre

"SetUp - > creado en los tests"

"Exercise"

	
"Assert"
	Assert isTrue: (laCarpetaRaiz esRaiz).
	Assert should: [laCarpetaRaiz renombrarA: 'NoPosible'] signal: Error withDescription: laCarpetaRaiz mensajeErrorCuandoSeIntentaRenombrarALaCarpetaRaiz.
! !


!TestMiniMiUNQ methodsFor: 'tests - ArchivoDeTexto' stamp: 'TN 11/28/2023 10:28:10'!
test_000_InicialmenteUnArchivoDeTexto_NoTieneContenido
|stringVacio|
"SetUp - > creado en los tests"

"Exercise"
	

"Assert"
	stringVacio := ' '.
	Assert that: unArchivoDeTexto nombre isEqualTo: 'archivoPrueba'.
	Assert that: unArchivoDeTexto contenidoDelArchivo isEqualTo: stringVacio.
	! !

!TestMiniMiUNQ methodsFor: 'tests - ArchivoDeTexto' stamp: 'JR 11/20/2023 19:33:30'!
test_001_UnArchivoMeSabeDecirSuNombre

"SetUp - > creado en los tests"


"Assert"
	Assert that: unArchivoDeTexto nombre isEqualTo: 'archivoPrueba'.
	! !

!TestMiniMiUNQ methodsFor: 'tests - ArchivoDeTexto' stamp: 'JR 11/20/2023 19:34:00'!
test_002_AUnArchivoSeLePuedeModificarSuNombre

"SetUp - > creado en los tests"

"Exercise"
	unArchivoDeTexto renombrarA: 'NombreNuevo'.

"Assert"
	Assert that: unArchivoDeTexto nombre isNotEqualTo: 'archivoPrueba'. "inicialmente era este el nombre"
	Assert that: unArchivoDeTexto nombre isEqualTo: 'NombreNuevo'. "deberia tener este nuevo nombre"
	! !

!TestMiniMiUNQ methodsFor: 'tests - ArchivoDeTexto' stamp: 'JR 11/20/2023 20:08:59'!
test_003_AUnArchivoSeLePuedeModificarSuContenido
|contenidoModificado|
"SetUp - > creado en los tests"

"Exercise"
	
	unArchivoDeTexto reemplazarContenidoA: 'texto modificado'.

"Assert"
	contenidoModificado := 'texto modificado'.
	Assert that: unArchivoDeTexto contenidoDelArchivo isEqualTo: contenidoModificado.
	! !


!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/22/2023 17:54:13'!
test_000_UnUsuarioSabeCualEsSuNombre
"SetUp - > creado en los tests"


"Exercise"
	
"Assert" 
	Assert that: unUsuario nombreDeUsuario  isEqualTo: 'Nacho'. 
	Assert that: unUsuario2 nombreDeUsuario  isEqualTo: 'Nacho'. 
	Assert that: unUsuario3 nombreDeUsuario  isEqualTo: 'Tomi'. ! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/22/2023 17:55:29'!
test_001_UnUsuarioSabeCualEsSuContrasenia

"SetUp - > creado en los tests"


"Exercise"
	
"Assert" 
	Assert that: unUsuario contraseña  isEqualTo: 'Nacho1353'.
	Assert that: unUsuario2 contraseña  isEqualTo:  'contrasenia'.
	Assert that: unUsuario3 contraseña  isEqualTo:  'aguanteboquita'.
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'TN 11/27/2023 11:56:26'!
test_002_UnUsuarioPuedeModificarseConLaAutorizacionDeUnAdminlElNombreSiSeEncuentraDadoDeAltaEnElSistema

"SetUp - > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	
"Exercise"
	unUsuario cambiarNombreA: 'Augusto' conAutorizacionDe: unRoot enElSistema: miniMiUNQ.
	"Un usuario se puede modificar su nombre en el sistema siempre y cuando un SystemAdmin lo haga por el."
	
"Assert" 
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: unUsuario nombreDeUsuario isEqualTo: 'Augusto'.
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/28/2023 14:17:13'!
test_003_UnUsuario_No_PuedeModificarselElNombreSi_No_SeEncuentraDadoDeAltaEnElSistema
"SetUp - > creado en los tests"
	"El usuario no tiene que estar dado de alta"
	
"Exercise"
	
	
"Assert" 
	Assert isFalse: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert should: [unUsuario cambiarNombreA: 'Augusto' conAutorizacionDe: unRoot enElSistema: miniMiUNQ] signal: Error withDescription: miniMiUNQ mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema.
	
	Assert that: unUsuario nombreDeUsuario isNotEqualTo: 'Augusto'.
	"Para corroborar que no lo pudo modificar"
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/28/2023 19:10:50'!
test_004_UnUsuarioPuedeModificarseLaContraseniaConLaAutorizacionDeUnAdminSiSeEncuentraDadoDeAltaEnElSistema

"SetUp - > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	
"Exercise"
	unUsuario cambiarContraseniaA: 'contraseniaNueva' conAutorizacionDe: unRoot enElSistema: miniMiUNQ.
	"Un usuario se puede modificar su contrasenia en el sistema siempre y cuando un SystemAdmin lo haga por el."
	
"Assert" 
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: unUsuario contraseña isEqualTo: 'contraseniaNueva'.
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/28/2023 19:11:37'!
test_005_UnUsuario_No_PuedeModificarseLaContraseniaSi_No_SeEncuentraDadoDeAltaEnElSistema

"SetUp - > creado en los tests"
	"El usuario no tiene que estar dado de alta"
	
"Exercise"
	
	
"Assert" 
	Assert isFalse: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert should: [unUsuario cambiarContraseniaA: 'contraseniaNueva' conAutorizacionDe: unRoot enElSistema: miniMiUNQ] signal: Error withDescription: miniMiUNQ mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema.
	
	Assert that: unUsuario contraseña isNotEqualTo: 'contraseniaNueva'.
	"Para corroborar que no la pudo modificar"
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:46:24'!
test_006_unUsuarioIniciaSesionDentroMiniMiUNQ

"SetUp - > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ .
	
"Exercise"
	unUsuario iniciarSesionEn: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: unUsuario estadoDeLaSesion.! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:46:19'!
test_007_unUsuarioQue_No_SeEncuentraDadoDeAlta_No_PuedeIniciarSesionDentroMiniMiUNQ

"SetUp- > creado en los tests"

"Exercise"

"Assert"
	Assert isFalse: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 0.
	Assert isFalse: unUsuario estadoDeLaSesion.
	Assert should: [unUsuario iniciarSesionEn: miniMiUNQ] signal: Error withDescription: miniMiUNQ mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema.! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:46:16'!
test_008_unUsuarioDentroDelSistema_ConSesionIniciada_CreaUnArchivoDeTexto

"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	
"Exercise"
	unUsuario crearArchivoConNombre: 'Archivo1' ConTexto: 'Hola buenos dias'.
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert isTrue: (unUsuario tieneAlElementoConNombre: 'Archivo1').! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:46:12'!
test_009_unUsuarioQue_No_InicioSesionDentroDelSistema_No_PuedeCrearUnArchivo

"Exercise"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.

"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isFalse: (unUsuario estadoDeLaSesion). 
	Assert isFalse: (unUsuario tieneAlElementoConNombre: 'Archivo1').
	Assert should:[unUsuario crearArchivoConNombre: 'Archivo1' ConTexto: 'Hola buenos dias'] signal: Error withDescription: unUsuario mensajeDeErrorDeSesionNoIniciada. 
	
	"No hace falta verificar que se haya dado de alta el usuario, ya que solo modifican elementos aquellos usuarios con sesion iniciada (para iniciar sesion tengo que estar dado de alta previamente)"
	! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:46:06'!
test_010_unUsuarioDentroDelSistema_ConSesionIniciada_ModificaElNombreDeUnArchivoQueSeEncuentraEnSuDirectorio

"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	unUsuario crearArchivoConNombre: 'Archivo1' ConTexto: 'Hola buenos dias'.
	
"Exercise"
	unUsuario modificarElNombreDelElemento: 'Archivo1' ANombre: 'Nombre nuevo'.
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert isTrue: (unUsuario tieneAlElementoConNombre: 'Nombre nuevo').! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:46:00'!
test_011_unUsuarioDentroDelSistemaModificaElContenidoDeUnArchivoQueSeEncuentraEnSuDirectorio

"SetUp"
	| unArchivo |
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	unUsuario crearArchivoConNombre: 'Archivo1' ConTexto: 'Hola buenos dias'.
	unArchivo := unUsuario elementoEnDirectorioActualConNombre: 'Archivo1'.
	
"Exercise"
	unUsuario modificarElContenidoDelArchivo: 'Archivo1' AContenido: 'Hola buenas noches'.
	"Modifica al archivo que tiene ese nombre dentro del directorio actual"
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert isTrue: (unUsuario tieneAlElementoConNombre: 'Archivo1').
	Assert that: unArchivo contenidoDelArchivo isEqualTo: 'Hola buenas noches'.! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:54'!
test_012_unUsuarioDentroDelSistema_No_PuedeModificarElContenidoDeUnArchivoQue_No_Existe
"SetUp- > creado en los tests"

"Exercise"
	| directorioActual |
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	directorioActual := unUsuario posicionActual.
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert should: [unUsuario modificarElContenidoDelArchivo: 'Archivo1' AContenido: 'Hola buenas noches'] signal: Error withDescription: 	directorioActual mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:47'!
test_013_unUsuarioDentroDelSistema_No_PuedeModificarElNombreDeUnArchivoQue_No_Existe
"SetUp- > creado en los tests"

"Exercise"
	| directorioActual |
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	directorioActual := unUsuario posicionActual.
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert should: [unUsuario modificarElNombreDelElemento: 'Archivo1' ANombre: 'Nombre nuevo'] signal: Error withDescription: 	directorioActual mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:41'!
test_014_unUsuario_QueInicioSesion_PuedeEliminarUnArchivoDeTextoExistenteEnElSistema

"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	unUsuario crearArchivoConNombre: 'Elemento1' ConTexto: 'Hola buenos dias'.
	
"Exercise"
	unUsuario eliminarElementoConNombre: 'Elemento1'.
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert isFalse: (unUsuario tieneAlElementoConNombre: 'Nombre nuevo').! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:37'!
test_015_unUsuarioQue_No_CreoUnArchivoDeTexto_No_PuedeEliminarlo
"SetUp- > creado en los tests"

"Exercise"
	| directorioActual |
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	directorioActual := unUsuario posicionActual.
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert should: [unUsuario eliminarElementoConNombre: 'Elemento1'] signal: Error withDescription: 
	directorioActual mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado. ! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:33'!
test_016_unUsuarioQue_No_InicioSesion_No_PuedeEliminarUnArchivoDeTexto
"SetUp- > creado en los tests"

"Assert"
	Assert isFalse: (unUsuario estadoDeLaSesion). 
	Assert should: [unUsuario eliminarElementoConNombre: 'Elemento1'] signal: Error withDescription: 
	unUsuario mensajeDeErrorDeSesionNoIniciada. ! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:29'!
test_017_unUsuarioDentroDelSistema_ConSesionIniciada_CreaUnaCarpeta

"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	
"Exercise"
	unUsuario crearCarpetaConNombre: 'Carpeta1'.
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert isTrue: (unUsuario tieneAlElementoConNombre: 'Carpeta1').! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:25'!
test_018_unUsuarioQue_No_InicioSesionDentroDelSistema_No_PuedeCrearUnaCarpeta
"SetUp- > creado en los tests"

"Exercise"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.

"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isFalse: (unUsuario estadoDeLaSesion). 
	Assert isFalse: (unUsuario tieneAlElementoConNombre: 'Carpeta1').
	Assert should:[unUsuario crearCarpetaConNombre: 'Carpeta1'] signal: Error withDescription: unUsuario mensajeDeErrorDeSesionNoIniciada. 
	
	"No hace falta verificar que se haya dado de alta el usuario, ya que solo modifican elementos aquellos usuarios con sesion iniciada (para iniciar sesion tengo que estar dado de alta previamente)"
	! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:21'!
test_019_unUsuarioDentroDelSistema_ConSesionIniciada_ModificaElNombreDeUnACarpetaQueSeEncuentraEnSuDirectorio
"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	unUsuario crearCarpetaConNombre: 'Carpeta1'.
	
"Exercise"
	unUsuario modificarElNombreDelElemento: 'Carpeta1' ANombre: 'Carpeta Nombre Nuevo'.
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert isTrue: (unUsuario tieneAlElementoConNombre: 'Carpeta Nombre Nuevo').! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:14'!
test_020_unUsuarioDentroDelSistema_No_PuedeModificarElNombreDeUnaCarpeta_Que_NoExiste
"SetUp- > creado en los tests"

"Exercise"
	| directorioActual |
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	directorioActual := unUsuario posicionActual.
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert should: [unUsuario modificarElNombreDelElemento: 'CarpetaInexistente' ANombre: 'Nombre nuevo'] signal: Error withDescription: 	directorioActual mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado.! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:10'!
test_021_unUsuario_QueInicioSesion_PuedeEliminarUnaCarpetaExistenteEnElSistema
"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	unUsuario crearCarpetaConNombre: 'CarpetaAEliminar'.
	
"Exercise"
	unUsuario eliminarElementoConNombre: 'CarpetaAEliminar'.
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert isFalse: (unUsuario tieneAlElementoConNombre: 'CarpetaAEliminar').! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:06'!
test_022_unUsuarioQue_No_CreoUnaCarpeta_No_PuedeEliminarlo
"SetUp- > creado en los tests"

"Exercise"
	| directorioActual |
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	directorioActual := unUsuario posicionActual.
	
"Assert"
	Assert isTrue:(miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert isTrue: (unUsuario estadoDeLaSesion). 
	Assert should: [unUsuario eliminarElementoConNombre: 'CarpetaAEliminar'] signal: Error withDescription: 
	directorioActual mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado. ! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:45:01'!
test_023_unUsuarioQue_No_InicioSesion_No_PuedeEliminarUnaCarpeta
"SetUp- > creado en los tests"

"Assert"
	Assert isFalse: (unUsuario estadoDeLaSesion). 
	Assert should: [unUsuario eliminarElementoConNombre: 'Carpeta'] signal: Error withDescription: 
	unUsuario mensajeDeErrorDeSesionNoIniciada. ! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/28/2023 18:38:28'!
test_024_CuandoAUnUsuarioSeLoDaDeAlta_SeLeCrea_SuDirectorio

"SetUp- > creado en los tests"
	
"Exercise"

	unRoot daDeAltaAlUsuario: unUsuario2 enElSistema: miniMiUNQ.
	
"Assert"	
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.  "Se asume que no hay otros usuarios, para el test."
	Assert isTrue:( miniMiUNQ tieneComoUsuarioA: unUsuario2).
	
	Assert that: unUsuario2 posicionActual nombre isEqualTo: 'Directorio Raiz'.
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 13:54:21'!
test_025_CuandoUnUsuarioCierraSesion_SeDesloggeaDelSistema

"SetUp- > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario2 enElSistema: miniMiUNQ.
	unUsuario2 iniciarSesionEn: miniMiUNQ.
	unUsuario2 crearCarpetaConNombre: 'unaCarpetaNoRaiz'.
	unUsuario2 irAlDirectorioConNombre: 'unaCarpetaNoRaiz'.
	
"Exercise"
	unUsuario2 cerrarSesion.
	
	
"Assert"	
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.  "Se asume que no hay otros usuarios, para el test."
	Assert isTrue:( miniMiUNQ tieneComoUsuarioA: unUsuario2).
	
	Assert isFalse: unUsuario2 estadoDeLaSesion.
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:48:08'!
test_026_CuandoUnUsuarioCierraSesion_YSeVuelveALoggear_ElEstadoDelDirectorioSigueComoLoDejo
| directorioActual |
"SetUp- > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario2 enElSistema: miniMiUNQ.
	unUsuario2 iniciarSesionEn: miniMiUNQ.
	unUsuario2 crearCarpetaConNombre: 'CarpetaInicio-CierreSesionTest'.
	
"Exercise"
	unUsuario2 cerrarSesion.
	unUsuario2 iniciarSesionEn: miniMiUNQ.
	
"Assert"	
	directorioActual := unUsuario2 posicionActual.
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.  "Se asume que no hay otros usuarios, para el test."
	Assert isTrue:( miniMiUNQ tieneComoUsuarioA: unUsuario2).
	Assert isTrue: unUsuario2 estadoDeLaSesion.
	Assert isTrue: (directorioActual contieneAlElementoConNombre: 'CarpetaInicio-CierreSesionTest').
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 11:44:49'!
test_027_UnUsuario_No_PuedeModificarseLaContraseniaSi_No_SeEncuentraConLaSesionIniciada

"SetUp - > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario3 enElSistema: miniMiUNQ.
	"Esta dado de alta pero sin iniciar sesion"
	
"Exercise"
	
	
"Assert" 
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario3).
	Assert isFalse:(unUsuario3 estadoDeLaSesion ).
	Assert should: [unUsuario3 cambiarContraseniaA: 'contraseniaNueva' conAutorizacionDe: unRoot enElSistema: miniMiUNQ] signal: Error withDescription: unUsuario3 mensajeDeErrorDeSesionNoIniciada. 
	
	Assert that: unUsuario3 contraseña isNotEqualTo: 'contraseniaNueva'.
	"Para corroborar que no la pudo modificar"
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 12:35:25'!
test_028_UnUsuarioQueIniciaSesion_NoPuedeVolverAIniciarSesion

"SetUp - > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario3 enElSistema: miniMiUNQ.
	
"Exercise"
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	
"Assert" 
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario3).
	Assert isTrue:(unUsuario3 estadoDeLaSesion ).
	Assert should: [unUsuario3 iniciarSesionEn: miniMiUNQ] signal: Error withDescription: unUsuario3 mensajeDeErrorCuandoSeIntentaIniciarSesionSinHaberCerradoSesion.
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 13:40:51'!
test_029_CuandoUnUsuarioIniciaSesion_SeEncuentraEnElDirectorioRaiz

"SetUp - > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario3 enElSistema: miniMiUNQ.
	
"Exercise"
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	
"Assert" 
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario3).
	Assert isTrue: (unUsuario3 estadoDeLaSesion).
	Assert isTrue: (unUsuario3 posicionActual esRaiz).
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 14:07:03'!
test_030_CuandoUnUsuarioCierraSesion_VuelveALaRaizAutomaticamente

"SetUp - > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario3 enElSistema: miniMiUNQ.
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	unUsuario3 crearCarpetaConNombre: 'carpetaNoRaiz'.
	unUsuario3 irAlDirectorioConNombre: 'carpetaNoRaiz'.
	
"Exercise"
	unUsuario3 cerrarSesion.
	
"Assert" 
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario3).
	Assert isFalse: (unUsuario3 estadoDeLaSesion).
	Assert isTrue: (unUsuario3 posicionActual esRaiz).
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Usuario' stamp: 'JR 11/29/2023 14:09:29'!
test_031_CuandoUnUsuarioCierraSesion_No_PuedeVolverACerrarlaDeNuevo

"SetUp - > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario3 enElSistema: miniMiUNQ.
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	
"Exercise"
	unUsuario3 cerrarSesion.
	
"Assert" 
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario3).
	Assert isFalse: (unUsuario3 estadoDeLaSesion).
	Assert isTrue: (unUsuario3 posicionActual esRaiz).
	Assert should: [unUsuario3 cerrarSesion.] signal: Error withDescription: unUsuario3 mensajeErrorNoSePuedeCerrarLaSesionSiYaEstaCerrada.
	
	
! !


!TestMiniMiUNQ methodsFor: 'tests - SystemAdmin' stamp: 'JR 11/29/2023 11:04:06'!
test_000_UnSystemAdminSabeCualEsSuNombre
"SetUp - > creado en los tests"


"Exercise"
	
"Assert"
	Assert that: unRoot nombreDelAdmin  isEqualTo: 'Joaco'. 
	Assert that: unAdmin nombreDelAdmin  isEqualTo: 'Nacho'.  
	Assert that: unAdmin2 nombreDelAdmin  isEqualTo: 'Tomi'.               

	
	! !

!TestMiniMiUNQ methodsFor: 'tests - SystemAdmin' stamp: 'JR 11/29/2023 11:04:14'!
test_001_UnSystemAdminSabeCualEsSuContrasenia
"SetUp - > creado en los tests"


"Exercise"
	
"Assert"
	Assert that: unRoot contrasenia isEqualTo: '231'. 
	Assert that: unAdmin contrasenia isEqualTo: '123'.  
	Assert that: unAdmin2 contrasenia isEqualTo: '321'.               

	
	! !


!TestMiniMiUNQ methodsFor: 'tests - MiniMiUNQSystem' stamp: 'JR 11/20/2023 20:13:56'!
test_000_InicialmenteNoHayUsuariosRegistrados_EnMiniMiUNQ
"SetUp - > creado en los tests"


"Assert"
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 0.
	Assert isFalse: miniMiUNQ tieneUsuarios.
	! !

!TestMiniMiUNQ methodsFor: 'tests - MiniMiUNQSystem' stamp: 'JR 11/28/2023 14:25:51'!
test_001_UnUsuarioQueNoEstaDadoDeAltaNoPuedeCrearUnaCarpeta
"SetUp - > creado en los tests"

"Exercise"
	
"Assert"
	Assert isFalse: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 0. "Asumo por el test que no hay otros usuarios".
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - MiniMiUNQSystem' stamp: 'JR 11/29/2023 11:04:31'!
test_002_InicialmenteCuandoSeCreaElSistema_ElRootSeEncuentraEnElSistema
"SetUp - > creado en los tests"


"Exercise"
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unRoot).                         
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 1.
	
	"El root como administra y nace con el sistema ya se encuentra registrado" 
	
	! !


!TestMiniMiUNQ methodsFor: 'tests - Rutas' stamp: 'JR 11/29/2023 11:46:39'!
test_001_unUsuarioPuedeIrAUnaCarpeta_Dentro_DelDirectorioActual_SiExiste
| nombreDelDirectorioActual |
"SetUp- > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario  enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	
"Exercise"
	unUsuario crearCarpetaConNombre: 'CarpetaAIr'.
	unUsuario irAlDirectorioConNombre: 'CarpetaAIr'.
	
"Assert"
	nombreDelDirectorioActual := (unUsuario posicionActual nombre).
	Assert isTrue: unUsuario estadoDeLaSesion.
	Assert isTrue: (miniMiUNQ  tieneComoUsuarioA: unUsuario).
	
	Assert that: nombreDelDirectorioActual isNotEqualTo: 'Directorio Raiz'.
	Assert that: nombreDelDirectorioActual isEqualTo: 'CarpetaAIr'.
	
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Rutas' stamp: 'JR 11/29/2023 11:46:34'!
test_002_unUsuario_No_PuedeIrAUnaCarpeta_DentroDelDirectorioActual_Si_No_Existe
| nombreDelDirectorioActual |
"SetUp- > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario  enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	
"Exercise"
	
	
"Assert"
	nombreDelDirectorioActual := unUsuario posicionActual nombre.
	Assert isTrue: unUsuario estadoDeLaSesion.
	Assert isTrue: (miniMiUNQ  tieneComoUsuarioA: unUsuario).
	Assert that:  nombreDelDirectorioActual isEqualTo: 'Directorio Raiz'.
	Assert that:  nombreDelDirectorioActual isNotEqualTo: 'CarpetaInexistente'.
	
	Assert should: [unUsuario irAlDirectorioConNombre: 'CarpetaInexistente'] signal: Error withDescription: unaCarpeta mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado.
	
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Rutas' stamp: 'JR 11/29/2023 11:46:29'!
test_003_unUsuario_No_PuedeMoversePorElDirectorioActual_SiEstaDadoDeAlta_Pero_NoTieneLaSesionIniciada
| nombreDelDirectorioActual |
"SetUp- > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario  enElSistema: miniMiUNQ.
	
"Exercise"
	
	
"Assert"
	nombreDelDirectorioActual := unUsuario posicionActual nombre.
	Assert isFalse: unUsuario estadoDeLaSesion.
	Assert isTrue: (miniMiUNQ  tieneComoUsuarioA: unUsuario).
	Assert that:  nombreDelDirectorioActual isEqualTo: 'Directorio Raiz'.
	Assert that:  nombreDelDirectorioActual isNotEqualTo: 'CarpetaInexistente'.
	
	Assert should: [unUsuario irAlDirectorioConNombre: 'CarpetaInexistente'] signal: Error withDescription: unUsuario mensajeDeErrorDeSesionNoIniciada.
	
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Rutas' stamp: 'JR 11/29/2023 12:04:47'!
test_004_LaCarpetaRaiz_No_TieneUnaCarpetaAnterior

"SetUp- > creado en los tests"
	
	
"Exercise"
	
	
"Assert"

	Assert should: [laCarpetaRaiz carpetaAnterior ] signal: Error withDescription: laCarpetaRaiz mensajeErrorUnaCarpetaRaizNoTieneCarpetaAnterior.

	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Rutas' stamp: 'JR 11/29/2023 12:29:45'!
test_005_UnaCarpeta_DentroDeUnaCarpeta_SabeCualEsSuCarpetaAnterior

"SetUp- > creado en los tests"
	
	
"Exercise"
	laCarpetaRaiz agregar: unaCarpeta.
	
"Assert"
	Assert that: unaCarpeta carpetaAnterior isEqualTo: laCarpetaRaiz.
	
	

	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Rutas' stamp: 'JR 11/29/2023 12:39:30'!
test_006_UnaCarpetaDentro_DeUnaCarpetaQueNoEsLaRaiz_SabeCualEsSuCarpetaAnterior

"SetUp- > creado en los tests"
	
	
"Exercise"
	laCarpetaRaiz agregar: unaCarpeta.
	unaCarpeta agregar: unaCarpeta2.
	
"Assert"
	Assert that: unaCarpeta carpetaAnterior isEqualTo: laCarpetaRaiz.
	Assert that: unaCarpeta2 carpetaAnterior isEqualTo: unaCarpeta.
	
	

	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Rutas' stamp: 'JR 11/29/2023 12:59:43'!
test_007_unUsuarioQueFueAUnaCarpeta_PuedeVolverALaCarpetaAnterior

"SetUp- > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario  enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	
	unUsuario crearCarpetaConNombre: 'CarpetaDondeFui'.
	unUsuario irAlDirectorioConNombre: 'CarpetaDondeFui'.

"Exercise"

	unUsuario volverALaCarpetaAnterior.
	
"Assert"
	Assert isTrue: unUsuario estadoDeLaSesion.
	Assert isTrue: (miniMiUNQ  tieneComoUsuarioA: unUsuario).
	
	Assert that: (unUsuario posicionActual nombre) isNotEqualTo: 'CarpetaDondeFui'.
	Assert that: (unUsuario posicionActual nombre) isEqualTo: 'Directorio Raiz'.
	Assert isTrue: (unUsuario posicionActual esRaiz).
	
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Rutas' stamp: 'JR 11/29/2023 13:37:03'!
test_008_unUsuarioQueViajoAMasDeUnaCarpeta_PuedeVolverALaRaizDirectamente

"SetUp- > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario  enElSistema: miniMiUNQ.
	unUsuario iniciarSesionEn: miniMiUNQ.
	
	unUsuario crearCarpetaConNombre: 'CarpetaDondeVoy1'.
	unUsuario irAlDirectorioConNombre: 'CarpetaDondeVoy1'.
	unUsuario crearCarpetaConNombre: 'CarpetaDondeVoyDentroDe1'. "me encuentro dentro de CarpetaDondeFui1"
	unUsuario irAlDirectorioConNombre: 'CarpetaDondeVoyDentroDe1'.

"Exercise"
	unUsuario volverALaCarpetaRaiz.
	
"Assert"
	Assert isTrue: unUsuario estadoDeLaSesion.
	Assert isTrue: (miniMiUNQ  tieneComoUsuarioA: unUsuario).
	
	Assert that: (unUsuario posicionActual nombre) isNotEqualTo: 'CarpetaDondeVoy1'.
	Assert that: (unUsuario posicionActual nombre) isNotEqualTo: 'CarpetaDondeVoyDentroDe1'.
	Assert that: (unUsuario posicionActual nombre) isEqualTo: 'Directorio Raiz'.
	Assert isTrue: (unUsuario posicionActual esRaiz).
	
	
	! !


!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'JR 11/23/2023 14:52:23'!
test_018_UnRootPuedeModificarElNombreDeUnUsuarioQueSeEncuentraEnElSistema
"SetUp - > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	
"Exercise"
	unRoot leModificaElNombreAlUsuario: unUsuario alNombre: 'NombreNuevo' enElSistema: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: unUsuario nombreDeUsuario isEqualTo: 'NombreNuevo'.
	
	"
	tiene que estar en el sistema - una validacion -> si no esta en el sistema no se le puede cambiar nada nyc
	cambiar el nombre
	el nombre ti
	"
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'JR 11/23/2023 14:56:49'!
test_019_UnRootPuedeModificarLaConstraseniaDeUnUsuarioQueSeEncuentraEnElSistema
"SetUp - > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	
"Exercise"
	unRoot leModificaLaContraseniaAlUsuario: unUsuario aLaContrasenia: 'ContraseniaNueva' enElSistema: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: unUsuario contraseña isEqualTo: 'ContraseniaNueva'.
	
	"
	tiene que estar en el sistema - una validacion -> si no esta en el sistema no se le puede cambiar nada nyc
	cambiar el nombre
	el nombre ti
	"
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'JR 11/23/2023 15:04:48'!
test_020_UnRootPuedeModificarElNombreDeUnAdmin
"SetUp - > creado en los tests"
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	
"Exercise"
	unRoot leModificaElNombreAlAdmin: unAdmin alNombre: 'NombreNuevoAdmin' enElSistema: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).
	Assert that: unAdmin nombreDelAdmin isEqualTo: 'NombreNuevoAdmin'.
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'JR 11/23/2023 15:21:45'!
test_021_UnRootPuedeModificarLaConstraseniaDeUnAdmin
"SetUp - > creado en los tests"
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	
"Exercise"
	unRoot leModificaLaContraseniaAlAdmin: unAdmin aLaContrasenia: 'ContraseniaNuevaAdmin' enElSistema: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).
	Assert that: unAdmin contrasenia isEqualTo: 'ContraseniaNuevaAdmin'.
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'JR 11/23/2023 15:25:55'!
test_022_UnAdminPuedeModificarElNombreDeUnUsuarioQueSeEncuentraEnElSistema

"SetUp - > creado en los tests"
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	unAdmin daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	
"Exercise"
	unAdmin leModificaElNombreAlUsuario: unUsuario alNombre: 'NombreNuevo' enElSistema: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).
	Assert that: unUsuario nombreDeUsuario isEqualTo: 'NombreNuevo'.
	
	"
	tiene que estar en el sistema - una validacion -> si no esta en el sistema no se le puede cambiar nada nyc
	cambiar el nombre
	el nombre ti
	"
	
	
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'JR 11/23/2023 15:28:12'!
test_023_UnAdminPuedeModificarLaConstraseniaDeUnUsuarioQueSeEncuentraEnElSistema
"SetUp - > creado en los tests"
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	unAdmin daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	
"Exercise"
	unAdmin leModificaLaContraseniaAlUsuario: unUsuario aLaContrasenia: 'ContraseniaNueva' enElSistema: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unRoot).
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	
	Assert that: unUsuario contraseña isEqualTo: 'ContraseniaNueva'.
	
	"
	tiene que estar en el sistema - una validacion -> si no esta en el sistema no se le puede cambiar nada nyc
	cambiar el nombre
	el nombre ti
	"
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'TN 11/23/2023 15:39:16'!
test_024_UnAdmin_No_PuedeModificarElNombreDeUnAdmin
"SetUp - > creado en los tests"
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	unRoot daDeAltaAlAdmin: unAdmin2 enElSistema: miniMiUNQ.
	
"Exercise"
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin2).
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).
	Assert that: unAdmin2 nombreDelAdmin isEqualTo: 'Tomi'.
	Assert should: [unAdmin leModificaElNombreAlAdmin: unAdmin2 alNombre: 'NombreNuevo' enElSistema: miniMiUNQ] signal: Error withDescription: unAdmin mensajeErrorCuandoUnAdminNoTienePrivilegios.
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'TN 11/23/2023 15:40:56'!
test_025_UnAdmin_No_PuedeModificarLaContraseniaDeUnAdmin
"SetUp - > creado en los tests"
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	unRoot daDeAltaAlAdmin: unAdmin2 enElSistema: miniMiUNQ.
	
"Exercise"
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin2).
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).
	Assert that: unAdmin2 contrasenia isEqualTo: '321'.
	Assert should: [unAdmin leModificaLaContraseniaAlAdmin: unAdmin2 aLaContrasenia: '145' enElSistema: miniMiUNQ] signal: Error withDescription: unAdmin mensajeErrorCuandoUnAdminNoTienePrivilegios.
	
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'TN 11/27/2023 12:19:15'!
test_026_UnRoot_No_PuedeModificarElNombreDeUnAdmin_SiNoEstaDadoDeAlta
"SetUp - > creado en los tests"
	
"Exercise"
	
"Assert"
	Assert isFalse: (miniMiUNQ tieneComoAdministradorA: unAdmin).
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 1.
	Assert should: [unRoot leModificaElNombreAlAdmin: unAdmin alNombre: 'NombreNuevoAdmin' enElSistema: miniMiUNQ] signal: Error withDescription: miniMiUNQ mensajeErrorCuandoElAdministradorNoSeEncuentraEnElSistema.
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'TN 11/27/2023 12:19:20'!
test_027_UnRoot_No_PuedeModificarLaContraseniaDeUnAdmin_SiNoEstaDadoDeAlta
"SetUp - > creado en los tests"
	
"Exercise"
	
"Assert"
	Assert isFalse: (miniMiUNQ tieneComoAdministradorA: unAdmin).
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 1. "El Root es el unico administrador en el sistema."
	Assert should: [unRoot leModificaLaContraseniaAlAdmin: unAdmin aLaContrasenia: '123' enElSistema: miniMiUNQ ] signal: Error withDescription: miniMiUNQ mensajeErrorCuandoElAdministradorNoSeEncuentraEnElSistema.
	

	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'TN 11/27/2023 12:17:29'!
test_028_UnSystemAdmin_No_PuedeModificarElNombreDeUnUsuario_SiNoEstaDadoDeAlta
"SetUp - > creado en los tests"
	
"Exercise"
	
"Assert"
	Assert isFalse: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 0.
	Assert should: [unRoot leModificaElNombreAlUsuario: unUsuario alNombre: 'Naguel' enElSistema: miniMiUNQ] signal: Error withDescription: miniMiUNQ mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema.

	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'TN 11/27/2023 12:17:36'!
test_029_UnSystemAdmin_No_PuedeModificarLaContraseniaDeUnUsuario_SiNoEstaDadoDeAlta
"SetUp - > creado en los tests"
	
"Exercise"
	
"Assert"
	Assert isFalse: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 0.
	Assert should: [unRoot leModificaLaContraseniaAlUsuario: unUsuario aLaContrasenia: '456' enElSistema: miniMiUNQ] signal: Error withDescription: miniMiUNQ mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema.

	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'JR 11/29/2023 09:50:46'!
test_030_UnRootPuedeModificarseElNombreASiMismo
"SetUp - > creado en los tests"
	"El root ya exite por default en el sistema"
	
"Exercise"
	unRoot leModificaElNombreAlAdmin: unRoot alNombre: 'NombreNuevoRoot' enElSistema: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unRoot).
	Assert that: unRoot nombreDelAdmin isEqualTo: 'NombreNuevoRoot'.
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'JR 11/29/2023 09:51:43'!
test_031_UnRootPuedeModificarseLaContraseniaASiMismo
"SetUp - > creado en los tests"
	"El root ya exite por default en el sistema"
	
"Exercise"
	unRoot leModificaLaContraseniaAlAdmin: unRoot  aLaContrasenia: 'ContraNuevaRoot' enElSistema: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unRoot).
	Assert that: unRoot contrasenia isEqualTo: 'ContraNuevaRoot'.
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'JR 11/29/2023 10:01:50'!
test_032_UnAdminPuedeModificarseElNombreASiMismo
"SetUp - > creado en los tests"
	
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
"Exercise"
	unAdmin leModificaElNombreAlAdmin: unAdmin alNombre: 'NombreNuevoAdmin' enElSistema: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).
	Assert that: unAdmin nombreDelAdmin isEqualTo: 'NombreNuevoAdmin'.
	
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'JR 11/29/2023 10:04:09'!
test_033_UnAdminPuedeModificarseLaContraseniaASiMismo
"SetUp - > creado en los tests"
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	
"Exercise"
	unAdmin leModificaLaContraseniaAlAdmin: unAdmin aLaContrasenia: 'ContraseniaNueva' enElSistema: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).
	Assert that: unAdmin contrasenia isEqualTo: 'ContraseniaNueva'.
	
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Modificacion' stamp: 'JR 11/29/2023 10:44:28'!
test_034_UnSystemAdminNoPuedeModificarElNombreDelUsuario_PorUnoYaExistente 
"SetUp - > creado en los tests"
	unRoot daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unRoot daDeAltaAlUsuario: unUsuario3 enElSistema: miniMiUNQ.
	
"Exercise"
	
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario).
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario3). "El nombre del unUsuario3 es Tomi"
	Assert that: (miniMiUNQ cantidadDeUsuarios ) isEqualTo:2.
	
	Assert should: [unRoot leModificaElNombreAlUsuario: unUsuario  alNombre: 'Tomi' enElSistema: miniMiUNQ] signal: Error withDescription: miniMiUNQ mensajeErrorCuandoExisteUsuarioConElMismoNombre.
	
	
	! !


!TestMiniMiUNQ methodsFor: 'tests - Eliminacion' stamp: 'JR 11/29/2023 09:38:56'!
test_001_UnAdminNoPuedeEliminarUnAdmin
"SetUp - > creado en los tests"

	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	unAdmin daDeAltaAlAdmin: unAdmin2 enElSistema: miniMiUNQ.
"Exercise"
		
	
"Assert"  
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 3.                  
	
	Assert should:[unAdmin daDeBajaAlAdmin: unAdmin2 enElSistema: miniMiUNQ]  signal: Error withDescription: unAdmin mensajeErrorCuandoUnAdminNoTienePrivilegios.
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Eliminacion' stamp: 'JR 11/29/2023 09:39:01'!
test_002_UnAdminNoPuedeEliminarUnUsuario
"SetUp - > creado en los tests"


"Exercise"
		
	unAdmin daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	
	
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario). 
	Assert isTrue: miniMiUNQ tieneUsuarios.		                             
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1. 
	
	Assert should:[unAdmin daDeBajaAlUsuario: unUsuario enElSistema: miniMiUNQ]  signal: Error withDescription: unAdmin mensajeErrorCuandoUnAdminNoTienePrivilegios.
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Eliminacion' stamp: 'JR 11/29/2023 09:40:04'!
test_003_UnAdminNoPuedeEliminarUnRoot
"SetUp - > creado en los tests"

	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
"Exercise"
		
	
"Assert"  
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 2.                  
	
	Assert should:[unAdmin daDeBajaAlAdmin: unRoot enElSistema: miniMiUNQ]  signal: Error withDescription: unAdmin mensajeErrorCuandoUnAdminNoTienePrivilegios.
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Eliminacion' stamp: 'JR 11/29/2023 09:41:13'!
test_004_UnRootPuedeEliminarAUnAdmin
"SetUp - > creado en los tests"
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	"Para poder dar de baja, y cumplir el test, tiene que estar en el sistema"

"Exercise"
	
	unRoot daDeBajaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unRoot).
	Assert isFalse: (miniMiUNQ tieneComoAdministradorA: unAdmin).                    
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 1. 
	! !

!TestMiniMiUNQ methodsFor: 'tests - Eliminacion' stamp: 'JR 11/22/2023 17:19:26'!
test_005_UnRootPuedeEliminarUnUsuario
"SetUp - > creado en los tests"


"Exercise"
		
	unAdmin daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	unRoot daDeBajaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	
"Assert"
	Assert isFalse: (miniMiUNQ tieneComoUsuarioA: unUsuario). 
	Assert isFalse: miniMiUNQ tieneUsuarios.		                             
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 0. 
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Eliminacion' stamp: 'JR 11/29/2023 09:47:11'!
test_006_UnRootNoPuedeEliminarAUnRoot_ASiMismo
"SetUp - > creado en los tests"
	"unRoot ya existe en el sistema por default."
	"No se puede eliminar a un root (a si mismo) porque el sistema se quedaria sin root"
"Exercise"
		
	
	
"Assert"
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 1.                  
	
	Assert should:[unRoot daDeBajaAlAdmin: unRoot enElSistema: miniMiUNQ]  signal: Error withDescription: unAdmin mensajeErrorCuandoSeIntentaEliminarAlRootDelSistema.
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Eliminacion' stamp: 'JR 11/29/2023 09:48:10'!
test_007_UnRootNoPuedeEliminarAUnAdministradorQueNoSeEncuentraEnElSistema
"SetUp - > creado en los tests"

"Exercise"
		
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unRoot).
	Assert isFalse: (miniMiUNQ tieneComoAdministradorA: unAdmin).                    
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 1. 
	
	Assert should:[unRoot daDeBajaAlAdmin: unAdmin enElSistema: miniMiUNQ.]  signal: Error withDescription: miniMiUNQ mensajeErrorCuandoElAdministradorNoSeEncuentraEnElSistema.

	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Eliminacion' stamp: 'JR 11/29/2023 09:48:17'!
test_008_UnRootNoPuedeEliminarAUnUsuarioQueNoSeEncuentraEnElSistema
"SetUp - > creado en los tests"

"Exercise"
		
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unRoot).           
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 1. 
	
	Assert should:[unRoot daDeBajaAlUsuario: unUsuario enElSistema: miniMiUNQ.]  signal: Error withDescription: 
	miniMiUNQ mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema.

	
	! !


!TestMiniMiUNQ methodsFor: 'tests - Alta' stamp: 'JR 11/20/2023 20:25:33'!
test_001_CuandoSeCreaUnUsuario_NoNecesariamenteEstaDadoDeAltaEnSistema.
"SetUp - > creado en los tests"



"Assert"
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 0.
	Assert isFalse: miniMiUNQ tieneUsuarios.
	Assert isFalse: (miniMiUNQ tieneComoUsuarioA: unUsuario). "Es un usuario existente, pero no esta dado de alta"
													"Puede haber 2 usuarios con el mismo nombre, solo se da de alta uno."
	! !

!TestMiniMiUNQ methodsFor: 'tests - Alta' stamp: 'JR 11/22/2023 17:48:21'!
test_002_CuandoUnUsuarioSeQuiereDarDeAlta_UnAdmin_LoDaDeAltaEnElSistema
"SetUp - > creado en los tests"


"Exercise"
		
	unAdmin daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario). 
	Assert isTrue: miniMiUNQ tieneUsuarios.		                             
	Assert that: miniMiUNQ  cantidadDeUsuarios isEqualTo: 1. ! !

!TestMiniMiUNQ methodsFor: 'tests - Alta' stamp: 'JR 11/29/2023 10:35:14'!
test_003_CuandoUnUsuarioSeQuiereDarDeAltaConUnNombreYaDadoDeAlta_UnAdminLoRechaza
"SetUp - > creado en los tests"


"Exercise"
		
	unAdmin daDeAltaAlUsuario: unUsuario enElSistema: miniMiUNQ.
	
	
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoUsuarioA: unUsuario). 
	Assert isTrue: miniMiUNQ tieneUsuarios.		                             
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1. 
	
	Assert should:[unAdmin daDeAltaAlUsuario: unUsuario2 enElSistema: miniMiUNQ.]  signal: Error withDescription: miniMiUNQ mensajeErrorCuandoExisteUsuarioConElMismoNombre.! !

!TestMiniMiUNQ methodsFor: 'tests - Alta' stamp: 'JR 11/22/2023 15:25:26'!
test_006_UnRootPuedeDarDeAltaAUnAdmin
"SetUp - > creado en los tests"


"Exercise"
		
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).                         
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 2.
	"El root como administra y nace con el sistema ya se encuentra registrado" 
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Alta' stamp: 'JR 11/22/2023 15:28:39'!
test_007_UnAdminPuedeDarDeAltaAUnAdmin
"SetUp - > creado en los tests"


"Exercise"
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	"El root tiene que dar de alta al admin para que pueda hacer cosas"
	
	unAdmin daDeAltaAlAdmin: unAdmin2 enElSistema: miniMiUNQ.
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin2).                         
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 3.
	"El root como administra y nace con el sistema ya se encuentra registrado" 
	
	! !

!TestMiniMiUNQ methodsFor: 'tests - Alta' stamp: 'JR 11/29/2023 10:48:42'!
test_011_CuandoUnAdminSeQuiereDarDeAltaConUnNombreYaDadoDeAlta_UnRootLoRechaza
"SetUp - > creado en los tests"


"Exercise"
		
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).                             
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 2. 
	
	Assert should:[unRoot daDeAltaAlAdmin: unAdminCopia enElSistema: miniMiUNQ.]  signal: Error withDescription: miniMiUNQ mensajeErrorCuandoExisteSysAdminConElMismoNombre.! !

!TestMiniMiUNQ methodsFor: 'tests - Alta' stamp: 'JR 11/29/2023 10:48:46'!
test_012_CuandoUnAdminSeQuiereDarDeAltaConUnNombreYaDadoDeAlta_UnAdminLoRechaza
"SetUp - > creado en los tests"


"Exercise"
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	"El admin para poder hacer cambios en el sistema tiene que estar dado de alta"
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).                             
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 2. 
	
	Assert should:[unAdmin daDeAltaAlAdmin: unAdminCopia enElSistema: miniMiUNQ.]  signal: Error withDescription: miniMiUNQ mensajeErrorCuandoExisteSysAdminConElMismoNombre.! !

!TestMiniMiUNQ methodsFor: 'tests - Alta' stamp: 'JR 11/22/2023 15:57:44'!
test_013_CuandoUnRootQuiereDarDeAltaAOtroRoot_EsRechazado
"SetUp - > creado en los tests"


"Exercise"
	
	
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unRoot).                             
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 1. 
	
	Assert should:[unRoot daDeAltaAlAdmin: unRootFalso enElSistema: miniMiUNQ.]  signal: Error withDescription: miniMiUNQ mensajeDeErrorCuandoSeIntentaDarDeAltaAOtroRoot.! !

!TestMiniMiUNQ methodsFor: 'tests - Alta' stamp: 'JR 11/22/2023 16:00:48'!
test_014_CuandoUnAdminQuiereDarDeAltaAOtroRoot_EsRechazado
"SetUp - > creado en los tests"


"Exercise"
	
	unRoot daDeAltaAlAdmin: unAdmin enElSistema: miniMiUNQ.
	"Para que un admin pueda hacer modificaciones tiene que estar en el sistema"
	
"Assert"
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unRoot).
	Assert isTrue: (miniMiUNQ tieneComoAdministradorA: unAdmin).                    
	Assert that: miniMiUNQ cantidadDeAdministradores isEqualTo: 2. 
	
	Assert should:[unAdmin daDeAltaAlAdmin: unRootFalso enElSistema: miniMiUNQ.]  signal: Error withDescription: miniMiUNQ mensajeDeErrorCuandoSeIntentaDarDeAltaAOtroRoot.! !


!TestMiniMiUNQ methodsFor: 'setUp/tearDown' stamp: 'JR 12/1/2023 11:32:50'!
setUp

"Carpetas"
	unaCarpeta := Carpeta conNombre: 'Prueba'.
	unaCarpeta2 := Carpeta conNombre: 'OtraCarpeta'.
	laCarpetaRaiz := CarpetaRaiz conNombre: 'Directorio Raiz'.
	
"Archivos"
	unArchivoDeTexto := ArchivoDeTexto conNombre: 'archivoPrueba' yContenido: ' '.
	unArchivoDeTexto2 := ArchivoDeTexto conNombre: 'archivoPrueba' yContenido: 'Hola buenos dias'.
	
	
"Sistema UNQ"
	miniMiUNQ := MiniMiUNQSystem new.
	
	
"SystemAdmins"
	unAdmin := Admin conNombre: 'Nacho' yContraseña: '123'.
	unAdminCopia := Admin conNombre: 'Nacho' yContraseña: 'falsoUNADMIN'.
	unAdmin2 := Admin conNombre: 'Tomi' yContraseña: '321'.
	unRoot := miniMiUNQ rootDelSistema.
	unRootFalso := Root new.
	
"Usuario" 
	unUsuario := Usuario conNombre: 'Nacho' yContraseña: 'Nacho1353'.
	unUsuario2 := Usuario conNombre: 'Nacho' yContraseña: 'contrasenia'.
	unUsuario3 :=  Usuario conNombre: 'Tomi' yContraseña: 'aguanteboquita'.

"Filtros"
	unFiltroPorFechaDeHoy := FiltroPorFecha conCondicion: FixedGregorianDate today.
	unFiltroPorFechaDeAyer := FiltroPorFecha conCondicion: FixedGregorianDate yesterday.
	unFiltroPorLaPalabraHola := FiltroPorPalabra conCondicion: 'hola'.



! !


!TestMiniMiUNQ methodsFor: 'tests - Filtros' stamp: 'TN 11/30/2023 10:52:53'!
test_000_UnUsuarioFiltraDentroDelDirectorioActualPorFecha

"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario3  enElSistema: miniMiUNQ.
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	unUsuario3 crearCarpetaConNombre: 'CarpetaABuscar'.
	unUsuario3 crearArchivoConNombre: 'Archivo' ConTexto: 'texto'.
	
"Exercise"
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorFechaDeHoy.

"Assert"
	Assert isTrue: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'CarpetaABuscar').
	Assert isTrue: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'Archivo').
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Filtros' stamp: 'TN 11/30/2023 11:37:45'!
test_001_UnUsuarioFiltraDentroDelDirectorioActualPorPalabra

"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario3  enElSistema: miniMiUNQ.
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	unUsuario3 crearCarpetaConNombre: 'Carpeta a buscar'.
	unUsuario3 crearArchivoConNombre: 'Archivo hola buenos dias' ConTexto: 'Texto'.
	
"Exercise"
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorLaPalabraHola. 
	"Este filtro por palabras filtra los elementos que en titulo tengan la palabra hola"

"Assert"
	Assert isTrue: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'Archivo hola buenos dias').
	Assert isFalse: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'Carpeta a buscar').
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Filtros' stamp: 'TN 11/30/2023 10:53:53'!
test_002_UnUsuarioFiltraPorPalabraYPorFechaDentroDelDirectorioActual

"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario3  enElSistema: miniMiUNQ.
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	unUsuario3 crearCarpetaConNombre: 'Carpeta a buscar'.
	unUsuario3 crearArchivoConNombre: 'Archivo hola buenos dias' ConTexto: 'Texto'.
	unUsuario3 crearArchivoConNombre: 'Archivo hola buenas noches' ConTexto: 'Texto'.
	
"Exercise"
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorLaPalabraHola. "Se queda con los archivos que contengan la palabra hola"
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorFechaDeHoy. "Se queda con los archivos que sean del dia de hoy"

"Assert"
	Assert isTrue: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'Archivo hola buenos dias').
	Assert isTrue: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'Archivo hola buenas noches').
	Assert isFalse: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'Carpeta a buscar').
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Filtros' stamp: 'TN 11/30/2023 10:52:36'!
test_003_UnUsuarioFiltraDentroDelDirectorioActualPorFechaDeAyer

"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario3  enElSistema: miniMiUNQ.
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	unUsuario3 crearCarpetaConNombre: 'CarpetaABuscar'.
	unUsuario3 crearArchivoConNombre: 'Archivo' ConTexto: 'texto'.
	
"Exercise"
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorFechaDeAyer.

"Assert"
	Assert isFalse: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'CarpetaABuscar').
	Assert isFalse: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'Archivo').
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Filtros' stamp: 'TN 11/30/2023 11:47:56'!
test_004_UnUsuarioFiltraUnaCarpetaVacia_NoSeObtieneNada

"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario3  enElSistema: miniMiUNQ.
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	
"Exercise"
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorFechaDeHoy.

"Assert"
	Assert that: unUsuario3 elementosFiltrados cantidadDeElementos isEqualTo: 0.
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Filtros' stamp: 'TN 11/30/2023 12:06:31'!
test_005_UnUsuarioQueViajaEntreDirectorios_FiltraLaCarpetaALaQueViajo_ObtieneLosElementosFiltrados

"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario3  enElSistema: miniMiUNQ.
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	unUsuario3 crearCarpetaConNombre: 'CarpetaABuscar'.
	
	unUsuario3 irAlDirectorioConNombre: 'CarpetaABuscar'.
	unUsuario3 crearCarpetaConNombre: 'Carpeta dentro de carpetaABuscar'.
	unUsuario3 crearArchivoConNombre: 'Archivo hola dentro de carpetaABuscar' ConTexto: 'Hola buenas tardes'.

"Exercise"
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorFechaDeHoy.
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorLaPalabraHola.

"Assert"
	Assert isTrue: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'Archivo hola dentro de carpetaABuscar').
	Assert isFalse: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'Carpeta dentro de carpetaABuscar').
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Filtros' stamp: 'TN 11/30/2023 12:15:23'!
test_006_UnUsuarioFiltraUnaCarpeta_VuelveALaCarpetaAnteriorYLaFiltra_DevuelveLosElementosFiltradosDeEsaCarpeta

|elementosFiltradosDeLaPrimerCarpeta|
"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario3  enElSistema: miniMiUNQ.
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	unUsuario3 crearCarpetaConNombre: 'CarpetaABuscar'.
	unUsuario3 crearArchivoConNombre: 'hola mundo' ConTexto: 'Mi primer objeto'.
	
	unUsuario3 irAlDirectorioConNombre: 'CarpetaABuscar'.
	unUsuario3 crearCarpetaConNombre: 'Carpeta dentro de carpetaABuscar'.
	unUsuario3 crearArchivoConNombre: 'Archivo hola dentro de carpetaABuscar' ConTexto: 'Hola buenas tardes'.
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorFechaDeHoy.
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorLaPalabraHola.	
	
	elementosFiltradosDeLaPrimerCarpeta := unUsuario3 elementosFiltrados.

"Exercise"
	unUsuario3 volverALaCarpetaAnterior. 
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorLaPalabraHola.	
	
"Assert"
	Assert that: elementosFiltradosDeLaPrimerCarpeta isNotEqualTo: unUsuario3 elementosFiltrados.
	Assert isTrue: (elementosFiltradosDeLaPrimerCarpeta contieneAlElementoConNombre: 'Archivo hola dentro de carpetaABuscar').
	Assert isFalse: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'Archivo hola dentro de carpetaABuscar').
	Assert isTrue: (unUsuario3 elementosFiltrados contieneAlElementoConNombre: 'hola mundo').
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Filtros' stamp: 'TN 11/30/2023 12:18:28'!
test_007_UnUsuarioQueNoInicioSesionNoPuedeAplicarLosFiltros
"SetUp"
	unRoot daDeAltaAlUsuario: unUsuario3  enElSistema: miniMiUNQ.
	
"Exercise"

"Assert"
	Assert that: miniMiUNQ cantidadDeUsuarios isEqualTo: 1.
	Assert should: [unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorFechaDeHoy] signal: Error withDescription: 
	unUsuario3 mensajeDeErrorDeSesionNoIniciada 
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Filtros' stamp: 'TN 11/30/2023 20:04:24'!
test_008_CuandoUnUsuarioCierraSesioYLaVuelveAIniciarSeLeReinicianLosElementosFiltrados
"SetUp"
	|elementosFiltradosAntesDeCerrarSesion|
	unRoot daDeAltaAlUsuario: unUsuario3  enElSistema: miniMiUNQ.
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	unUsuario3 crearCarpetaConNombre: 'Carpeta a buscar'.
	unUsuario3 crearArchivoConNombre: 'Archivo hola buenos dias' ConTexto: 'Texto'.
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorLaPalabraHola. 
	elementosFiltradosAntesDeCerrarSesion := unUsuario3 elementosFiltrados. 

"Exercise"
	unUsuario3 cerrarSesion.
	unUsuario3 iniciarSesionEn: miniMiUNQ.

"Assert"
	Assert that: elementosFiltradosAntesDeCerrarSesion isNotEqualTo: unUsuario3 elementosFiltrados. 
	
	
	
! !

!TestMiniMiUNQ methodsFor: 'tests - Filtros' stamp: 'TN 11/30/2023 12:40:58'!
test_009_UnUsuarioPuedeEliminarLosFiltrosSiQuiere
"SetUp"
	|elementosFiltradosAntesDeEliminarlos carpetaActualSinFiltrar |
	unRoot daDeAltaAlUsuario: unUsuario3  enElSistema: miniMiUNQ.
	unUsuario3 iniciarSesionEn: miniMiUNQ.
	unUsuario3 crearCarpetaConNombre: 'Carpeta a buscar'.
	unUsuario3 crearArchivoConNombre: 'Archivo hola buenos dias' ConTexto: 'Texto'.
	unUsuario3 filtrarElementosAplicandoElFiltro: unFiltroPorLaPalabraHola. 
	elementosFiltradosAntesDeEliminarlos := unUsuario3 elementosFiltrados. 
	carpetaActualSinFiltrar := unUsuario3 posicionActual. 

"Exercise"
	unUsuario3 eliminarFiltros.

"Assert"
	Assert that: elementosFiltradosAntesDeEliminarlos isNotEqualTo: unUsuario3 elementosFiltrados. 
	Assert that: unUsuario3 elementosFiltrados cantidadDeElementos isEqualTo: carpetaActualSinFiltrar cantidadDeElementos.
	
	
	
	
! !


!classDefinition: #ArchivoDeTexto category: 'Mini-MiUNQ'!
Object subclass: #ArchivoDeTexto
	instanceVariableNames: 'nombreArchivo contenidoDelArchivo origen fechaDeCreacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!ArchivoDeTexto methodsFor: 'datos' stamp: 'JR 11/20/2023 19:40:11'!
contenidoDelArchivo
	
	^contenidoDelArchivo.! !

!ArchivoDeTexto methodsFor: 'datos' stamp: 'TN 11/29/2023 21:16:15'!
fechaDeCreacion
	^ fechaDeCreacion.! !

!ArchivoDeTexto methodsFor: 'datos' stamp: 'JR 11/15/2023 16:53:23'!
nombre

	^nombreArchivo.! !


!ArchivoDeTexto methodsFor: 'modificaciones' stamp: 'JR 11/29/2023 12:15:45'!
asignarComoOrigenA: carpetaOrigen

	origen := carpetaOrigen.! !

!ArchivoDeTexto methodsFor: 'modificaciones' stamp: 'JR 11/20/2023 20:11:29'!
reemplazarContenidoA: contenidoNuevoString
	
	contenidoDelArchivo := contenidoNuevoString.
	"contenidoNuevo tiene que ser un string".! !

!ArchivoDeTexto methodsFor: 'modificaciones' stamp: 'JR 11/15/2023 16:54:20'!
renombrarA: nuevoNombre
	
	nombreArchivo := nuevoNombre.! !


!ArchivoDeTexto methodsFor: 'validaciones' stamp: 'JR 11/29/2023 10:14:32'!
validarCondicionParaSerEliminadoDentroDe: unaCarpeta

	unaCarpeta validarCondicionSiLaCarpetaTieneDentroA: self.! !


!ArchivoDeTexto methodsFor: 'initialization' stamp: 'TN 11/29/2023 21:16:57'!
conNombre: unNombre yContenido: contenido

	nombreArchivo := unNombre .
	contenidoDelArchivo := contenido .
	fechaDeCreacion := FixedGregorianDate today.! !

!ArchivoDeTexto methodsFor: 'initialization' stamp: 'JR 11/20/2023 19:40:51'!
initialize

	contenidoDelArchivo := ''.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ArchivoDeTexto class' category: 'Mini-MiUNQ'!
ArchivoDeTexto class
	instanceVariableNames: ''!

!ArchivoDeTexto class methodsFor: 'as yet unclassified' stamp: 'TN 11/28/2023 09:54:17'!
conNombre: unNombre yContenido: contenidoDelArchivo

	^self new conNombre: unNombre yContenido: contenidoDelArchivo.! !


!classDefinition: #CarpetaBase category: 'Mini-MiUNQ'!
Object subclass: #CarpetaBase
	instanceVariableNames: 'contenidoDeLaCarpeta nombreCarpeta origen fechaDeCreacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!CarpetaBase methodsFor: 'mensajesDeError' stamp: 'JR 11/29/2023 10:24:57'!
mensajeErrorCuandoLaCarpetaAEliminarTieneUnElemento
	
	^'Ups!! La carpeta a ser eliminada tiene elementos adentro'
	
	"Para eliminar una carpeta no debe tener archivos"! !

!CarpetaBase methodsFor: 'mensajesDeError' stamp: 'TN 11/28/2023 10:18:09'!
mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado
	
	^'Ups!! El elemento no se encuentra en la carpeta'
	! !

!CarpetaBase methodsFor: 'mensajesDeError' stamp: 'JR 11/20/2023 19:50:37'!
mensajeErrorCuandoSeQuiereAgregarElementosConElMismoNombre
	
	^'Ups!! No se pueden agregar elementos con el mismo nombre'.! !

!CarpetaBase methodsFor: 'mensajesDeError' stamp: 'JR 11/20/2023 19:21:01'!
mensajeErrorNoPuedeAgregarseASiMismo
	
	^'Ups!! No se puede agregar una carpeta adentro de si misma'.! !

!CarpetaBase methodsFor: 'mensajesDeError' stamp: 'JR 11/28/2023 20:23:54'!
mensajeErrorUnaCarpetaRaizNoTieneCarpetaAnterior
	
	^'Ups!! Una carpeta raiz no tiene una carpeta madre - ES LA RAIZ'.! !


!CarpetaBase methodsFor: 'validaciones' stamp: 'JR 11/20/2023 19:59:25'!
validarCondicionCuandoSeQuiereAgregarUnElementoConNombrePreexistente: unElemento 
	
	 ^(contenidoDeLaCarpeta anySatisfy: [:elemento | elemento nombre = unElemento nombre] ) ifTrue:[self error: self mensajeErrorCuandoSeQuiereAgregarElementosConElMismoNombre].! !

!CarpetaBase methodsFor: 'validaciones' stamp: 'JR 11/20/2023 19:26:45'!
validarCondicionDeNoEstarAgregandoUnaCarpetaASiMisma: unElemento 
	
	^(self == unElemento ) ifTrue:[self error: self mensajeErrorNoPuedeAgregarseASiMismo].! !

!CarpetaBase methodsFor: 'validaciones' stamp: 'JR 11/29/2023 10:24:48'!
validarCondicionParaEliminarLaCarpetaContieneAlgunElemento: carpetaAEliminar

	^(carpetaAEliminar tieneElementos ) ifTrue:[self error: self mensajeErrorCuandoLaCarpetaAEliminarTieneUnElemento].! !

!CarpetaBase methodsFor: 'validaciones' stamp: 'TN 11/27/2023 11:41:30'!
validarCondicionParaSerEliminadoDentroDe: unaCarpeta.

	unaCarpeta validarCondicionSiLaCarpetaTieneDentroA: self.
	unaCarpeta validarCondicionParaEliminarLaCarpetaContieneAlgunElemento: self. 
	
	! !

!CarpetaBase methodsFor: 'validaciones' stamp: 'JR 11/29/2023 11:57:46'!
validarCondicionQueNoSoyLaRaiz
	^(self esRaiz ) ifTrue:[self error: self mensajeErrorUnaCarpetaRaizNoTieneCarpetaAnterior].! !

!CarpetaBase methodsFor: 'validaciones' stamp: 'JR 11/29/2023 10:21:39'!
validarCondicionSiLaCarpetaTieneDentroA: elementoAEliminar 
	
	^(self contieneA: elementoAEliminar ) ifFalse:[self error: self mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado].! !


!CarpetaBase methodsFor: 'modificaciones' stamp: 'TN 11/28/2023 12:13:42'!
modificarElContenidoDelElemento: nombreDelArchivo AContenido: contenidoNuevo 
	
	| elementoAModificar |
	elementoAModificar := self elementoConNombre: nombreDelArchivo.
	elementoAModificar reemplazarContenidoA: contenidoNuevo. ! !

!CarpetaBase methodsFor: 'modificaciones' stamp: 'TN 11/28/2023 11:56:02'!
modificarElNombreDelElemento: nombreAModificar ANombre: nombreNuevo 
	
	| elementoAModificar |
	elementoAModificar := self elementoConNombre: nombreAModificar.
	elementoAModificar renombrarA: nombreNuevo.
	 ! !

!CarpetaBase methodsFor: 'modificaciones' stamp: 'JR 11/29/2023 11:32:14'!
renombrarA: nombreNuevo

	self subclassResponsibility.! !


!CarpetaBase methodsFor: 'agregar' stamp: 'JR 11/29/2023 12:13:06'!
agregar: unElemento
	
	self validarCondicionDeNoEstarAgregandoUnaCarpetaASiMisma: unElemento.
	self validarCondicionCuandoSeQuiereAgregarUnElementoConNombrePreexistente: unElemento.
	
	contenidoDeLaCarpeta add: unElemento.
	
	unElemento asignarComoOrigenA: self.! !


!CarpetaBase methodsFor: 'eliminacion' stamp: 'JR 11/29/2023 10:08:06'!
eliminarElemento: unElemento

	unElemento validarCondicionParaSerEliminadoDentroDe: self.

	contenidoDeLaCarpeta remove: unElemento.

! !


!CarpetaBase methodsFor: 'initialization' stamp: 'JR 11/28/2023 20:14:44'!
initialize

	contenidoDeLaCarpeta := Set new.
	
! !


!CarpetaBase methodsFor: 'datos' stamp: 'TN 11/9/2023 17:33:33'!
cantidadDeElementos
	^ contenidoDeLaCarpeta size ! !

!CarpetaBase methodsFor: 'datos' stamp: 'JR 11/29/2023 12:25:52'!
carpetaAnterior
	
	self validarCondicionQueNoSoyLaRaiz.
	"Como la carpeta raiz, es la 'primer ' carpeta, no tiene una anterior a esta."
	
	^origen.! !

!CarpetaBase methodsFor: 'datos' stamp: 'TN 11/29/2023 21:18:55'!
conNombre: unNombre

	nombreCarpeta := unNombre.
	fechaDeCreacion := FixedGregorianDate today.
! !

!CarpetaBase methodsFor: 'datos' stamp: 'TN 11/29/2023 21:15:29'!
contenidoDeLaCarpeta

	^contenidoDeLaCarpeta.! !

!CarpetaBase methodsFor: 'datos' stamp: 'JR 11/16/2023 12:03:22'!
contieneA: unArchivo

	^(contenidoDeLaCarpeta includes: unArchivo).! !

!CarpetaBase methodsFor: 'datos' stamp: 'TN 11/28/2023 11:35:13'!
contieneAlElementoConNombre: nombre

^ contenidoDeLaCarpeta anySatisfy:[: unElemento | unElemento nombre = nombre]! !

!CarpetaBase methodsFor: 'datos' stamp: 'TN 11/28/2023 11:54:59'!
elementoConNombre: nombreAModificar 
	
	^ contenidoDeLaCarpeta detect:[: unElemento | unElemento nombre = nombreAModificar] ifNone: [self error: self mensajeErrorCuandoLaCarpetaNoTieneAlElementoBuscado]! !

!CarpetaBase methodsFor: 'datos' stamp: 'JR 11/29/2023 13:26:04'!
esRaiz

	^self subclassResponsibility.! !

!CarpetaBase methodsFor: 'datos' stamp: 'JR 11/15/2023 16:42:49'!
nombre
	
	^nombreCarpeta.! !

!CarpetaBase methodsFor: 'datos' stamp: 'JR 11/15/2023 16:35:07'!
tieneElementos
	
	^contenidoDeLaCarpeta isEmpty not.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarpetaBase class' category: 'Mini-MiUNQ'!
CarpetaBase class
	instanceVariableNames: ''!

!CarpetaBase class methodsFor: 'as yet unclassified' stamp: 'JR 11/15/2023 16:07:04'!
conNombre: unNombre

	^self new conNombre: unNombre.! !


!classDefinition: #Carpeta category: 'Mini-MiUNQ'!
CarpetaBase subclass: #Carpeta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!Carpeta methodsFor: 'datos' stamp: 'JR 11/29/2023 11:22:20'!
esRaiz
	^false.! !

!Carpeta methodsFor: 'datos' stamp: 'TN 11/29/2023 21:17:45'!
fechaDeCreacion
	^ fechaDeCreacion ! !


!Carpeta methodsFor: 'modificacion' stamp: 'JR 11/29/2023 12:14:22'!
asignarComoOrigenA: carpetaOrigen

	origen := carpetaOrigen.! !

!Carpeta methodsFor: 'modificacion' stamp: 'JR 11/29/2023 11:32:22'!
renombrarA: nombreNuevo

	nombreCarpeta := nombreNuevo.! !


!classDefinition: #CarpetaRaiz category: 'Mini-MiUNQ'!
CarpetaBase subclass: #CarpetaRaiz
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!CarpetaRaiz methodsFor: 'datos' stamp: 'JR 11/29/2023 11:22:33'!
esRaiz
	^true.! !


!CarpetaRaiz methodsFor: 'mensajesDeError' stamp: 'JR 11/29/2023 11:34:01'!
mensajeErrorCuandoSeIntentaRenombrarALaCarpetaRaiz

	^'Ups!! No se puede renombrar a la carpeta raiz.'! !


!CarpetaRaiz methodsFor: 'modificacion' stamp: 'JR 11/29/2023 11:34:19'!
renombrarA: nombreNuevo

	self error: self mensajeErrorCuandoSeIntentaRenombrarALaCarpetaRaiz.! !


!classDefinition: #Filtro category: 'Mini-MiUNQ'!
Object subclass: #Filtro
	instanceVariableNames: 'condicionDeFiltrado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!Filtro methodsFor: 'accion' stamp: 'TN 11/29/2023 21:00:58'!
filtrarElementosDe: unaCarpeta

	self subclassResponsibility. 
	! !


!Filtro methodsFor: 'datos' stamp: 'TN 11/29/2023 20:36:46'!
conCondicion: condicionPorLaCualFiltrar

	condicionDeFiltrado := condicionPorLaCualFiltrar ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Filtro class' category: 'Mini-MiUNQ'!
Filtro class
	instanceVariableNames: ''!

!Filtro class methodsFor: 'as yet unclassified' stamp: 'TN 11/29/2023 20:36:10'!
conCondicion: condicionPorLaCualFiltrar

	^self new conCondicion: condicionPorLaCualFiltrar.! !


!classDefinition: #FiltroPorFecha category: 'Mini-MiUNQ'!
Filtro subclass: #FiltroPorFecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!FiltroPorFecha methodsFor: 'as yet unclassified' stamp: 'TN 11/30/2023 11:25:00'!
filtrarElementosDe: unaCarpeta

	 | carpetaConElementosFiltrados elementosFiltrados |
	carpetaConElementosFiltrados := Carpeta conNombre: 'Elementos filtrados'.
	
	elementosFiltrados := unaCarpeta contenidoDeLaCarpeta select:[:unElemento | unElemento fechaDeCreacion = condicionDeFiltrado].
	
	elementosFiltrados do:[:unElemento | carpetaConElementosFiltrados agregar: unElemento].
	
	^ carpetaConElementosFiltrados! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FiltroPorFecha class' category: 'Mini-MiUNQ'!
FiltroPorFecha class
	instanceVariableNames: 'fechaBuscada'!


!classDefinition: #FiltroPorPalabra category: 'Mini-MiUNQ'!
Filtro subclass: #FiltroPorPalabra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!FiltroPorPalabra methodsFor: 'as yet unclassified' stamp: 'TN 11/30/2023 11:37:04'!
filtrarElementosDe: unaCarpeta

| carpetaConElementosFiltrados elementosFiltrados |

	carpetaConElementosFiltrados := Carpeta conNombre: 'Elementos filtrados'.
	
	elementosFiltrados := unaCarpeta contenidoDeLaCarpeta select:[:unElemento | unElemento nombre includesSubstring: 	condicionDeFiltrado caseSensitive: false]. 
	
"Filtramos utilizando el mensaje caseSensitive porque tiene sentido que cuando busquemos un titulo que contenga una palabra no importe si esta en mayusculas o no."
	
	elementosFiltrados do:[:unElemento | carpetaConElementosFiltrados agregar: unElemento].
	
	^ carpetaConElementosFiltrados! !


!classDefinition: #MiniMiUNQSystem category: 'Mini-MiUNQ'!
Object subclass: #MiniMiUNQSystem
	instanceVariableNames: 'usuariosDelSistema rootDelSistema systemAdmins'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!MiniMiUNQSystem methodsFor: 'validaciones' stamp: 'TN 11/27/2023 12:17:45'!
validarCondicionSiElUsuarioSeEncuentraDadoDeAlta: usuario 

 ^(self usuariosDadosDeAlta includes: usuario ) ifFalse: [self error: self mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema]
! !

!MiniMiUNQSystem methodsFor: 'validaciones' stamp: 'TN 11/27/2023 12:30:30'!
validarCondicionSobreElNombreDe: unUsuario

	^ (usuariosDelSistema anySatisfy:[:usuario| usuario nombreDeUsuario = unUsuario nombreDeUsuario ]) ifFalse: [self error: self mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema]! !

!MiniMiUNQSystem methodsFor: 'validaciones' stamp: 'TN 11/27/2023 12:32:06'!
validarCondicionSobreLaContraseniaDe: unUsuario

	^ (usuariosDelSistema anySatisfy:[:usuario| usuario contraseña = unUsuario contraseña ]) ifFalse: [self error: self mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema]! !


!MiniMiUNQSystem methodsFor: 'mensajesDeError' stamp: 'JR 11/22/2023 15:50:22'!
mensajeDeErrorCuandoSeIntentaDarDeAltaAOtroRoot

	^'Ups!! ERROR GRAVE. No se puede dar de alta otro root en el sistema'.! !

!MiniMiUNQSystem methodsFor: 'mensajesDeError' stamp: 'TN 11/27/2023 12:18:45'!
mensajeErrorCuandoElAdministradorNoSeEncuentraEnElSistema

	^'Ups!! El administrador no se encuentra en el sistema'.! !

!MiniMiUNQSystem methodsFor: 'mensajesDeError' stamp: 'TN 11/27/2023 12:16:55'!
mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema

	^'Ups!! El usuario no se encuentra en el sistema'.! !

!MiniMiUNQSystem methodsFor: 'mensajesDeError' stamp: 'JR 11/29/2023 10:49:07'!
mensajeErrorCuandoExisteSysAdminConElMismoNombre
	
	^'Ups!! Ya existe un administrador registrado en sistema con el mismo nombre'.! !

!MiniMiUNQSystem methodsFor: 'mensajesDeError' stamp: 'JR 11/29/2023 10:35:27'!
mensajeErrorCuandoExisteUsuarioConElMismoNombre
	
	^'Ups!! Ya existe un usuario registrado en sistema con el mismo nombre'.! !


!MiniMiUNQSystem methodsFor: 'initialization' stamp: 'JR 11/22/2023 15:14:18'!
initialize

	rootDelSistema := Root conNombre: 'Joaco' yContraseña: '231'.
	
	usuariosDelSistema := Set new.
	
	systemAdmins := Set new.
	systemAdmins add: rootDelSistema.
	
	

	
	! !


!MiniMiUNQSystem methodsFor: 'altas' stamp: 'JR 11/22/2023 15:22:33'!
aceptaComoAdminA: unAdmin 
	
	systemAdmins add: unAdmin.! !

!MiniMiUNQSystem methodsFor: 'altas' stamp: 'JR 11/29/2023 13:22:45'!
aceptaComoUsuarioA: unUsuario
|directorioRaiz|
	usuariosDelSistema add: unUsuario.
	
	directorioRaiz := CarpetaRaiz conNombre: 'Directorio Raiz'.
	unUsuario cambiaPosicionA: directorioRaiz.
	unUsuario miDirectorioRaizEs: directorioRaiz.
	
	! !

!MiniMiUNQSystem methodsFor: 'altas' stamp: 'JR 11/16/2023 08:46:14'!
tieneComoUsuarioA: alUsuario
	
	^(usuariosDelSistema includes: alUsuario).! !

!MiniMiUNQSystem methodsFor: 'altas' stamp: 'JR 11/20/2023 20:45:36'!
usuariosDadosDeAlta
	
	^usuariosDelSistema.! !


!MiniMiUNQSystem methodsFor: 'datos' stamp: 'JR 11/22/2023 15:20:28'!
cantidadDeAdministradores
	
	^systemAdmins size.! !

!MiniMiUNQSystem methodsFor: 'datos' stamp: 'JR 11/15/2023 17:26:42'!
cantidadDeUsuarios
	
	^usuariosDelSistema size.! !

!MiniMiUNQSystem methodsFor: 'datos' stamp: 'JR 11/22/2023 14:40:59'!
rootDelSistema

	^rootDelSistema .! !

!MiniMiUNQSystem methodsFor: 'datos' stamp: 'JR 11/22/2023 14:55:40'!
systemAdmins
	
	^systemAdmins.! !

!MiniMiUNQSystem methodsFor: 'datos' stamp: 'JR 11/22/2023 15:24:15'!
tieneComoAdministradorA: unAdmin 
	
	
	^systemAdmins includes: unAdmin.! !

!MiniMiUNQSystem methodsFor: 'datos' stamp: 'JR 11/16/2023 08:10:20'!
tieneUsuarios
	
	^(usuariosDelSistema isEmpty ) not.! !


!classDefinition: #SystemAdmin category: 'Mini-MiUNQ'!
Object subclass: #SystemAdmin
	instanceVariableNames: 'nombreDelAdmin contraseniaDelAdmin'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!SystemAdmin methodsFor: 'datos' stamp: 'JR 11/22/2023 15:35:07'!
contrasenia
	
	^contraseniaDelAdmin.! !

!SystemAdmin methodsFor: 'datos' stamp: 'JR 11/22/2023 15:53:46'!
esRoot

	self subclassResponsibility ! !

!SystemAdmin methodsFor: 'datos' stamp: 'JR 11/22/2023 15:09:49'!
nombreDelAdmin
	
	^nombreDelAdmin.! !


!SystemAdmin methodsFor: 'initialization' stamp: 'JR 11/22/2023 15:09:31'!
initializeConNombre: nombre yContraseña: contraseña 
	
	nombreDelAdmin:= nombre.
	contraseniaDelAdmin := contraseña.! !


!SystemAdmin methodsFor: 'bajas' stamp: 'JR 11/22/2023 16:56:39'!
daDeBajaAlAdmin: aUnAdmin enElSistema: aMiniMiUNQ 
	
	self subclassResponsibility.! !

!SystemAdmin methodsFor: 'bajas' stamp: 'JR 11/22/2023 17:18:45'!
daDeBajaAlUsuario: unUsuario enElSistema: miniMiUNQ.

	self subclassResponsibility.! !


!SystemAdmin methodsFor: 'altas' stamp: 'JR 11/22/2023 15:48:54'!
daDeAltaAlAdmin: aUnAdmin enElSistema: aMiniMiUNQ 
	
	self validarCondicionParaDarDeAltaAlAdmin: aUnAdmin SiYaExisteEn: aMiniMiUNQ.
	self validarCondicionPorSiElSystemAdmin: aUnAdmin esRootEnElSistema: aMiniMiUNQ.
	aMiniMiUNQ aceptaComoAdminA: aUnAdmin.! !

!SystemAdmin methodsFor: 'altas' stamp: 'JR 11/28/2023 18:31:12'!
daDeAltaAlUsuario: unUsuario enElSistema: sistemaMiniUnq

	self validarCondicionParaDarDeAltaAlUsuario: unUsuario SiYaExisteEn: sistemaMiniUnq.
	
	sistemaMiniUnq aceptaComoUsuarioA: unUsuario.

	
	
	! !


!SystemAdmin methodsFor: 'mensajesDeError' stamp: 'JR 11/29/2023 09:46:36'!
mensajeErrorCuandoSeIntentaEliminarAlRootDelSistema

	^'Ups!! El root no puede ser eliminado bajo ningun motivo.'! !


!SystemAdmin methodsFor: 'validaciones' stamp: 'JR 11/29/2023 10:48:51'!
validarCondicionParaDarDeAltaAlAdmin: unAdmin SiYaExisteEn: sistemaMiniUnq 
|adminsDadosDeAlta|
adminsDadosDeAlta := sistemaMiniUnq systemAdmins.

	^( adminsDadosDeAlta anySatisfy:[:systemAdmin| systemAdmin nombreDelAdmin = unAdmin nombreDelAdmin]) ifTrue: [self error: sistemaMiniUnq mensajeErrorCuandoExisteSysAdminConElMismoNombre].! !

!SystemAdmin methodsFor: 'validaciones' stamp: 'JR 11/29/2023 10:35:20'!
validarCondicionParaDarDeAltaAlUsuario: unUsuarioOAdmin SiYaExisteEn: sistemaMiniUnq 
|usuariosDadosDeAlta|
usuariosDadosDeAlta := sistemaMiniUnq usuariosDadosDeAlta.

	^( usuariosDadosDeAlta anySatisfy:[:usuario| usuario nombreDeUsuario = unUsuarioOAdmin nombreDeUsuario ]) ifTrue: [self error: sistemaMiniUnq mensajeErrorCuandoExisteUsuarioConElMismoNombre].! !

!SystemAdmin methodsFor: 'validaciones' stamp: 'TN 11/27/2023 12:19:24'!
validarCondicionParaModificarAlAdmin: unAdmin SiSeEncuentraEn: miniMiUNQ.

^ (miniMiUNQ systemAdmins includes: unAdmin) ifFalse: [self error: miniMiUNQ mensajeErrorCuandoElAdministradorNoSeEncuentraEnElSistema]

	! !

!SystemAdmin methodsFor: 'validaciones' stamp: 'TN 11/27/2023 12:17:52'!
validarCondicionParaModificarAlUsuario: unUsuario SiSeEncuentraEn: miniUNQ.

^ (miniUNQ usuariosDadosDeAlta includes: unUsuario ) ifFalse: [self error: miniUNQ mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema]
! !

!SystemAdmin methodsFor: 'validaciones' stamp: 'JR 11/29/2023 10:36:35'!
validarCondicionParaNoRepetirNombreNuevoDelUsuario: nombreNuevo enElSistema: miniUNQ
|validarCondicionSiYaExiste|

	validarCondicionSiYaExiste := miniUNQ usuariosDadosDeAlta anySatisfy: [:usuario| usuario nombreDeUsuario = nombreNuevo].
	
	^(validarCondicionSiYaExiste) ifTrue: [self error: miniUNQ mensajeErrorCuandoExisteUsuarioConElMismoNombre].! !

!SystemAdmin methodsFor: 'validaciones' stamp: 'JR 11/22/2023 15:53:31'!
validarCondicionPorSiElSystemAdmin: unSystemAdmin esRootEnElSistema: aMiniMiUNQ.

	^(unSystemAdmin esRoot) ifTrue:[self error: aMiniMiUNQ mensajeDeErrorCuandoSeIntentaDarDeAltaAOtroRoot ].

! !

!SystemAdmin methodsFor: 'validaciones' stamp: 'JR 11/29/2023 09:46:11'!
validarSiUnSystemAdminEsRoot

	^(self esRoot) ifTrue:[self error: self mensajeErrorCuandoSeIntentaEliminarAlRootDelSistema].! !


!SystemAdmin methodsFor: 'modificaciones' stamp: 'JR 11/23/2023 15:21:20'!
cambiarContraseniaA: contraNueva 
	
	contraseniaDelAdmin := contraNueva.! !

!SystemAdmin methodsFor: 'modificaciones' stamp: 'JR 11/23/2023 15:08:59'!
cambiarNombreA: nombreNuevo 
	
	nombreDelAdmin := nombreNuevo.! !

!SystemAdmin methodsFor: 'modificaciones' stamp: 'JR 11/23/2023 15:14:07'!
leModificaElNombreAlAdmin: unAdmin alNombre: nombreNuevo enElSistema: miniMiUNQ

	self subclassResponsibility.! !

!SystemAdmin methodsFor: 'modificaciones' stamp: 'JR 11/29/2023 10:28:58'!
leModificaElNombreAlUsuario: unUsuario alNombre: nombreNuevo enElSistema: miniUNQ 
|usuarioAModificarElNombre|	

	self validarCondicionParaModificarAlUsuario: unUsuario SiSeEncuentraEn: miniUNQ.
	self validarCondicionParaNoRepetirNombreNuevoDelUsuario: nombreNuevo enElSistema: miniUNQ.
	
	usuarioAModificarElNombre := miniUNQ usuariosDadosDeAlta detect: [:usuario| usuario nombreDeUsuario = unUsuario nombreDeUsuario].
	
	usuarioAModificarElNombre cambiarNombreA: nombreNuevo.
	! !

!SystemAdmin methodsFor: 'modificaciones' stamp: 'JR 11/29/2023 11:59:34'!
leModificaLaContraseniaAlAdmin: aUnAdmin aLaContrasenia: contraNueva enElSistema: aMiniMiUNQ 
	
	self subclassResponsibility.! !

!SystemAdmin methodsFor: 'modificaciones' stamp: 'TN 11/23/2023 16:14:01'!
leModificaLaContraseniaAlUsuario: unUsuario aLaContrasenia: contraNueva enElSistema: miniUNQ 
|usuarioAModificarLaContrasenia|	

	self validarCondicionParaModificarAlUsuario: unUsuario SiSeEncuentraEn: miniUNQ.
	usuarioAModificarLaContrasenia := miniUNQ usuariosDadosDeAlta detect: [:usuario| usuario nombreDeUsuario = unUsuario nombreDeUsuario].
	
	usuarioAModificarLaContrasenia cambiarContraseniaA: contraNueva.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SystemAdmin class' category: 'Mini-MiUNQ'!
SystemAdmin class
	instanceVariableNames: ''!

!SystemAdmin class methodsFor: 'as yet unclassified' stamp: 'JR 11/22/2023 15:08:41'!
conNombre: nombre yContraseña: contraseña 
	
	^self new initializeConNombre: nombre yContraseña: contraseña ! !


!classDefinition: #Admin category: 'Mini-MiUNQ'!
SystemAdmin subclass: #Admin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!Admin methodsFor: 'validaciones' stamp: 'JR 11/29/2023 10:00:15'!
validarCondicionSiMeEstoyAutoModificando: adminAModificar

	^(self nombreDelAdmin = adminAModificar nombreDelAdmin) ifFalse: [self error: self mensajeErrorCuandoUnAdminNoTienePrivilegios].! !


!Admin methodsFor: 'mensajesDeError' stamp: 'TN 11/23/2023 15:41:37'!
mensajeErrorCuandoUnAdminNoTienePrivilegios

	^'Ups!! No tienes los privilegios para realizar la accion que estas intentando'.! !


!Admin methodsFor: 'bajas' stamp: 'TN 11/23/2023 16:28:43'!
daDeBajaAlAdmin: aUnAdmin enElSistema: aMiniMiUNQ 
	
	self error: self mensajeErrorCuandoUnAdminNoTienePrivilegios.! !

!Admin methodsFor: 'bajas' stamp: 'TN 11/23/2023 15:42:09'!
daDeBajaAlUsuario: unUsuario enElSistema: miniMiUNQ.

	self error: self mensajeErrorCuandoUnAdminNoTienePrivilegios.! !


!Admin methodsFor: 'datos' stamp: 'JR 11/22/2023 15:53:54'!
esRoot

	^false! !


!Admin methodsFor: 'modificaciones' stamp: 'JR 11/29/2023 10:05:58'!
leModificaElNombreAlAdmin: unAdmin alNombre: nombreNuevo enElSistema: miniMiUNQ 
|administradorAModificar|
	
	self validarCondicionSiMeEstoyAutoModificando: unAdmin.
	self validarCondicionParaModificarAlAdmin: unAdmin SiSeEncuentraEn: miniMiUNQ.
	

	administradorAModificar := miniMiUNQ systemAdmins detect:[:admin | admin nombreDelAdmin = unAdmin nombreDelAdmin].
	administradorAModificar cambiarNombreA: nombreNuevo.! !

!Admin methodsFor: 'modificaciones' stamp: 'JR 11/29/2023 10:05:50'!
leModificaLaContraseniaAlAdmin: unAdmin aLaContrasenia: contraNueva enElSistema: miniMiUNQ 
|administradorAModificar|
	
	self validarCondicionSiMeEstoyAutoModificando: unAdmin.
	self validarCondicionParaModificarAlAdmin: unAdmin SiSeEncuentraEn: miniMiUNQ.
	

	administradorAModificar := miniMiUNQ systemAdmins detect:[:admin | admin nombreDelAdmin = unAdmin nombreDelAdmin].
	administradorAModificar cambiarContraseniaA: contraNueva.! !


!classDefinition: #Root category: 'Mini-MiUNQ'!
SystemAdmin subclass: #Root
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!Root methodsFor: 'validaciones' stamp: 'JR 11/29/2023 10:47:54'!
validarCondicionParaNoRepetirNombreNuevoDelSystemAdmin: nombreNuevo enElSistema: miniUNQ
|validarCondicionSiYaExiste|

	validarCondicionSiYaExiste := miniUNQ systemAdmins anySatisfy: [:sysAdm| sysAdm nombreDelAdmin = nombreNuevo].
	
	^(validarCondicionSiYaExiste) ifTrue: [self error: miniUNQ mensajeErrorCuandoExisteUsuarioConElMismoNombre].! !


!Root methodsFor: 'modificaciones' stamp: 'JR 11/29/2023 10:46:24'!
leModificaElNombreAlAdmin: unAdmin alNombre: nombreNuevo enElSistema: miniMiUNQ 

|administradorAModificar|

	self validarCondicionParaModificarAlAdmin: unAdmin SiSeEncuentraEn: miniMiUNQ.
	self validarCondicionParaNoRepetirNombreNuevoDelSystemAdmin: nombreNuevo enElSistema: miniMiUNQ.

	

	administradorAModificar := miniMiUNQ systemAdmins detect:[:admin | admin nombreDelAdmin = unAdmin nombreDelAdmin].
	administradorAModificar cambiarNombreA: nombreNuevo.! !

!Root methodsFor: 'modificaciones' stamp: 'TN 11/23/2023 16:04:32'!
leModificaLaContraseniaAlAdmin: unAdmin aLaContrasenia: contraNueva enElSistema: miniUnq 

|adminAModificarLaContrasenia|	
	self validarCondicionParaModificarAlAdmin: unAdmin SiSeEncuentraEn: miniUnq.
	
	adminAModificarLaContrasenia := miniUnq systemAdmins detect: [:admin| admin nombreDelAdmin = unAdmin nombreDelAdmin].
	
	adminAModificarLaContrasenia cambiarContraseniaA: contraNueva.
	! !


!Root methodsFor: 'datos' stamp: 'JR 11/22/2023 15:54:03'!
esRoot

	^true.! !


!Root methodsFor: 'bajas' stamp: 'JR 11/29/2023 09:45:00'!
daDeBajaAlAdmin: unSysAdmin enElSistema: MiniMiUNQ 
|systemAdminsDelSistema|

	unSysAdmin validarSiUnSystemAdminEsRoot.
	
	systemAdminsDelSistema := MiniMiUNQ systemAdmins.
	systemAdminsDelSistema remove: unSysAdmin ifAbsent: [self error: MiniMiUNQ mensajeErrorCuandoElAdministradorNoSeEncuentraEnElSistema].! !

!Root methodsFor: 'bajas' stamp: 'JR 11/28/2023 18:23:48'!
daDeBajaAlUsuario: aUnUsuario enElSistema: aMiniMiUNQ 
|usuariosEnElSistema|

	usuariosEnElSistema := aMiniMiUNQ usuariosDadosDeAlta.
	usuariosEnElSistema remove: aUnUsuario ifAbsent: [self error: aMiniMiUNQ mensajeErrorCuandoElUsuarioNoSeEncuentraEnElSistema].! !


!classDefinition: #Usuario category: 'Mini-MiUNQ'!
Object subclass: #Usuario
	instanceVariableNames: 'nombreDeUsuario contraseñaDelUsuario posicionActual estadoDeLaSesion miDirectorioRaiz elementosQueVeElUsuario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mini-MiUNQ'!

!Usuario methodsFor: 'initialization' stamp: 'JR 11/29/2023 11:25:48'!
initializeConNombre: nombre yContraseña: contraseña 
	
	nombreDeUsuario := nombre.
	contraseñaDelUsuario := contraseña.
	estadoDeLaSesion := false.
	
	"No tiene asignada una posicion, se le asigna cuando se lo da de alta."! !


!Usuario methodsFor: 'personalizacionUsuario' stamp: 'TN 11/27/2023 11:54:30'!
cambiarContraseniaA: contraNueva 
	
	contraseñaDelUsuario := contraNueva.
	
	"un Usuario por si mismo no puede cambiarse la contrasenia si ya se encuentra ingresado en el sistema"! !

!Usuario methodsFor: 'personalizacionUsuario' stamp: 'JR 11/28/2023 19:12:43'!
cambiarContraseniaA: contraseniaNueva conAutorizacionDe: unSystemAdmin enElSistema: MiniMiUNQ 
	
	MiniMiUNQ validarCondicionSiElUsuarioSeEncuentraDadoDeAlta: self.
	self validarCondicionDeEstadoDeSesionActiva.
	
	unSystemAdmin leModificaLaContraseniaAlUsuario: self aLaContrasenia: contraseniaNueva enElSistema: MiniMiUNQ.! !

!Usuario methodsFor: 'personalizacionUsuario' stamp: 'TN 11/27/2023 11:55:02'!
cambiarNombreA: nombreNuevo 
	
	nombreDeUsuario := nombreNuevo.
	
	"un Usuario por si mismo no puede cambiarse el nombre si ya se encuentra ingresado en el sistema"! !

!Usuario methodsFor: 'personalizacionUsuario' stamp: 'TN 11/27/2023 10:57:00'!
cambiarNombreA: nombreNuevo conAutorizacionDe: unSystemAdmin enElSistema: miniMiUNQ 
	
	unSystemAdmin leModificaElNombreAlUsuario: self alNombre: nombreNuevo enElSistema: miniMiUNQ.! !

!Usuario methodsFor: 'personalizacionUsuario' stamp: 'JR 11/29/2023 13:23:14'!
miDirectorioRaizEs: directorioRaiz

	miDirectorioRaiz  := directorioRaiz.! !


!Usuario methodsFor: 'directorio' stamp: 'TN 11/28/2023 10:46:40'!
crearArchivoConNombre: nombreDelArchivo ConTexto: textoDelArchivo

|archivoParaCrear|

	self validarCondicionDeEstadoDeSesionActiva.

	archivoParaCrear := ArchivoDeTexto conNombre: nombreDelArchivo yContenido: textoDelArchivo.

	posicionActual agregar: archivoParaCrear.

! !

!Usuario methodsFor: 'directorio' stamp: 'JR 11/29/2023 11:24:33'!
crearCarpetaConNombre: nombreDeLaCarpeta

	|carpetaACrear|

	self validarCondicionDeEstadoDeSesionActiva.

	carpetaACrear := Carpeta conNombre: nombreDeLaCarpeta.

	posicionActual agregar: carpetaACrear.
! !

!Usuario methodsFor: 'directorio' stamp: 'JR 11/29/2023 11:41:58'!
elementoEnDirectorioActualConNombre: nombreDeUnElemento 

	^ posicionActual elementoConNombre: nombreDeUnElemento.! !

!Usuario methodsFor: 'directorio' stamp: 'nf 11/28/2023 13:09:01'!
eliminarElementoConNombre: nombreDeElemento 
	
	| elementoAEliminar |
	self validarCondicionDeEstadoDeSesionActiva.
	
	elementoAEliminar := posicionActual elementoConNombre: nombreDeElemento.
	posicionActual eliminarElemento: elementoAEliminar.! !

!Usuario methodsFor: 'directorio' stamp: 'TN 11/30/2023 13:51:40'!
eliminarFiltros
	
	elementosQueVeElUsuario := posicionActual.! !

!Usuario methodsFor: 'directorio' stamp: 'TN 11/28/2023 12:10:22'!
modificarElContenidoDelArchivo: nombreDelArchivo AContenido: contenidoNuevo
 
	self validarCondicionDeEstadoDeSesionActiva.
	
 	posicionActual modificarElContenidoDelElemento: nombreDelArchivo AContenido: contenidoNuevo.! !

!Usuario methodsFor: 'directorio' stamp: 'TN 11/28/2023 11:33:31'!
modificarElNombreDelElemento: nombreAModificar ANombre: nombreNuevo

	
	self validarCondicionDeEstadoDeSesionActiva.
	
 	posicionActual modificarElNombreDelElemento: nombreAModificar ANombre: nombreNuevo.
	! !

!Usuario methodsFor: 'directorio' stamp: 'JR 11/29/2023 11:49:54'!
tieneAlElementoConNombre: nombreDelElemento

	^posicionActual contieneAlElementoConNombre: nombreDelElemento.
	
	"Por enunciado el usuario debe saber los elementos que posee el directorio donde se encuentra parado."
	! !


!Usuario methodsFor: 'datos' stamp: 'TN 11/9/2023 17:45:21'!
contraseña
	^ contraseñaDelUsuario ! !

!Usuario methodsFor: 'datos' stamp: 'JR 11/29/2023 11:46:53'!
estadoDeLaSesion
	^ estadoDeLaSesion.
	"Si es true se encuentra la sesion iniciada y si es false el usuario no se encuentra con la sesion iniciada"! !

!Usuario methodsFor: 'datos' stamp: 'JR 11/20/2023 20:46:37'!
nombreDeUsuario

 	^nombreDeUsuario.! !

!Usuario methodsFor: 'datos' stamp: 'TN 11/27/2023 11:52:36'!
posicionActual
	
	^ posicionActual! !


!Usuario methodsFor: 'miniMiUNQ' stamp: 'TN 11/30/2023 13:51:40'!
cambiaPosicionA: unaPosicionNueva

	posicionActual:= unaPosicionNueva .
	elementosQueVeElUsuario := unaPosicionNueva.  
	"Esto se hace porque los filtros se deben aplicar sobre la carpeta en la que se escuentra el usuario"! !

!Usuario methodsFor: 'miniMiUNQ' stamp: 'JR 11/29/2023 14:11:23'!
cerrarSesion
	
	self validarCondicionDeNoTenerLaSesionCerrada.
	self volverALaCarpetaRaiz.
	estadoDeLaSesion := false.
	
	
	! !

!Usuario methodsFor: 'miniMiUNQ' stamp: 'TN 11/30/2023 20:05:39'!
elementosFiltrados
	
	^elementosQueVeElUsuario! !

!Usuario methodsFor: 'miniMiUNQ' stamp: 'TN 11/30/2023 13:51:40'!
filtrarElementosAplicandoElFiltro: unFiltro
	
	self validarCondicionDeEstadoDeSesionActiva.
	 
	elementosQueVeElUsuario := unFiltro filtrarElementosDe: elementosQueVeElUsuario.
	! !

!Usuario methodsFor: 'miniMiUNQ' stamp: 'TN 11/30/2023 13:51:40'!
iniciarSesionEn: miniMiUNQ 

	self validarCondicionDeEstadoDeSesionInactiva.
	miniMiUNQ validarCondicionSiElUsuarioSeEncuentraDadoDeAlta: self.
	miniMiUNQ validarCondicionSobreElNombreDe: self.
	miniMiUNQ validarCondicionSobreLaContraseniaDe: self.
	
	estadoDeLaSesion := true.
	elementosQueVeElUsuario := posicionActual. "Cada vez que se inicia sesion los filtros se reinician."
	
	 
	
	
	
	
	! !

!Usuario methodsFor: 'miniMiUNQ' stamp: 'JR 11/28/2023 19:54:10'!
irAlDirectorioConNombre: nombreDelDirectorioAIr
|carpetaAIr|
	
	self validarCondicionDeEstadoDeSesionActiva.
	carpetaAIr := posicionActual elementoConNombre: nombreDelDirectorioAIr.

	self cambiaPosicionA: carpetaAIr.! !

!Usuario methodsFor: 'miniMiUNQ' stamp: 'JR 11/29/2023 12:55:27'!
volverALaCarpetaAnterior
|origenDeLaCarpetaActual|

	origenDeLaCarpetaActual := posicionActual carpetaAnterior.
	
	self cambiaPosicionA: origenDeLaCarpetaActual.! !

!Usuario methodsFor: 'miniMiUNQ' stamp: 'JR 11/29/2023 14:00:09'!
volverALaCarpetaRaiz
	
	self cambiaPosicionA: miDirectorioRaiz.

	
	! !


!Usuario methodsFor: 'mensajesDeError' stamp: 'JR 11/29/2023 12:34:26'!
mensajeDeErrorCuandoSeIntentaIniciarSesionSinHaberCerradoSesion
	
	^'Ups!! Ya tienes la sesion iniciada, quisiste cerrar sesion?'! !

!Usuario methodsFor: 'mensajesDeError' stamp: 'TN 11/28/2023 10:59:47'!
mensajeDeErrorDeSesionNoIniciada
	
	^ 'Ups!! Sesion no iniciada'.! !

!Usuario methodsFor: 'mensajesDeError' stamp: 'JR 11/29/2023 14:10:32'!
mensajeErrorNoSePuedeCerrarLaSesionSiYaEstaCerrada
	
	^'Ups!! La sesion ya esta cerrada, quisiste iniciar de nuevo?'! !


!Usuario methodsFor: 'validaciones' stamp: 'TN 11/28/2023 10:58:12'!
validarCondicionDeEstadoDeSesionActiva
	
	^ estadoDeLaSesion ifFalse: [self error: self mensajeDeErrorDeSesionNoIniciada].
	
	"El usuario conoce el estado de su sesion y no necesita la informacion del sistema, ya que el la inicia"! !

!Usuario methodsFor: 'validaciones' stamp: 'JR 11/29/2023 12:36:13'!
validarCondicionDeEstadoDeSesionInactiva

		
	^(estadoDeLaSesion) ifTrue: [self error: self mensajeDeErrorCuandoSeIntentaIniciarSesionSinHaberCerradoSesion].
	
	"El usuario conoce el estado de su sesion y no necesita la informacion del sistema, ya que el la inicia"! !

!Usuario methodsFor: 'validaciones' stamp: 'JR 11/29/2023 14:13:16'!
validarCondicionDeNoTenerLaSesionCerrada

	^(self estadoDeLaSesion) ifFalse:[self error: self mensajeErrorNoSePuedeCerrarLaSesionSiYaEstaCerrada].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Usuario class' category: 'Mini-MiUNQ'!
Usuario class
	instanceVariableNames: ''!

!Usuario class methodsFor: 'instance creation' stamp: 'TN 11/9/2023 17:42:28'!
conNombre: nombre yContraseña: contraseña 
	
	^self new initializeConNombre: nombre yContraseña: contraseña ! !
