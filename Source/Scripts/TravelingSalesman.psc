Scriptname TravelingSalesman extends ReferenceAlias

GlobalVariable Property DrawCost Auto
MiscObject Property Gold001 Auto

LeveledItem[] lvlItms
GlobalVariable[] Property lvlItmsThere Auto
int Property COCO_Idx = 0 AutoReadOnly Hidden
int Property DX_Idx = 1 AutoReadOnly Hidden
int Property Ninirim_Idx = 2 AutoReadOnly Hidden

LeveledItem Function GetForm(String asPlugin, int aiFormID)
  If (Game.GetModByName(asPlugin) != 255)
    return Game.GetFormFromFile(aiFormID, asPlugin) as LeveledItem
  EndIf
  return none
EndFunction

Event OnLoad()
  lvlItms = new LeveledItem[3]
  lvlItms[COCO_Idx] = GetForm("COCO AIO LVLI Distribution.esp", 0x819)
  lvlItms[DX_Idx] = GetForm("DX AIO LVLI Distribution.esp", 0x900)
  lvlItms[Ninirim_Idx] = GetForm("Ninirim AIO LVLI Distribution.esp", 0x85F)
  lvlItmsThere[COCO_Idx].SetValue((lvlItms[COCO_Idx] != none) as float)
  lvlItmsThere[DX_Idx].SetValue((lvlItms[DX_Idx] != none) as float)
  lvlItmsThere[Ninirim_Idx].SetValue((lvlItms[Ninirim_Idx] != none) as float)
EndEvent

Function DrawDemo(ObjectReference akTargetContainer)
  int i = Utility.RandomInt(0, 2)
  DrawArmor(i, akTargetContainer)
EndFunction

Function DrawArmor(int aiArmorIDX, ObjectReference akTargetContainer)
  If (aiArmorIDX < 0 || aiArmorIDX >= lvlItms.Length)
    Debug.Trace("[Salesman] Invalid Argument, Index: " + aiArmorIDX + "/" + (lvlItms.Length - 1))
    return
  EndIf
  Form[] list = SPE_Form.FlattenLeveledList(lvlItms[aiArmorIDX])
  If (!list.Length)
    Debug.Trace("[Salesman] ItemList at Index " + aiArmorIDX + " is empty")
    return
  EndIf
  If (Utility.RandomInt(0, 3) < 3)
    Form[] containerforms = akTargetContainer.GetContainerForms()
    Form[] newlist = SPE_Utility.FilterArray_Form(list, containerforms)
    If (newlist.Length)
      list = newlist
    EndIf
  EndIf
  int r = Utility.RandomInt(0, list.Length - 1)
  akTargetContainer.RemoveItem(Gold001, DrawCost.GetValueInt())
  akTargetContainer.AddItem(list[r])
EndFunction
