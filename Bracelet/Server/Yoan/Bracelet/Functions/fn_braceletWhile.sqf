for "_i" from 0 to 1 step 0 do {
    uiSleep (60 * 60);
    ["CALL braceletTimeUpdate",1] call DB_fnc_asyncCall;
    {
        if (_x getVariable ["Yoan_Bracelet",false]) then {
            _tr = _x getVariable ["Yoan_Bracelet_Time",0];
            _tr = _tr - 1;
            if !(_tr == 0 ) then {
                _x setVariable ["Yoan_Bracelet_Time",_tr,TRUE];
            } else {
                [0,_x,_x,"remove"] spawn Yoan_Server_fnc_braceletGetData;
            };

        };
    } forEach allPlayers;

};
