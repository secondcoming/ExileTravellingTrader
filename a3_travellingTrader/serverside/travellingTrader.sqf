/** ROAMING TRADER by JohnO **/
// Trader vehicle handling added by second_coming 

diag_log format['[travellingtrader] Started'];

if (!isServer) exitWith {};

_world = (toLower worldName);

// Default to Chernarus
_spawnCenter = [7652.9634, 7870.8076,0];
_max = 7500;
_wayPointOne = getMarkerPos "NEAF Aircraft Traders";
_wayPointTwo = getMarkerPos "Stary Traders";
_wayPointThree = [11591,3388,0]; // Near Otmel
_wayPointFour = getMarkerPos "Bash Traders";

if (_world isEqualTo 'altis') then 
{
	_spawnCenter = [15834.2,15787.8,0];
	_max = 9000;
	_wayPointOne = getMarkerPos "AlmyraTraders";
	_wayPointTwo = getMarkerPos "TraderCityMarker";
	_wayPointThree = getMarkerPos "NorthZarosTraders";
	_wayPointFour = getMarkerPos "TraderZoneSilderas";
};
 
_min = 1500; // minimum distance from the center position (Number) in meters
_mindist = 20; // minimum distance from the nearest object (Number) in meters, ie. create waypoint this distance away from anything within x meters..
_water = 0; // water mode 0: cannot be in water , 1: can either be in water or not , 2: must be in water
_shoremode = 0; // 0: does not have to be at a shore , 1: must be at a shore

_possiblePosStart = [_wayPointOne,100,300,_mindist,_water,20,_shoremode] call BIS_fnc_findSafePos; //Use this if you want a completely random spawn location

// Create the trader and ensure he doest react to gunfire or being shot at.

_group = createGroup resistance;
_group setCombatMode "BLUE";

"Exile_Trader_CommunityCustoms" createUnit [_possiblePosStart, _group, "trader = this; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this disableAI 'SUPPRESSION'; "];
trader allowDamage false; 
removeGoggles trader;
trader forceAddUniform "U_IG_Guerilla3_1";
trader addVest "V_TacVest_blk_POLICE";
trader addBackpack "B_FieldPack_oli";
trader addHeadgear "H_Cap_blk";
trader setCaptive true;

// Spawn Traders Vehicle
_vehicleObject = createVehicle ["rhs_uaz_open_vdv", _possiblePosStart, [], 0, "CAN_COLLIDE"];
clearBackpackCargoGlobal _vehicleObject;
clearItemCargoGlobal _vehicleObject;
clearMagazineCargoGlobal _vehicleObject;
clearWeaponCargoGlobal _vehicleObject;
_vehicleObject setVariable ["ExileIsPersistent", false];
_vehicleObject setFuel 1;

diag_log format['[ExileTravellingTrader] Vehicle spawned @ %1',_possiblePosStart];

_vehicleObject addEventHandler ["HandleDamage", {
_amountOfDamage = 0;
_amountOfDamage
}];

trader assignasdriver _vehicleObject;
[trader] orderGetin true;
 
_wp1 = _group addWaypoint [_wayPointOne, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "SAFE";
_wp1 setWaypointspeed "LIMITED";
 
_wp2 = _group addWaypoint [_wayPointTwo, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "SAFE";
_wp2 setWaypointspeed "LIMITED";
 
_wp3 = _group addWaypoint [_wayPointThree, 0];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointBehaviour "SAFE";
_wp3 setWaypointspeed "LIMITED";
 
_wp4 = _group addWaypoint [_wayPointFour, 0];
_wp4 setWaypointType "MOVE";
_wp4 setWaypointBehaviour "SAFE";
_wp4 setWaypointspeed "LIMITED";
 
_wp5 = _group addWaypoint [_wayPointOne, 0];
_wp5 setWaypointType "CYCLE";
_wp5 setWaypointBehaviour "SAFE";
_wp5 setWaypointspeed "LIMITED";

_traderPos = position trader;
_mk = createMarker ["TraderLocation",_traderPos];
"TraderLocation" setMarkerType "mil_warning";
"TraderLocation" setMarkerText "Travelling Trader";

// Make trader will stand still when players near him.
while {true} do
	{
		_pos = position _vehicleObject;
		_mk setMarkerPos _pos;
		_requiredMin = 2;
		_nearPlayers = (count (_pos nearEntities [['Man'],25]));
		
		if(trader in _vehicleObject) then
		{			 
			_requiredMin = 1;
		};
		
		if (_nearPlayers >= _requiredMin) then
		{
			[trader] orderGetin false;
			uiSleep 0.5;
			_vehicleObject setVehicleLock "LOCKED";
			_vehicleObject setFuel 0;
			trader action ["LightOff", trader];	
			trader action ["salute", trader];		
			trader disableAI "MOVE";
			uiSleep 5;
		}
		else
		{	
			trader assignasdriver _vehicleObject;
			[trader] orderGetin true;
			_vehicleObject setFuel 1;
			_vehicleObject setVehicleLock "UNLOCKED";
			uiSleep 0.5;
			trader moveInDriver _vehicleObject;
			trader action ["LightOn", trader];	
			trader enableAI "MOVE";
		};
		
		uiSleep 5;
		if(!Alive trader)exitWith {};
	};		
	