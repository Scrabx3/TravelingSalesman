;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_TravelingSalesmanMain_02000008 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TravelingSalesman
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelingSalesman Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Matlara
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Matlara Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HelgenInn
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HelgenInn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefaultLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DefaultLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JonnaMorthal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JonnaMorthal Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Debug.Trace("[Salesman] Start")
Actor salesman = Alias_TravelingSalesman.GetActorRef()
String plugin = "AlternatePerspective.esp"
If (Game.GetModByName(plugin) != 255)
	Location loc = Game.GetFormFromFile(0xAA20, plugin) as Location
	Alias_HelgenInn.ForceLocationTo(loc)
	salesman.MoveTo(Alias_Matlara.GetRef())
Else
	salesman.MoveTo(Alias_JonnaMorthal.GetRef())
EndIf
salesman.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
