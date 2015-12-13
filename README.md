# ExileTravellingTrader
A travelling trader script for Exile mod

You will need to adjust the waypoints to match the marker names or fixed positions on your map in travellingTrader.sqf

_world = (toLower worldName);

	// Default to Chernarus
	_spawnCenter = [7652.9634, 7870.8076,0];
	_max = 7500;
	_wayPointOne = getMarkerPos "NEAF Aircraft Traders";
	_wayPointTwo = [11430,11384,0]; // Near Klen
	_wayPointThree = [13463,6298,0]; // Solnichniy
	_wayPointFour = [11591,3388,0]; // Near Otmel
	_wayPointFive = [1930,2246,0]; // Kamenka
	_wayPointSix = [4221,11697,0]; // Near Bash
	_wayPointSeven = getMarkerPos "Stary Traders";
	_wayPoints = [_wayPointOne,_wayPointTwo,_wayPointThree,_wayPointFour,_wayPointFive,_wayPointSix,_wayPointSeven,_wayPointOne];

if (_world isEqualTo 'altis') then 
{
	_spawnCenter = [15834.2,15787.8,0];
	_max = 9000;
	_wayPointOne = getMarkerPos "AlmyraTraders";
	_wayPointTwo = getMarkerPos "TraderCityMarker";
	_wayPointThree = getMarkerPos "NorthZarosTraders";
	_wayPointFour = getMarkerPos "TraderZoneSilderas";
	_wayPoints = [_wayPointOne,_wayPointTwo,_wayPointThree,_wayPointFour,_wayPointOne];
};
