!classDefinition: #EstacionamientoTest category: 'Parcial-TomasNeiraGuitera'!
TestCase subclass: #EstacionamientoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-TomasNeiraGuitera'!

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:27:15'!
test_001_CuandoUnEstacionamientoAbreNoTieneClientes

| unEstacionamieto |
unEstacionamieto := EstacionamientoUNQ new.

Assert isTrue: (unEstacionamieto clientes isEmpty) ! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:33:28'!
test_002_EnUnEstacionamientoIngresaUnCliente

| unEstacionamieto unCliente |
unEstacionamieto := EstacionamientoUNQ new.
unCliente := Estudiante new.
unEstacionamieto registrarA: unCliente.

Assert isTrue: (unEstacionamieto tieneResgistradoA: unCliente) ! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:39:31'!
test_003_UnEstacionamientoVacioSabeCuantosEstudiantesTiene

| unEstacionamiento |
unEstacionamiento := EstacionamientoUNQ new.


Assert that: unEstacionamiento cantidadDeEstudiantes isEqualTo: 0! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:45:09'!
test_004_UnEstacionamientoConDosEstudiantesSabeCuantosEstudiantesTiene

| unEstacionamiento otroEstudiante unEstudiante |
unEstacionamiento := EstacionamientoUNQ new.
unEstudiante := Estudiante new.
otroEstudiante := Estudiante new.
unEstacionamiento registrarA: unEstudiante.
unEstacionamiento registrarA: otroEstudiante.

Assert that: unEstacionamiento cantidadDeEstudiantes isEqualTo: 2! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:46:41'!
test_005_UnEstacionamientoVacioSabeCuantosTrabajadoresTiene

| unEstacionamiento |
unEstacionamiento := EstacionamientoUNQ new.


Assert that: unEstacionamiento cantidadDePersonalUNQ isEqualTo: 0! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:52:42'!
test_006_UnEstacionamientoConDosTrabajadoresSabeCuantosTrabajadoresTiene

| unEstacionamiento otroTrabajador unTrabajador |
unEstacionamiento := EstacionamientoUNQ new.
unTrabajador := PersonalUNQ new.
otroTrabajador := PersonalUNQ new.
unEstacionamiento registrarA: unTrabajador.
unEstacionamiento registrarA: otroTrabajador. 

Assert that: unEstacionamiento cantidadDePersonalUNQ isEqualTo: 2! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:59:35'!
test_007_unClienteCuandoRecienSeRegistraNoTienenNingunVehiculoRegistrado

| unCliente |
unCliente := Estudiante new.

Assert isTrue: (unCliente vehiculos isEmpty)! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:15:22'!
test_008_unClienteRegistraUnVehiculo

| unCliente unVehiculo |
unCliente := Estudiante new.
unVehiculo := Bicicleta new.
unCliente registrarElVehiculo: unVehiculo.

Assert isTrue: (unCliente tieneRegistradoA: unVehiculo )! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:23:40'!
test_009_unEstacionamientoVacioSabeLaCantidadDeVehiculosQueTiene

| unEstacionamiento |
unEstacionamiento := EstacionamientoUNQ new.

Assert that: unEstacionamiento cantidadDeVehiculos isEqualTo: 0 ! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:56:53'!
test_010_unEstacionamientoConDosVehiculosSabeLaCantidadDeVehiculosQueTiene

| unEstacionamiento unCliente otroCliente|
unEstacionamiento := EstacionamientoUNQ new.
unCliente := Estudiante new.
otroCliente := PersonalUNQ new.
unEstacionamiento registrarA: unCliente. 
unEstacionamiento registrarA: otroCliente. 
unCliente registrarElVehiculo: Moto new.
otroCliente registrarElVehiculo: Auto new.

Assert that: unEstacionamiento cantidadDeVehiculos isEqualTo: 2 ! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:53:21'!
test_011_unEstacionamientoVacioSabeSiEsBuenoParaElMedioAmbiente

| unEstacionamiento |
unEstacionamiento := EstacionamientoUNQ new.

Assert isTrue: (unEstacionamiento esBuenoParaElMedioAmbiente) ! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:54:51'!
test_012_unEstacionamientoConUnAutoSabeSiEsBuenoParaElMedioAmbiente

| unEstacionamiento unCliente |
unEstacionamiento := EstacionamientoUNQ new.
unCliente := Estudiante new.
unEstacionamiento registrarA: unCliente. 
unCliente registrarElVehiculo: Auto new.

Assert isFalse: (unEstacionamiento esBuenoParaElMedioAmbiente) ! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:56:35'!
test_013_unEstacionamientoConUnaBicicletaSabeSiEsBuenoParaElMedioAmbiente

