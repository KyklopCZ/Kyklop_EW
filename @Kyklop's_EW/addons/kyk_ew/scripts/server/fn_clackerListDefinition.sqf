if(isServer) then
{
	kyk_ew_clackers = [
	"ace_m26_clacker",
	"ace_cellphone"
	];
	
	//Format: [jammer type, information level, name displayed in alert]
	//Information level: 0 - covert (no alert), 1 - no direction information, 2 - N/E/S/W direction information, 3 - approximate direction in degrees
	kyk_ew_clackersProperties = [
	[3, 3, "RF Detonator"],
	[2, 2, "GSM"]
	];
	
	publicVariable "kyk_ew_clackers";
	publicVariable "kyk_ew_clackersProperties";
};