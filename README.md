# ExileTravellingTrader
A travelling trader script for Exile mod.

To add items to the trader, edit Exile_Trader_CommunityCustoms in your mission config.cpp

The script automatically detects the location of Exile Trader zones based on the map markers.

To manually add waypoints, just add map markers of type "o_unknown" in your mission.sqm at 
the position you want the trader to travel to

If you want to modify some settings, take a look at travellingTrader.sqf inside the PBO/source folder "\serverside\travellingTrader.sqf"

If required, add this to the createUnit line in scripts.txt

 !"createUnit [_possiblePosStart, _group, ""trader = this; this disableAI"