| unEstacionamiento unCliente |
unEstacionamiento := EstacionamientoUNQ new.
unCliente := Estudiante new.
unEstacionamiento registrarA: unCliente. 
unCliente registrarElVehiculo: Bicicleta new.

Assert isTrue: (unEstacionamiento esBuenoParaElMedioAmbiente) ! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:59:15'!
test_014_unClienteSinVehiculosSabeSuTarifaTotal

| unCliente |
unCliente := Estudiante new.

Assert that: unCliente tarifaTotal isEqualTo: 0 * peso! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:12:53'!
test_015_unClienteConTresVehiculosSabeSuTarifaTotal

| unCliente |
unCliente := Estudiante new.
unCliente registrarElVehiculo: Moto new.
unCliente registrarElVehiculo: Auto new.
unCliente registrarElVehiculo: Bicicleta new.

Assert that: unCliente tarifaTotal isEqualTo: 400 * peso! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:21:39'!
test_016_unClientePersonalUNQConTresVehiculosSabeSuTarifaTotal

| unCliente |
unCliente := PersonalUNQ new.
unCliente registrarElVehiculo: Moto new.
unCliente registrarElVehiculo: Auto new.
unCliente registrarElVehiculo: Bicicleta new.

Assert that: unCliente tarifaTotal isEqualTo: 900 * peso! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:23:17'!
test_017_unEstacionamientoVacioSabeElTotalRecaudado

| unEstacionamiento |
unEstacionamiento := EstacionamientoUNQ new.
Assert that: unEstacionamiento totalRecaudado isEqualTo: 0 * peso! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:27:16'!
test_018_unEstacionamientoSabeElTotalRecaudado

| unEstacionamiento unCliente otroCliente|
unEstacionamiento := EstacionamientoUNQ new.
unCliente := Estudiante new.
otroCliente := PersonalUNQ new.
unEstacionamiento registrarA: unCliente. 
unEstacionamiento registrarA: otroCliente. 
unCliente registrarElVehiculo: Moto new.
otroCliente registrarElVehiculo: Auto new.

Assert that: unEstacionamiento totalRecaudado isEqualTo: 650 * peso! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:43:07'!
test_019_unEstacionamientoConDosClientesTieneClienteConMayorTarifa

"Asumo que el estacionamiento tiene por lo menos un cliente"
"Cuando dos clientes tienen la misma tarifa total devuelve a uno de los dos"
 
| unEstacionamiento unCliente otroCliente|
unEstacionamiento := EstacionamientoUNQ new.
unCliente := Estudiante new.
otroCliente := PersonalUNQ new.
unEstacionamiento registrarA: unCliente. 
unEstacionamiento registrarA: otroCliente. 
unCliente registrarElVehiculo: Moto new.
otroCliente registrarElVehiculo: Auto new.

Assert that: unEstacionamiento clienteConMayorTarifa isEqualTo: otroCliente.
! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:47:03'!
test_020_unEstacionamientoVacioSabeQueClientesTienenAutos

| resultadoEsperado unEstacionamiento |
unEstacionamiento := EstacionamientoUNQ new.
resultadoEsperado := Set new.

Assert that: unEstacionamiento clientesConAutos isEqualTo: resultadoEsperado! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:55:57'!
test_021_unEstacionamientoConDosClientesSabeQueClientesTienenAutos

| resultadoEsperado unEstacionamiento unCliente otroCliente|
unEstacionamiento := EstacionamientoUNQ new.
unCliente := Estudiante new.
otroCliente := PersonalUNQ new.
unEstacionamiento registrarA: unCliente .
unEstacionamiento registrarA: otroCliente .
unCliente registrarElVehiculo: Auto new.
otroCliente registrarElVehiculo: Auto new.

resultadoEsperado:= Set new.
resultadoEsperado add: unCliente. 
resultadoEsperado add: otroCliente. 


Assert that: unEstacionamiento clientesConAutos isEqualTo: resultadoEsperado! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:04:58'!
test_022_unEstacionamientoVacioSabeQueClientesTienenMotos

| resultadoEsperado unEstacionamiento |
unEstacionamiento := EstacionamientoUNQ new.
resultadoEsperado := Set new.

Assert that: unEstacionamiento clientesConMotos isEqualTo: resultadoEsperado! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:07:00'!
test_023_unEstacionamientoConDosClientesConMotosSabeQueClientesTieneDosMotos

| resultadoEsperado unEstacionamiento unCliente otroCliente|
unEstacionamiento := EstacionamientoUNQ new.
unCliente := Estudiante new.
otroCliente := PersonalUNQ new.
unEstacionamiento registrarA: unCliente .
unEstacionamiento registrarA: otroCliente .
unCliente registrarElVehiculo: Moto new.
otroCliente registrarElVehiculo: Moto new.

