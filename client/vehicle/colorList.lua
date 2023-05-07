-- https://pastebin.com/pwHci0xK
local colors = {
    pearlescent = {
        {
            category = "black",
            color = "black",
            colors = {
                { index = 0, label = "black", iconColor = "#030303"},
                { index = 1, label = "graphite", iconColor = "#251607 "},
                { index = 2, label = "black_metallic", iconColor = "#131618"},
                { index = 3, label = "caststeel", iconColor = "#3a3c40"},
                { index = 11, label = "black_anth", iconColor = "#383e42"},
                { index = 12, label = "matteblack", iconColor = "#28282B"},
                { index = 15, label = "darknight", iconColor = "#23383f"},
                { index = 16, label = "deepblack", iconColor = "#000000"},
                { index = 21, label = "oil", iconColor = "#373A36"},
                { index = 147, label = "carbon", iconColor = "#625D5D"}
            }
        },
        {
            category = "white",
            color = "white",
            colors = {
                { index = 106, label = "vanilla", iconColor = "#F3E5AB"},
                { index = 107, label = "creme", iconColor = "#FFFDD0"},
                { index = 111, label = "white", iconColor = "#FFFFFF"},
                { index = 112, label = "polarwhite", iconColor = "#E2E0D6"},
                { index = 113, label = "beige", iconColor = "#f5f5dc"},
                { index = 121, label = "mattewhite", iconColor = "#FFFFFF"},
                { index = 122, label = "snow", iconColor = "#fffafa"},
                { index = 131, label = "cotton", iconColor = "#bfad9d"},
                { index = 132, label = "alabaster", iconColor = "#EDEADE"},
                { index = 134, label = "purewhite", iconColor = "#FFFFFF"}
            }    
        },
        {
            category = "grey",
            color = "grey",
            colors = {
                { index = 4, label = "silver", iconColor = "#C0C0C0"},
                { index = 5, label = "metallicgrey", iconColor = "#8D918D"},
                { index = 6, label = "laminatedsteel", iconColor = "#948c7e"},
                { index = 7, label = "darkgray", iconColor = "#5A5A5A"},
                { index = 8, label = "rockygray", iconColor = "#5E6B6C"},
                { index = 9, label = "graynight", iconColor = "#676767"},
                { index = 10, label = "aluminum", iconColor = "#848789"},
                { index = 13, label = "graymat", iconColor = "#7B7B7C"},
                { index = 14, label = "lightgrey", iconColor = "#D3D3D3"},
                { index = 17, label = "asphaltgray", iconColor = "#6F6E63"},
                { index = 18, label = "grayconcrete", iconColor = "#808076"},
                { index = 19, label = "darksilver", iconColor = "#71706E"},
                { index = 20, label = "magnesite", iconColor = "#5d7a78"},
                { index = 22, label = "nickel", iconColor = "#727472"},
                { index = 23, label = "zinc", iconColor = "#bac4c8"},
                { index = 24, label = "dolomite", iconColor = "#444953"},
                { index = 25, label = "bluesilver", iconColor = "#5f6c81"},
                { index = 26, label = "titanium", iconColor = "#878681"},
                { index = 66, label = "steelblue", iconColor = "#4682b4"},
                { index = 93, label = "champagne", iconColor = "#F7E7CE"},
                { index = 144, label = "grayhunter", iconColor = "#808080"},
                { index = 156, label = "grey", iconColor = "#808080"}
            }    
        },
        {
            category = "red",
            color = "red",
            colors = {
                { index = 27, label = "red", iconColor = "#FF0000"},
                { index = 28, label = "torino_red", iconColor = "#bf0010"},
                { index = 29, label = "poppy", iconColor = "#E35335"},
                { index = 30, label = "copper_red", iconColor = "#cb6d51"},
                { index = 31, label = "cardinal", iconColor = "#C41E3A"},
                { index = 32, label = "brick", iconColor = "#AA4A44"},
                { index = 33, label = "garnet", iconColor = "#9A2A2A"},
                { index = 34, label = "cabernet", iconColor = "#280008"},
                { index = 35, label = "candy", iconColor = "#ffbcd9"},
                { index = 39, label = "matte_red", iconColor = "#FF0000"},
                { index = 40, label = "dark_red", iconColor = "#8B0000"},
                { index = 43, label = "red_pulp", iconColor = "#c70000"},
                { index = 44, label = "bril_red", iconColor = "#c70000"},
                { index = 46, label = "pale_red", iconColor = "#D9544D"},
                { index = 143, label = "wine_red", iconColor = "#b11226"},
                { index = 150, label = "volcano", iconColor = "#4E2728"}
            }
        },
        {
            category = "pink",
            color = "pink",
            colors = {
                { index = 135, label = "electricpink", iconColor = "#f62681"},
                { index = 136, label = "salmon", iconColor = "#FA8072"},
                { index = 137, label = "sugarplum", iconColor = "#914E75"}
            }
        },
        {
            category = "blue",
            color = "blue",
            colors = {
                { index = 54, label = "topaz", iconColor = "#426f7e"},
                { index = 60, label = "light_blue", iconColor = "#ADD8E6"},
                { index = 61, label = "galaxy_blue", iconColor = "#394361"},
                { index = 62, label = "dark_blue", iconColor = "#00008B"},
                { index = 63, label = "azure", iconColor = "#007fff"},
                { index = 64, label = "navy_blue", iconColor = "#000080"},
                { index = 65, label = "lapis", iconColor = "#26619c"},
                { index = 67, label = "blue_diamond", iconColor = "#4EE2EC"},
                { index = 68, label = "surfer", iconColor = "#01a4a5"},
                { index = 69, label = "pastel_blue", iconColor = "#AEC6CF"},
                { index = 70, label = "celeste_blue", iconColor = "#b2ffff"},
                { index = 73, label = "rally_blue", iconColor = "#0e4bef"},
                { index = 74, label = "blue_paradise", iconColor = "#5484AA"},
                { index = 75, label = "blue_night", iconColor = "#074355"},
                { index = 77, label = "cyan_blue", iconColor = "#00FFFF"},
                { index = 78, label = "cobalt", iconColor = "#0047AB"},
                { index = 79, label = "electric_blue", iconColor = "#7DF9FF"},
                { index = 80, label = "horizon_blue", iconColor = "#86B3D1"},
                { index = 82, label = "metallic_blue", iconColor = "#32527B"},
                { index = 83, label = "aquamarine", iconColor = "#7FFFD4"},
                { index = 84, label = "blue_agathe", iconColor = "#B5E1E9"},
                { index = 85, label = "zirconium", iconColor = "#57FEFF"},
                { index = 86, label = "spinel", iconColor = "#995763"},
                { index = 87, label = "tourmaline", iconColor = "#92C1C0"},
                { index = 127, label = "paradise", iconColor = "#BED3DE"},
                { index = 140, label = "bubble_gum", iconColor = "#ffc1cc"},
                { index = 141, label = "midnight_blue", iconColor = "#191970"},
                { index = 146, label = "forbidden_blue", iconColor = "#191970"},
                { index = 157, label = "glacier_blue", iconColor = "#729DC8"}
            }
        },
        {
            category = "yellow",
            color = "yellow",
            colors = {
                { index = 42, label = "yellow", iconColor = "#FFFF00"},
                { index = 88, label = "wheat", iconColor = "#F5DEB3"},
                { index = 89, label = "raceyellow", iconColor = "#f5d365 "},
                { index = 91, label = "paleyellow", iconColor = "#FDFD96"},
                { index = 126, label = "lightyellow", iconColor = "#ffffe0"}
            }
        },
        {
            category = "green",
            color = "green",
            colors = {
                { index = 49, label = "met_dark_green", iconColor = "#013220"},
                { index = 50, label = "rally_green", iconColor = "#7ec083 "},
                { index = 51, label = "pine_green", iconColor = "#01796f"},
                { index = 52, label = "olive_green", iconColor = "#808000"},
                { index = 53, label = "light_green", iconColor = "#6aab8e"},
                { index = 55, label = "lime_green", iconColor = "#32cd32"},
                { index = 56, label = "forest_green", iconColor = "#228b22"},
                { index = 57, label = "lawn_green", iconColor = "#7CFC00"},
                { index = 58, label = "imperial_green", iconColor = "#081b1a"},
                { index = 59, label = "green_bottle", iconColor = "#051F19"},
                { index = 92, label = "citrus_green", iconColor = "#96D406"},
                { index = 125, label = "green_anis", iconColor = "#BEC8B9"},
                { index = 128, label = "khaki", iconColor = "#728639"},
                { index = 133, label = "army_green", iconColor = "#4b5320"},
                { index = 151, label = "dark_green", iconColor = "#013220"},
                { index = 152, label = "hunter_green", iconColor = "#355E3B"},
                { index = 155, label = "matte_foilage_green", iconColor = "#7e8772"}
            }
        },
        {
            category = "orange",
            color = "orange",
            colors = {
                { index = 36, label = "tangerine", iconColor = "#F28500"},
                { index = 38, label = "orange", iconColor = "#FFA500"},
                { index = 41, label = "matteorange", iconColor = "#FFA500"},
                { index = 123, label = "lightorange", iconColor = "#FFD580"},
                { index = 124, label = "peach", iconColor = "#FFE5B4"},
                { index = 130, label = "pumpkin", iconColor = "#FF7518"},
                { index = 138, label = "orangelambo", iconColor = "#e46400"}
            }
        },
        {
            category = "brown",
            color = "brown",
            colors = {
                { index = 45, label = "copper", iconColor = "#b87333"},
                { index = 47, label = "lightbrown", iconColor = "#C4A484"},
                { index = 48, label = "darkbrown", iconColor = "#5C4033"},
                { index = 90, label = "bronze", iconColor = "#CD7F32"},
                { index = 94, label = "brownmetallic", iconColor = "#ac4313"},
                { index = 95, label = "expresso", iconColor = "#4E2A2A"},
                { index = 96, label = "chocolate", iconColor = "#7B3F00"},
                { index = 97, label = "terracotta", iconColor = "#E2725B"},
                { index = 98, label = "marble", iconColor = "#566D7E"},
                { index = 99, label = "sand", iconColor = "#C2B280"},
                { index = 100, label = "sepia", iconColor = "#704214"},
                { index = 101, label = "bison", iconColor = "#003A63"},
                { index = 102, label = "palm", iconColor = "#6f9940"},
                { index = 103, label = "caramel", iconColor = "#85461e"},
                { index = 104, label = "rust", iconColor = "#B7410E"},
                { index = 105, label = "chestnut", iconColor = "#954535"},
                { index = 108, label = "brown", iconColor = "#964B00"},
                { index = 109, label = "hazelnut", iconColor = "#ae9f80"},
                { index = 110, label = "shell", iconColor = "#fbce07"},
                { index = 114, label = "mahogany", iconColor = "#C04000"},
                { index = 115, label = "cauldron", iconColor = "#5f4e48"},
                { index = 116, label = "blond", iconColor = "#faf0be"},
                { index = 129, label = "gravel", iconColor = "#53544E"},
                { index = 153, label = "darkearth", iconColor = "#786c5e"},
                { index = 154, label = "desert", iconColor = "#FAD5A5"}
            }
        },
        {
            category = "purple",
            color = "purple",
            colors = {
                { index = 71, label = "indigo", iconColor = "#4B0082"},
                { index = 72, label = "deeppurple", iconColor = "#36013F"},
                { index = 76, label = "darkviolet", iconColor = "#9400d3"},
                { index = 81, label = "amethyst", iconColor = "#9966cc"},
                { index = 142, label = "mysticalviolet", iconColor = "#9f97b1"},
                { index = 145, label = "purplemetallic", iconColor = "#5b0a91"},
                { index = 148, label = "matteviolet", iconColor = "#E3D9E1"},
                { index = 149, label = "mattedeeppurple", iconColor = "#5F396A"}
            }
        },
        {
            category = "chrome",
            color = "chrome",
            colors = {
                { index = 117, label = "brushedchrome", iconColor = "#E8E3DA"},
                { index = 118, label = "blackchrome", iconColor = "#626569"},
                { index = 119, label = "brushedaluminum", iconColor = "#E6EDf5"},
                { index = 120, label = "chrome", iconColor = "#dbe4eb"}
            }
        },
        {
            category = "gold",
            color = "gold",
            colors = {
                { index = 37, label = "gold", iconColor = "#FFD700"},
                { index = 158, label = "puregold", iconColor = "#d3ad7e"},
                { index = 159, label = "brushedgold", iconColor = "#FFD700"},
                { index = 160, label = "lightgold", iconColor = "#FDDC5C"}
            }
        }
    },
    xenon = {
        {label = "white", index = 0}, iconColor = "#FFFFFF",
		{label = "blue", index = 1, iconColor = "#0000FF"},
		{label = "electric_blue", index = 2, iconColor = "#7DF9FF"},
		{label = "mintgreen", index = 3, iconColor = "#3EB489"},
		{label = "lime_green", index = 4, iconColor = "#32CD32"},
		{label = "yellow", index = 5, iconColor = "#FFFF00"},
		{label = "goldenshower", index = 6, iconColor = "#FFBB34"},
		{label = "orange", index = 7, iconColor = "#FFA500"},
		{label = "red", index = 8, iconColor = "#FF0000"},
		{label = "ponypink", index = 9, iconColor = "#EFCFE2"},
		{label = "hotpink", index = 10, iconColor = "#FF69B4"},
		{label = "purple", index = 11, iconColor = "#A020F0"},
		{label = "blacklight", index = 12, iconColor = "#cb3562"},
        {label = "default", index = -1, iconColor = "#FFFF33"},
    }
}


return colors
