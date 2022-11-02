/*___________________________________
|									 |
|		Autheur : Yoan Verquion      |
|		Pour : AlsariaLife           |
|		Scripts : Bracelet System    |
|___________________________________*/

disableSerialization;
_Valid = params [
    ["_civ",objNull,[objNull]],
    ["_cop",objNull,[objNull]]
];

if !(_Valid) exitWith {};
if !(playerSide == WEST) exitWith {};

createDialog "yoan_bracelet_add";

// set all controls
_Display = (findDisplay 995621);
_validate = _Display displayCtrl 8823;
_time = _Display displayCtrl 9922;
_msg = _Display displayCtrl 9921;

_msg ctrlSetText "Combien de temps voulez vous ajouter le bracelet ?";


lbClear _time;
{
    _time lbAdd format["%1 heures",_x];
    _time lbSetdata [(lbSize _time)-1,str(_x)];
} forEach [12,24,36,48,72];
_time lbSetCurSel 0;
_validate buttonSetAction format["[(parseNumber(lbData [9922, (lbCurSel 9922)])),%1,%2,'add'] remoteExec [""Yoan_Server_fnc_braceletGetData"",2]",_civ,_cop];

