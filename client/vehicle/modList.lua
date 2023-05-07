local mods = {
    modEngine = {
        modNum = 11,
        label = "Level",
        parent = "upgradeMenu",
        title = "Engine",
        icon = "gauge"
    },
    modBrakes = {
        modNum = 12,
        label = "Level",
        parent = "upgradeMenu",
        title = "Breaks"
    },
    modTransmission = {
        modNum = 13,
        label = "Level",
        parent = "upgradeMenu",
        title = "Transmission"
    },
    modSuspension = {
        modNum = 15,
        label = "Level",
        parent = "upgradeMenu",
        title = "Suspension"
    },
    modArmor = {
        modNum = 16,
        label = "Level",
        parent = "upgradeMenu",
        title = "Armor"
    },
    modTurbo = {
        modNum = 18,
        label = "Level",
        parent = "upgradeMenu",
        title = "Turbo"
    },
    --- body parts
    modSpoilers = {
        modNum = 0,
        label = "Spoiler",
        parent = "bodyPartsMenu",
        title = "Spoilers",
        icon = "wind"
    },
    modFrontBumper = {
        modNum = 1,
        label = "Front Bumper",
        parent = "bodyPartsMenu",
        title = "Front Bumpers",
        icon = "car-rear"
    },
    modRearBumper = {
        modNum = 2,
        label = "Rear Bumper",
        parent = "bodyPartsMenu",
        title = "Rear Bumpers",
        icon = "car-rear"
    },
    modSideSkirt = {
        modNum = 3,
        label = "Side Skirt",
        parent = "bodyPartsMenu",
        title = "Side Skirt",
        icon = "car-side"
    },
    modExhaust = {
        modNum = 4,
        label = "Exhaust",
        parent = "bodyPartsMenu",
        title = "Exhaust",
        icon = "car"
    },
    modFrame = {
        modNum = 5,
        label = "Frame",
        parent = "bodyPartsMenu",
        title = "Frame",
        icon = "car"
    },
    modGrille = {
        modNum = 6,
        label = "Grille",
        parent = "bodyPartsMenu",
        title = "Grille",
        icon = "car"
    },
    modHood = {
        modNum = 7,
        label = "Hood",
        parent = "bodyPartsMenu",
        title = "Hood",
        icon = "car"
    },
    modFender = {
        modNum = 8,
        label = "Left Fender",
        parent = "bodyPartsMenu",
        title = "Left Fender",
        icon = "car-side"
    },
    modRightFender = {
        modNum = 9,
        label = "Right Fender",
        parent = "bodyPartsMenu",
        title = "Right Fender",
        icon = "car-side"
    },
    modRoof = {
        modNum = 10,
        label = "Roof",
        parent = "bodyPartsMenu",
        title = "Roof",
        icon = "car"
    },
    modHorns = {
        modNum = 14,
        label = "Horn",
        parent = "cosmeticsMenu",
        title = "Horn",
        icon = "bullhorn"
    },
    modXenon = {
		modNum = 22,
		label = "Xenon",
		parent = 'bodyPartsMenu',
        title = "Xenon",
        icon = "lightbulb"
	},
    modFrontWheel0 = {
		label = "sport",
		parent = 'wheelsMenu',
		modNum = 23,
		title = "Sport",
        icon = "dharmachakra"
	},
	modFrontWheel1 = {
		label = "muscle",
		parent = 'wheelsMenu',
		modNum = 23,
		title = "Muscle",
        icon = "dharmachakra"

	},
	modFrontWheel2 = {
		label = "lowrider",
		parent = 'wheelsMenu',
		modNum = 23,
		title = "Lowrider",
        icon = "dharmachakra"

	},
	modFrontWheel3 = {
		label = "suv",
		parent = 'wheelsMenu',
		modNum = 23,
		title = "Suv",
        icon = "dharmachakra"

	},
	modFrontWheel4 = {
		label = "allterrain",
		parent = 'wheelsMenu',
		modNum = 23,
		title = "Allterrain",
        icon = "dharmachakra"

	},
	modFrontWheel5 = {
		label = "tuning",
		parent = 'wheelsMenu',
		modNum = 23,
		title = "Tuning",
        icon = "dharmachakra"

	},
	modFrontWheel6 = {
		label = "motorcycle",
		parent = 'wheelsMenu',
		modNum = 23,
		title = "Motorcycle",
        icon = "dharmachakra"

	},
	modFrontWheel7 = {
		label = "highend",
		parent = 'wheelsMenu',
		modNum = 23,
        title = "Highend",
        icon = "dharmachakra"

	},
    modPlateHolder = {
		modNum = 25,
		label = "Plate holder",
		parent = 'cosmeticsMenu',
        title = "Plate Holders",
        icon = "credit-card"
	},
    modVanityPlate = {
		modNum = 26,
		label = "Vanity Plate",
		parent = 'cosmeticsMenu',
        title = "Vanity Plates",
        icon = "credit-card"
	},
    modTrimA = {
		modNum = 27,
		label = "Interior",
		parent = 'cosmeticsMenu',
        title = "Interior",
        icon = "couch"
	},
    modOrnaments = {
		modNum = 28,
		label = "Trim",
		parent = 'cosmeticsMenu',
        title = "Trim",
        icon = "t"
	},
    modDashboard = {
		modNum = 29,
		label = "Dashboard",
		parent = 'cosmeticsMenu',
        title = "Dashboard",
        icon = "car"
	},
    modDial = {
		modNum = 30,
		label = "Speedometer",
		parent = 'cosmeticsMenu',
        title = "Speedometer",
        icon = "gauge"
	},
    modDoorSpeaker = {
		modNum = 31,
		label = "Door Speaker",
		parent = 'cosmeticsMenu',
        title = "Door Speaker",
        icon = "door-open"
	},
    modSeats = {
		modNum = 32,
		label = "Seats",
		parent = 'cosmeticsMenu',
        title = "Seat",
        icon = "chair"
	},
    modSteeringWheel = {
		modNum = 33,
		label = "Steering wheel",
		parent = 'cosmeticsMenu',
        title = "Steering wheel",
        icon = "dharmachakra"
	},
    modShifterLeavers = {
		modNum = 34,
		label = "Shifter Leavers",
		parent = 'cosmeticsMenu',
        title = "Shifter leavers",
        icon = "gear"
	},
    modAPlate = {
		modNum = 35,
		label = "Plate",
		parent = 'cosmeticsMenu',
        title = "Plate",
        icon = "credit-card"
	},
    modSpeakers = {
		modNum = 36,
		label = "Speakers",
		parent = 'cosmeticsMenu',
        title = "Speakers",
        icon = "headphones"
	},
    modTrunk = {
		modNum = 37,
		label = "Trunk",
		parent = 'cosmeticsMenu',
        title = "Trunk",
        icon = "car-rear"
	},
    modHydrolic = {
		modNum = 38,
		label = "Hydrolic",
		parent = 'cosmeticsMenu',
        title = "Hydrolic",
        icon = "h"
	},
    modEngineBlock = {
		modNum = 39,
		label = "Engine block",
		parent = 'cosmeticsMenu',
        title = "Engine block",
        icon = "battery-empty"
	},
    modAirFilter = {
		modNum = 40,
		label = "Air filter",
		parent = 'cosmeticsMenu',
        title = "Air filter",
        icon = "filter"
	},
    modStruts = {
		modNum = 41,
		label = "Struts",
		parent = 'cosmeticsMenu',
        title = "Struts",
        icon = "gear"
	},
    modArchCover = {
		modNum = 42,
		label = "Arch Cover",
		parent = 'cosmeticsMenu',
        title = "Arch Cover",
        icon = "bezier-curve"
	},
    modAerials = {
		modNum = 43,
		label = "Aerials",
		parent = 'cosmeticsMenu',
        title = "Aerials",
        icon = "signal"
	},
    modTrimB = {
		modNum = 44,
		label = "Wings",
		parent = 'cosmeticsMenu',
        title = "Wings",
        icon = "cloud"
	},
    modTank = {
		modNum = 45,
		label = "Tank",
		parent = 'cosmeticsMenu',
        title = "Tank",
        icon = "gas-pump"
	},
    modWindows = {
		modNum = 46,
		label = "Windows",
		parent = 'cosmeticsMenu',
        title = "Windows",
        icon = "window-maximize"
	},
    modLivery = {
		modNum = 48,
		label = "Livery",
		parent = 'cosmeticsMenu',
        title = "Livery",
        icon = "spray-can-sparkles"
	},

    plateIndex = {
		modNum = "plateIndex",
		label = "plate",
		parent = 'bodyPartsMenu',
        title = "Plate",
        icon = "credit-card"
	},
}


return mods