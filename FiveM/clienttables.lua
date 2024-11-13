ClientTables = {}

ClientTables.deatCause = {
	[GetHashKey('WEAPON_UNARMED')] = {'beaten', 'Unarmed'},
	[GetHashKey('WEAPON_CROWBAR')] = {'beaten', 'Crowbar'},
	[GetHashKey('WEAPON_BAT')] = {'beaten', 'Bat'},
	[GetHashKey('WEAPON_GOLFCLUB')] = {'beaten', 'Golfclub'},
	[GetHashKey('WEAPON_HAMMER')] = {'beaten', 'Hammer'},
	[GetHashKey('WEAPON_NIGHTSTICK')] = {'beaten', 'Nightstick'},

	[GetHashKey('WEAPON_MOLOTOV')] = {'torched', 'Molotov'},
	[GetHashKey('WEAPON_FLAREGUN')] = {'torched', 'Flaregun'},

	[GetHashKey('WEAPON_DAGGER')] = {'stabbed', 'Dagger'},
	[GetHashKey('WEAPON_KNIFE')] = {'stabbed', 'Knife'},
	[GetHashKey('WEAPON_SWITCHBLADE')] = {'stabbed', 'Switchblade'},
	[GetHashKey('WEAPON_HATCHET')] = {'stabbed', 'Hatchet'},
	[GetHashKey('WEAPON_BOTTLE')] = {'stabbed', 'Bottle'},

	[GetHashKey('WEAPON_SNSPISTOL')] = {'pistolled', 'SNS Pistol'},
	[GetHashKey('WEAPON_HEAVYPISTOL')] = {'pistolled', 'Heavy Pistol'},
	[GetHashKey('WEAPON_VINTAGEPISTOL')] = {'pistolled', 'Vintage Pistol'},
	[GetHashKey('WEAPON_PISTOL')] = {'pistolled', 'Postol'},
	[GetHashKey('WEAPON_APPISTOL')] = {'pistolled', 'AP Pistol'},
	[GetHashKey('WEAPON_COMBATPISTOL')] = {'pistolled', 'Combat Pistol'},

	[GetHashKey('WEAPON_MICROSMG')] = {'riddled', 'Micro SMG'},
	[GetHashKey('WEAPON_SMG')] = {'riddled', 'SMG'},

	[GetHashKey('WEAPON_CARBINERIFLE')] = {'rifled', 'Carbine Rifle'},
	[GetHashKey('WEAPON_MUSKET')] = {'rifled', 'Musket'},
	[GetHashKey('WEAPON_ADVANCEDRIFLE')] = {'rifled', 'Advanced Rifle'},
	[GetHashKey('WEAPON_ASSAULTRIFLE')] = {'rifled', 'Assult Rifle'},
	[GetHashKey('WEAPON_SPECIALCARBINE')] = {'rifled', 'Special Carbine'},
	[GetHashKey('WEAPON_COMPACTRIFLE')] = {'rifled', 'Compact Rifle'},
	[GetHashKey('WEAPON_BULLPUPRIFLE')] = {'rifled', 'Bullpup Rifle'},

	[GetHashKey('WEAPON_MG')] = {'machine gunned', 'MG'},
	[GetHashKey('WEAPON_COMBATMG')] = {'machine gunned', 'Combat MG'},

	[GetHashKey('WEAPON_BULLPUPSHOTGUN')] = {'pulverized', 'Bullpup Shotgun'},
	[GetHashKey('WEAPON_ASSAULTSHOTGUN')] = {'pulverized', 'Assult Shotgun'},
	[GetHashKey('WEAPON_DBSHOTGUN')] = {'pulverized', 'Double Barrel Shotgun'},
	[GetHashKey('WEAPON_PUMPSHOTGUN')] = {'pulverized', 'Pump Shotgun'},
	[GetHashKey('WEAPON_HEAVYSHOTGUN')] = {'pulverized', 'Heavy Shotgun'},
	[GetHashKey('WEAPON_SAWNOFFSHOTGUN')] = {'pulverized', 'Sawnoff Shotgun'},

	[GetHashKey('WEAPON_MARKSMANRIFLE')] = {'sniped', 'Marksman Rifle'},
	[GetHashKey('WEAPON_SNIPERRIFLE')] = {'sniped', 'Sniper Rifle'},
	[GetHashKey('WEAPON_HEAVYSNIPER')] = {'sniped', 'Heavy Sniper'},
	[GetHashKey('WEAPON_ASSAULTSNIPER')] = {'sniped', 'Assult Sniper'},
	[GetHashKey('WEAPON_REMOTESNIPER')] = {'sniped', 'Remote Sniper'},

	[GetHashKey('WEAPON_GRENADELAUNCHER')] = {'obliterated', 'Grenate Launcher'},
	[GetHashKey('WEAPON_RPG')] = {'obliterated', 'RPG'},
	[GetHashKey('WEAPON_HOMINGLAUNCHER')] = {'obliterated', 'Homming Launcher'},
	[GetHashKey('WEAPON_FIREWORK')] = {'obliterated', 'Firework Launcher'},
	[GetHashKey('VEHICLE_WEAPON_TANK')] = {'obliterated', 'Tank Shell'},

	[GetHashKey('WEAPON_MINIGUN')] = {'shredded', 'Minigun'},

	[GetHashKey('WEAPON_GRENADE')] = {'bombed', 'Grenade'},
	[GetHashKey('WEAPON_PROXMINE')] = {'bombed', 'Proximity Mine'},
	[GetHashKey('WEAPON_EXPLOSION')] = {'bombed', 'Explosion'},
	[GetHashKey('WEAPON_STICKYBOMB')] = {'bombed', 'Sticky Bomb'},
	[GetHashKey('WEAPON_PIPEBOMB')] = {'bombed', 'Pipe Bomb'},

	[GetHashKey('VEHICLE_WEAPON_ROTORS')] = {'mowed Over', 'Helicopter Rotors'},

	[GetHashKey('WEAPON_RUN_OVER_BY_CAR')] = {'flattened', 'Vehicle'},
	[GetHashKey('WEAPON_RAMMED_BY_CAR')] = {'flattened', 'Vehicle'},

	[-842959696] = {'fall', nil}
}