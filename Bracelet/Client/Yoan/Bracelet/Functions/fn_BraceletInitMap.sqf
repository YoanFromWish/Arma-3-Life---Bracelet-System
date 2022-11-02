/*___________________________________
|									 |
|		Autheur : Yoan Verquion      |
|		Pour : AlsariaLife           |
|		Scripts : Bracelet System    |
|___________________________________*/

private ["_markers"];
_markers = [];
if (visibleMap) then {
    {
        if (_x getVariable ["Yoan_Bracelet",false]) then {
            _marker = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
            _marker setMarkerColorLocal "ColorBlue";
            _marker setMarkerTypeLocal "Mil_dot";
            _marker setMarkerTextLocal format["Bracelet : %1 - Temps Restant : %2 heures ",(name _x), (_x getVariable ["Yoan_Bracelet_Time",0])];

            _markers pushBack [_marker,_x];
        };
    } forEach allPlayers;

    while {visibleMap} do {
        {
            private ["_unit"];
            _unit = _x#1;
            if (!isNil "_unit" && !isNull _unit) then {
                if !((_unit getVariable ["Yoan_Bracelet_Time",0]) == 0) then {
                    (_x#0) setMarkerPosLocal (visiblePosition _unit);
                    (_x#0) setMarkerTextLocal format["Bracelet : %1 - Temps Restant : %2 heures ",(name _unit), (_unit getVariable ["Yoan_Bracelet_Time",0])];
                } else {
                    deleteMarkerLocal (_x#0);
                };
                
            };
        } forEach _markers;
        if (!visibleMap) exitWith {};
        sleep 0.02;
    };

    {deleteMarkerLocal (_x select 0);} forEach _markers;
    _markers = [];
};
