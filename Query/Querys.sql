--------------------------------------------------------------------------------------------------------------------------------------------------
 --2.1.Deuda total de Tarjeta de Crédito por Franquicia.
--------------------------------------------------------------------------------------------------------------------------------------------------
 Create Procedure DeudaPorFranquicia
 as
 (
  Select 
   Fr.Nombre as Franquicia,
   Sum(Tc.CupoAprobado) - Sum(Tc.CupoDisponible)  as DeudaFrancia,
   Count(*) as CantidadTarjetas
  From TarjetaCrédito Tc
  Inner Join Franquicias Fr On Fr.Id =  Tc.FranquiciaId
  group by Fr.Nombre, Fr.Id
)

--------------------------------------------------------------------------------------------------------------------------------------------------
--2.2.Cliente con mayor Saldo en Canje.
--------------------------------------------------------------------------------------------------------------------------------------------------
 
Select
	Top 1
	Psn.Nombre as PersonaNombre,
	Ca.SaldoCanje as SaldoCanje
From CuentaAhorro as Ca
Inner Join Titular as Tl On Tl.CuentaAhorroId = Ca.NumeroCuenta
Inner Join Personas as Psn On TL.PersonaId = Psn.Id
Order by Ca.SaldoCanje desc



--------------------------------------------------------------------------------------------------------------------------------------------------
--2.3.Cliente con mayor saldo retirado de una Cuenta de Ahorros en un periodo
--determinado. (Por fecha de transacción).
--------------------------------------------------------------------------------------------------------------------------------------------------

	Select 
		Top 1
		Ca.NumeroCuenta as NumeroCuenta,
		Psn.Nombre as NombreTitula,
		(Ma.Valor) as ValorRetiro
	From MovimientosAhorro as MA 
	Inner Join TiposDeMoviemientos as TDM On TDM.Id = MA.TiposDeMoviemientosId
	and TDM.Nombre = 'Retiro'
	Inner Join  CuentaAhorro CA  On Ma.CuentaAhorroNumeroCuenta = Ca.NumeroCuenta
	Inner Join Titular as Tl On Tl.CuentaAhorroId = CA.NumeroCuenta
	Inner Join Personas as Psn On Tl.PersonaId = Psn.Id

	Where (Ma.Fecha >= '2020-11-24' and Ma.Fecha<= '2020-11-25')
	Group by  Ca.NumeroCuenta,Psn.Nombre ,Ma.Valor
	Order by Ma.Valor desc


--------------------------------------------------------------------------------------------------------------------------------------------------
---QUERY 2.4.Cuenta de Ahorro con mayor número de titulares.
--------------------------------------------------------------------------------------------------------------------------------------------------
Select
	Top 1
	NumeroCuentaAhorro,
	Max(CantidadDeTitulares) as TotalTitulares
From
(
	Select
		Tl.CuentaAhorroId as NumeroCuentaAhorro,
		Count(*) as CantidadDeTitulares
	From Titular TL
	Group by Tl.CuentaAhorroId
)TitularesPorCuenta
Group by NumeroCuentaAhorro
Order by TotalTitulares desc

--------------------------------------------------------------------------------------------------------------------------------------------------
---QUERY 2.5.Saldo Total de todas las cuentas de ahorro de un cliente.
--------------------------------------------------------------------------------------------------------------------------------------------------

Select 
	Tl.PersonaId as PersonaId,
	Psn.Nombre as PersonaNombre,
	Sum(Ca.SaldoDisponible) as SaldoDisponibleTotal,
	Count(*) as CantidadDeTarjetas
From Titular TL
Inner Join CuentaAhorro as CA On CA.NumeroCuenta = TL.CuentaAhorroId
Inner Join Personas as Psn On Psn.Id = Tl.PersonaId
Group by Tl.PersonaId, Psn.Nombre

--------------------------------------------------------------------------------------------------------------------------------------------------
---QUERY 2.6.Numero de Cuentas de Ahorro activas de clientes extranjeros.
--------------------------------------------------------------------------------------------------------------------------------------------------

Select 
	CA.NumeroCuenta as NumeroCuenta,
	Psn.Id as PersonaId
From Titular TL
Inner Join CuentaAhorro as CA On CA.NumeroCuenta = TL.CuentaAhorroId
and CA.Estado = 1
Inner Join  Personas as Psn On Psn.Id= TL.PersonaId
Inner Join PersonaNatural as PN On PN.PersonaId = Psn.Id
Inner Join TiposDocumento as TD On TD.Id = PN.TipoDocumentoId
and TD.Nombre in ('Pasaporte','Cedula de Extranjería')

--------------------------------------------------------------------------------------------------------------------------------------------------

--2.7.Listado de Accionistas que son clientes con su correspondiente Saldo Total de Deuda
--de todas las tarjetas de crédito cuyo Saldo Total de Deuda sea mayor a UN MILLÓN
--DE PESOS.
--------------------------------------------------------------------------------------------------------------------------------------------------
Select 
	*
From
(
	Select 
		PersonaId,
		PersonaNombre,
		Sum(Deuda) as DeudaTotal
	From 
	(
		Select 
			Tc.PersonaId as PersonaId,
			Pn.Nombre as PersonaNombre,
			((Tc.CupoAprobado) - (Tc.CupoDisponible)) as Deuda
		From TarjetaCrédito as TC 
		Inner Join Accionistas as ACC ON  ACC.PersonaId = TC.PersonaId
		Inner Join Personas as PN ON PN.Id = TC.PersonaId
		Group by Tc.PersonaId,Pn.Nombre, Tc.Id
				,Tc.CupoAprobado, Tc.CupoDisponible

	)AccionistasDeudores
	Group by PersonaId, PersonaNombre

) AccionesConDeudaSuperior
Where DeudaTotal > 1000000