/*___________________________________
|									 |
|		Autheur : Yoan Verquion      |
|		Pour : AlsariaLife           |
|		Scripts : Bracelet System    |
|___________________________________*/

params [
	["_time",0,[0]],
	["_civ",objNull,[objNull]],
	["_cop",objNull,[objNull]],
	["_for","connect",["connect"]]
];
switch (_for) do {
    case "connect": {
        _query = format["SELECT tempsRestant FROM bracelet WHERE uid='%1'",(getPlayerUID _civ)];
        _queryResult = [_query,2] call DB_fnc_asyncCall;
        _ResultArray = parseSimpleArray format["%1",_queryResult];
        if (_ResultArray#0 > 0) then {
            _civ setVariable ["Yoan_Bracelet",true,TRUE];
            _civ setVariable ["Yoan_Bracelet_Time",_ResultArray#0,TRUE];
        };
    };
    case "add": {
        _query = format["INSERT INTO bracelet (uid, gendarme, tempsRestant) VALUES ('%1', '%2', '%3');",(getPlayerUID _civ),(getPlayerUID _cop),_time];
        [_query,1] call DB_fnc_asyncCall;
        _civ setVariable ["Yoan_Bracelet",true,TRUE];
        _civ setVariable ["Yoan_Bracelet_Time",_time,TRUE];
        format["Un bracelet vous à été ajouté pendant %1 heures",_time] remoteExec ["hint",_civ];

    };
    case "remove": {
        _query = format["DELETE FROM `bracelet` WHERE uid=%1",(getPlayerUID _civ)];
        [_query,1] call DB_fnc_asyncCall;
        _civ setVariable ["Yoan_Bracelet",false,TRUE];
        _civ setVariable ["Yoan_Bracelet_Time",0,TRUE];
        ["Votre bracelet à été retiré"] remoteExec ["hint",_civ]; 
    };    
};