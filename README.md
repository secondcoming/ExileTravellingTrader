# ExileTravellingTrader
A travelling trader script for Exile mod.

To add items to the trader, edit Exile_Trader_CommunityCustoms in your mission config.cpp

You will need to adjust the waypoints to match the marker names or fixed positions on your map in travellingTrader.sqf


	_wayPointOne = [getMarkerPos "NEAF Aircraft Traders","MOVE"];
	_wayPointTwo =[[11430,11384,0],"MOVE"]; // Near Klen
	_wayPointThree = [[13463,6298,0],"MOVE"]; // Solnichniy
	_wayPointFour = [[11591,3388,0],"MOVE"]; // Near Otmel
	_wayPointFive = [[1930,2246,0],"MOVE"]; // Kamenka
	_wayPointSix = [[4221,11697,0],"MOVE"]; // Near Bash
	_wayPointSeven = [getMarkerPos "Stary Traders","MOVE"];
	_wayPointEight = [getMarkerPos "NEAF Aircraft Traders","CYCLE"];
	_wayPoints = [_wayPointOne,_wayPointTwo,_wayPointThree,_wayPointFour,_wayPointFive,_wayPointSix,_wayPointSeven,_wayPointEight];
	
The last waypoint needs to be of type "CYCLE" otherwise the trader will get to the last waypoint and just sit there until next server restart.

If required, add this to the createUnit line in scripts.txt

 !"createUnit [_possiblePosStart, _group, ""trader = this; this disableAI"
