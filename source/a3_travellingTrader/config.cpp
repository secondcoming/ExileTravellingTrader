class CfgPatches {
	class a3_travellingTrader {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};
class CfgFunctions {
	class Boopdedoop {
		class main {
			file = "\x\addons\a3_travellingTrader\init";
			class init {
				postInit = 1;
			};
		};
	};
};

