local mods = {
    modEngine = {
        modNum = 11,
        label = "Level",
        parent = "upgradeMenu",
        title = "Engine",
        icon = "gauge",
        price = { 13.95, 32.56, 65.12, 139.53 }
    },
    modBrakes = {
        modNum = 12,
        label = "Level",
        parent = "upgradeMenu",
        title = "Breaks",
        price = { 4.65, 9.3, 18.6, 13.95 }
    },
    modTransmission = {
        modNum = 13,
        label = "Level",
        parent = "upgradeMenu",
        title = "Transmission",
        price = { 13.95, 20.93, 46.51, 63.55 }
    },
    modSuspension = {
        modNum = 15,
        label = "Level",
        parent = "upgradeMenu",
        title = "Suspension",
        price = { 3.72, 7.44, 14.88, 29.77, 40.2 }
    },
    modArmor = {
        modNum = 16,
        label = "Level",
        parent = "upgradeMenu",
        title = "Armor",
        price = { 69.77, 116.28, 130.00, 150.00, 180.00, 190.00 }
    },
    modTurbo = {
        modNum = 18,
        label = "Level",
        parent = "upgradeMenu",
        title = "Turbo",
        price = 55.81
    },
    --- body parts
    modSpoilers = {
        modNum = 0,
        label = "Spoiler",
        parent = "bodyPartsMenu",
        title = "Spoilers",
        icon = "wind",
        price = 4.65
    },
    modFrontBumper = {
        modNum = 1,
        label = "Front Bumper",
        parent = "bodyPartsMenu",
        title = "Front Bumpers",
        icon = "car-rear",
        price = 5.12
    },
    modRearBumper = {
        modNum = 2,
        label = "Rear Bumper",
        parent = "bodyPartsMenu",
        title = "Rear Bumpers",
        icon = "car-rear",
        price = 5.12
    },
    modSideSkirt = {
        modNum = 3,
        label = "Side Skirt",
        parent = "bodyPartsMenu",
        title = "Side Skirt",
        icon = "car-side",
        price = 4.65
    },
    modExhaust = {
        modNum = 4,
        label = "Exhaust",
        parent = "bodyPartsMenu",
        title = "Exhaust",
        icon = "car",
        price = 5.12
    },
    modFrame = {
        modNum = 5,
        label = "Frame",
        parent = "bodyPartsMenu",
        title = "Frame",
        icon = "car",
        price = 5.12
    },
    modGrille = {
        modNum = 6,
        label = "Grille",
        parent = "bodyPartsMenu",
        title = "Grille",
        icon = "car",
        price = 3.72
    },
    modHood = {
        modNum = 7,
        label = "Hood",
        parent = "bodyPartsMenu",
        title = "Hood",
        icon = "car",
        price = 4.88
    },
    modFender = {
        modNum = 8,
        label = "Left Fender",
        parent = "bodyPartsMenu",
        title = "Left Fender",
        icon = "car-side",
        price = 5.12
    },
    modRightFender = {
        modNum = 9,
        label = "Right Fender",
        parent = "bodyPartsMenu",
        title = "Right Fender",
        icon = "car-side",
        price = 5.12
    },
    modRoof = {
        modNum = 10,
        label = "Roof",
        parent = "bodyPartsMenu",
        title = "Roof",
        icon = "car",
        price = 5.58
    },
    modHorns = {
        modNum = 14,
        label = "Horn",
        parent = "cosmeticsMenu",
        title = "Horn",
        icon = "bullhorn",
        price = 1.12
    },
    modXenon = {
        modNum = 22,
        label = "Xenon",
        parent = 'bodyPartsMenu',
        title = "Xenon",
        icon = "lightbulb",
        price = 1.12
    },
    modFrontWheel0 = {
        label = "sport",
        parent = 'wheelsMenu',
        modNum = 23,
        title = "Sport",
        icon = "dharmachakra",
        price = 4.65

    },
    modFrontWheel1 = {
        label = "muscle",
        parent = 'wheelsMenu',
        modNum = 23,
        title = "Muscle",
        icon = "dharmachakra",
        price = 4.65
    },
    modFrontWheel2 = {
        label = "lowrider",
        parent = 'wheelsMenu',
        modNum = 23,
        title = "Lowrider",
        icon = "dharmachakra",
        price = 4.65
    },
    modFrontWheel3 = {
        label = "suv",
        parent = 'wheelsMenu',
        modNum = 23,
        title = "Suv",
        icon = "dharmachakra",
        price = 4.65
    },
    modFrontWheel4 = {
        label = "allterrain",
        parent = 'wheelsMenu',
        modNum = 23,
        title = "Allterrain",
        icon = "dharmachakra",
        price = 4.65
    },
    modFrontWheel5 = {
        label = "tuning",
        parent = 'wheelsMenu',
        modNum = 23,
        title = "Tuning",
        icon = "dharmachakra",
        price = 4.65
    },
    modFrontWheel6 = {
        label = "motorcycle",
        parent = 'wheelsMenu',
        modNum = 23,
        title = "Motorcycle",
        icon = "dharmachakra",
        price = 4.65
    },
    modFrontWheel7 = {
        label = "highend",
        parent = 'wheelsMenu',
        modNum = 23,
        title = "Highend",
        icon = "dharmachakra",
        price = 4.65
    },
    modPlateHolder = {
        modNum = 25,
        label = "Plate holder",
        parent = 'cosmeticsMenu',
        title = "Plate Holders",
        icon = "credit-card",
        price = 3.49
    },
    modVanityPlate = {
        modNum = 26,
        label = "Vanity Plate",
        parent = 'cosmeticsMenu',
        title = "Vanity Plates",
        icon = "credit-card",
        price = 1.1
    },
    modTrimA = {
        modNum = 27,
        label = "Interior",
        parent = 'cosmeticsMenu',
        title = "Interior",
        icon = "couch",
        price = 6.98
    },
    modOrnaments = {
        modNum = 28,
        label = "Trim",
        parent = 'cosmeticsMenu',
        title = "Trim",
        icon = "t",
        price = 0.9
    },
    modDashboard = {
        modNum = 29,
        label = "Dashboard",
        parent = 'cosmeticsMenu',
        title = "Dashboard",
        icon = "car",
        price = 4.65
    },
    modDial = {
        modNum = 30,
        label = "Speedometer",
        parent = 'cosmeticsMenu',
        title = "Speedometer",
        icon = "gauge",
        price = 4.19
    },
    modDoorSpeaker = {
        modNum = 31,
        label = "Door Speaker",
        parent = 'cosmeticsMenu',
        title = "Door Speaker",
        icon = "door-open",
        price = 5.58
    },
    modSeats = {
        modNum = 32,
        label = "Seats",
        parent = 'cosmeticsMenu',
        title = "Seat",
        icon = "chair",
        price = 4.65
    },
    modSteeringWheel = {
        modNum = 33,
        label = "Steering wheel",
        parent = 'cosmeticsMenu',
        title = "Steering wheel",
        icon = "dharmachakra",
        price = 4.19
    },
    modShifterLeavers = {
        modNum = 34,
        label = "Shifter Leavers",
        parent = 'cosmeticsMenu',
        title = "Shifter leavers",
        icon = "gear",
        price = 3.26
    },
    modAPlate = {
        modNum = 35,
        label = "Plate",
        parent = 'cosmeticsMenu',
        title = "Plate",
        icon = "credit-card",
        price = 4.19
    },
    modSpeakers = {
        modNum = 36,
        label = "Speakers",
        parent = 'cosmeticsMenu',
        title = "Speakers",
        icon = "headphones",
        price = 6.98
    },
    modTrunk = {
        modNum = 37,
        label = "Trunk",
        parent = 'cosmeticsMenu',
        title = "Trunk",
        icon = "car-rear",
        price = 5.58
    },
    modHydrolic = {
        modNum = 38,
        label = "Hydrolic",
        parent = 'cosmeticsMenu',
        title = "Hydrolic",
        icon = "h",
        price = 5.12
    },
    modEngineBlock = {
        modNum = 39,
        label = "Engine block",
        parent = 'cosmeticsMenu',
        title = "Engine block",
        icon = "battery-empty",
        price = 5.12
    },
    modAirFilter = {
        modNum = 40,
        label = "Air filter",
        parent = 'cosmeticsMenu',
        title = "Air filter",
        icon = "filter",
        price = 3.72
    },
    modStruts = {
        modNum = 41,
        label = "Struts",
        parent = 'cosmeticsMenu',
        title = "Struts",
        icon = "gear",
        price = 6.51
    },
    modArchCover = {
        modNum = 42,
        label = "Arch Cover",
        parent = 'cosmeticsMenu',
        title = "Arch Cover",
        icon = "bezier-curve",
        price = 4.19
    },
    modAerials = {
        modNum = 43,
        label = "Aerials",
        parent = 'cosmeticsMenu',
        title = "Aerials",
        icon = "signal",
        price = 1.12
    },
    modTrimB = {
        modNum = 44,
        label = "Wings",
        parent = 'cosmeticsMenu',
        title = "Wings",
        icon = "cloud",
        price = 6.05
    },
    modTank = {
        modNum = 45,
        label = "Tank",
        parent = 'cosmeticsMenu',
        title = "Tank",
        icon = "gas-pump",
        price = 4.19
    },
    modWindows = {
        modNum = 46,
        label = "Windows",
        parent = 'cosmeticsMenu',
        title = "Windows",
        icon = "window-maximize",
        price = 4.19
    },
    modLivery = {
        modNum = 48,
        label = "Livery",
        parent = 'cosmeticsMenu',
        title = "Livery",
        icon = "spray-can-sparkles",
        price = 9.3
    },

    plateIndex = {
        modNum = "plateIndex",
        label = "plate",
        parent = 'bodyPartsMenu',
        title = "Plate",
        icon = "credit-card",
        price = 1.1
    },
}


return mods