resultadoEsperado:= Set new.
resultadoEsperado add: unCliente. 
resultadoEsperado add: otroCliente. 


Assert that: unEstacionamiento clientesConMotos isEqualTo: resultadoEsperado! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:42:16'!
test_024_unClienteCuandoRecibeElBeneficoPaseLibreSuTarifaFinalEsGratis

| unCliente |
unCliente := Estudiante new.
unCliente registrarElVehiculo: Auto new.
unCliente aplicarBeneficioTarifaLibre.

Assert that: unCliente tarifaFinal isEqualTo: 0 * peso! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:38:33'!
test_025_unClienteCuandoRecibeElBeneficoDel25PorcientoSuTarifaFinalEsDel25PorcientoMenos

| unCliente |
unCliente := Estudiante new.
unCliente registrarElVehiculo: Auto new.
unCliente aplicarBeneficio25Porciento.

Assert that: unCliente tarifaFinal isEqualTo: 187.5 * peso! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:55:59'!
test_026_unClienteConBeneficioDel25DeDescuentoSeLeSacaElBeneficio
"Para sacarle el beneficio doy por hecho que lo tiene aplicado" 
| unCliente |
unCliente := Estudiante new.
unCliente registrarElVehiculo: Auto new.
unCliente aplicarBeneficio25Porciento.
unCliente eliminarBeneficio25Porciento.

Assert that: unCliente tarifaFinal isEqualTo: 250 * peso! !

!EstacionamientoTest methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:55:08'!
test_027_unClienteConPaseLibreSeLeEliminiaElBeneficio
"Para sacarle el beneficio doy por hecho que lo tiene aplicado" 
| unCliente |
unCliente := Estudiante new.
unCliente registrarElVehiculo: Auto new.
unCliente aplicarBeneficioTarifaLibre .
unCliente eliminarBeneficioTarifaLibre .

Assert that: unCliente tarifaFinal isEqualTo: 250 * peso! !


!classDefinition: #Clientes category: 'Parcial-TomasNeiraGuitera'!
Object subclass: #Clientes
	instanceVariableNames: 'vehiculos tarifaFinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-TomasNeiraGuitera'!

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:40:31'!
aplicarBeneficio25Porciento
	
	tarifaFinal := self tarifaTotal - (self tarifaTotal * 0.25)! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:41:12'!
aplicarBeneficioTarifaLibre
	 tarifaFinal := self tarifaTotal * 0 * peso! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:53:41'!
eliminarBeneficio25Porciento
	tarifaFinal := self tarifaTotal! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:51:54'!
eliminarBeneficioTarifaLibre
	 tarifaFinal := self tarifaTotal! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:55:43'!
esEstudiante

self subclassResponsibility .! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:56:02'!
esPersonalDeUNQ
	self subclassResponsibility .! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:02:26'!
initialize

vehiculos := Set  new.! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:16:48'!
registrarElVehiculo: unVehiculo 
	vehiculos add: unVehiculo ! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:35:08'!
tarifaFinal
	^tarifaFinal! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:01:26'!
tarifaTotal
	self subclassResponsibility ! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:02:10'!
tieneAuto
	^ vehiculos anySatisfy:[:unVehiculo | unVehiculo esAuto]! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:07:39'!
tieneMoto
	^ vehiculos anySatisfy:[:unVehiculo | unVehiculo esMoto]! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:17:29'!
tieneRegistradoA: unVehiculo 
	^ vehiculos includes: unVehiculo ! !

!Clientes methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:00:22'!
vehiculos
	^ vehiculos ! !


!classDefinition: #Estudiante category: 'Parcial-TomasNeiraGuitera'!
Clientes subclass: #Estudiante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-TomasNeiraGuitera'!

!Estudiante methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:45:29'!
esEstudiante
	^ true! !

!Estudiante methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:56:17'!
esPersonalDeUNQ
	^ false! !

!Estudiante methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:30:09'!
tarifaTotal
	| tarifaTotal |
	tarifaTotal := vehiculos sum:[:unVehiculo | unVehiculo tarifaParaEstudiante] ifEmpty: 0 * peso.
	
	tarifaFinal := tarifaTotal.
	^ tarifaTotal ! !


!classDefinition: #PersonalUNQ category: 'Parcial-TomasNeiraGuitera'!
Clientes subclass: #PersonalUNQ
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-TomasNeiraGuitera'!

!PersonalUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:56:28'!
esEstudiante
	^ false! !

!PersonalUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:52:30'!
esPersonalDeUNQ
	^ true! !

!PersonalUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:19:32'!
tarifaTotal

^ vehiculos sum:[:unVehiculo | unVehiculo tarifaParaPersonalUNQ] ifEmpty: 0 * peso! !


!classDefinition: #EstacionamientoUNQ category: 'Parcial-TomasNeiraGuitera'!
Object subclass: #EstacionamientoUNQ
	instanceVariableNames: 'clientes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-TomasNeiraGuitera'!

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:41:44'!
cantidadDeEstudiantes
	^ self clientesEstudiantes size.! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:47:59'!
cantidadDePersonalUNQ
	^ self clientesPersonalUNQ size.! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:24:47'!
cantidadDeVehiculos
	^ self vehiculosDeLosClientes size.! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:38:09'!
clienteConMayorTarifa
	 ^ clientes detectMax:[:unCliente | unCliente tarifaTotal]! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:28:23'!
clientes
	^ clientes ! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:50:25'!
clientesConAutos
	^ clientes select:[:unCliente | unCliente tieneAuto]! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:05:42'!
clientesConMotos
	^ clientes select:[:unCliente | unCliente tieneMoto]! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:43:27'!
clientesEstudiantes
	^ clientes select:[:unCliente | unCliente esEstudiante]! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:49:05'!
clientesPersonalUNQ
	^ clientes select:[:unCliente | unCliente esPersonalDeUNQ]! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:49:40'!
esBuenoParaElMedioAmbiente
	^ self vehiculosDeLosClientes allSatisfy:[:unVehiculo  | unVehiculo esBicicleta].! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:28:54'!
initialize

clientes := Set new.! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:33:52'!
registrarA: unCliente 
	clientes add: unCliente ! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 14:35:15'!
tieneResgistradoA: unCliente 
	^ clientes includes: unCliente ! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:25:09'!
totalRecaudado
	^ clientes sum:[:unCliente | unCliente tarifaTotal] ifEmpty: 0 * peso! !

!EstacionamientoUNQ methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:32:06'!
vehiculosDeLosClientes
	|vehiculosDeLosClientes|
	vehiculosDeLosClientes := Set new. 
	
	clientes do:[:unCliente | vehiculosDeLosClientes addAll: unCliente vehiculos].

	^ vehiculosDeLosClientes. ! !


!classDefinition: #Vehiculo category: 'Parcial-TomasNeiraGuitera'!
Object subclass: #Vehiculo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-TomasNeiraGuitera'!


!Vehiculo methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:57:16'!
esAuto
	self subclassResponsibility.! !

!Vehiculo methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:55:03'!
esBicicleta
	self subclassResponsibility ! !

!Vehiculo methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:07:58'!
esMoto
	self subclassResponsibility.! !


!classDefinition: #Auto category: 'Parcial-TomasNeiraGuitera'!
Vehiculo subclass: #Auto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-TomasNeiraGuitera'!

!Auto methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:57:41'!
esAuto

^true! !

!Auto methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:55:21'!
esBicicleta
	^ false! !

!Auto methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:08:18'!
esMoto
	^ false.! !

!Auto methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:15:40'!
tarifaParaEstudiante
	^ 250 * peso.! !

!Auto methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:20:54'!
tarifaParaPersonalUNQ
	^ 500 * peso! !


!classDefinition: #Bicicleta category: 'Parcial-TomasNeiraGuitera'!
Vehiculo subclass: #Bicicleta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-TomasNeiraGuitera'!

!Bicicleta methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:57:51'!
esAuto

^false! !

!Bicicleta methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:55:35'!
esBicicleta
	^ true! !

!Bicicleta methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:08:31'!
esMoto
	^ false.! !

!Bicicleta methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:16:22'!
tarifaParaEstudiante
	 ^ 0 * peso! !

!Bicicleta methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:20:31'!
tarifaParaPersonalUNQ
	^ 100 * peso! !


!classDefinition: #Moto category: 'Parcial-TomasNeiraGuitera'!
Vehiculo subclass: #Moto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-TomasNeiraGuitera'!

!Moto methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:57:58'!
esAuto

^false! !

!Moto methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 15:55:26'!
esBicicleta
	^ false! !

!Moto methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 17:08:40'!
esMoto
	^ true.! !

!Moto methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:16:49'!
tarifaParaEstudiante
	 ^ 150 * peso! !

!Moto methodsFor: 'as yet unclassified' stamp: 'tn 11/1/2023 16:20:10'!
tarifaParaPersonalUNQ
	^ 300 * peso! !
