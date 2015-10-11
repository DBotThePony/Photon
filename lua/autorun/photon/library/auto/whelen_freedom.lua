AddCSLuaFile()

local A = "AMBER"
local R = "RED"
local DR = "D_RED"
local B = "BLUE"
local W = "WHITE"
local CW = "C_WHITE"
local SW = "S_WHITE"
local G = "GREEN"
local RB = "BLUE/RED"

local name = "Whelen Ultra Freedom"

local COMPONENT = {}

COMPONENT.Model = "models/schmal/whelen_freedom/freedom_lightbar.mdl"
COMPONENT.Lightbar = true
COMPONENT.Skin = 0
COMPONENT.Bodygroups = {}
COMPONENT.DefaultColors = {
	[1] = "RED",
	[2] = "BLUE",
	[3] = "AMBER",
	[4] = "AMBER",
}

COMPONENT.Meta = {
	freedom_f_main = {
		AngleOffset = -90,
		W = 8.2,
		H = 7.5,
		Sprite = "sprites/emv/emv_whelen_src",
		WMult = 1,
		Scale = 1.4
	},
	freedom_takedown = {
		AngleOffset = -90,
		W = 7,
		H = 7,
		Sprite = "sprites/emv/freedom_takedown",
		WMult = 1,
		Scale = 2.5
	},
	freedom_alley = {
		AngleOffset = -90,
		W = 4.2,
		H = 4.2,
		Sprite = "sprites/emv/emv_whelen_tri",
		WMult = 1,
		Scale = 1.2
	},
	freedom_f_ang = {
		AngleOffset = -90,
		W = 16,
		H = 15,
		Sprite = "sprites/emv/emv_whelen_corner",
		WMult = 2,
		Scale = 1.6,
		VisRadius = 0
	},
	freedom_r_ang = {
		AngleOffset = 90,
		W = 16,
		H = 15,
		Sprite = "sprites/emv/emv_whelen_corner",
		WMult = 2,
		Scale = 1.6
	},
	freedom_r_main = {
		AngleOffset = 90,
		W = 8.2,
		H = 7.5,
		Sprite = "sprites/emv/emv_whelen_src",
		WMult = 1,
		Scale = 1.4
	},
}

COMPONENT.Positions = {

	[1] = { Vector( -3.67, 7.7, 0 ), Angle( 0, 0, 0 ), "freedom_f_main" },
	[2] = { Vector( 3.67, 7.7, 0 ), Angle( 0, 0, 0 ), "freedom_f_main" },

	[3] = { Vector( -10.27, 7.7, 0 ), Angle( 0, 0, 0 ), "freedom_f_main" },
	[4] = { Vector( 10.27, 7.7, 0 ), Angle( 0, 0, 0 ), "freedom_f_main" },

	[5] = { Vector( -26.47, 5.01, 0 ), Angle( 0, 33, 0 ), "freedom_f_ang" },
	[6] = { Vector( 26.47, 5.01, 0 ), Angle( 0, -33, 0 ), "freedom_f_ang" },

	[7] = { Vector( -26.47, -4.69, 0 ), Angle( 0, -33, 0 ), "freedom_r_ang" },
	[8] = { Vector( 26.47, -4.69, 0 ), Angle( 0, 33, 0 ), "freedom_r_ang" },

	[9] = { Vector( -16.89, -7.38, 0 ), Angle( 0, 0, 0 ), "freedom_r_main" },
	[10] = { Vector( 16.89, -7.38, 0 ), Angle( 0, 0, 0 ), "freedom_r_main" },

	[11] = { Vector( -10.27, -7.38, 0 ), Angle( 0, 0, 0 ), "freedom_r_main" },
	[12] = { Vector( 10.27, -7.38, 0 ), Angle( 0, 0, 0 ), "freedom_r_main" },

	[13] = { Vector( -3.67, -7.38, 0 ), Angle( 0, 0, 0 ), "freedom_r_main" },
	[14] = { Vector( 3.67, -7.38, 0 ), Angle( 0, 0, 0 ), "freedom_r_main" },

	[15] = { Vector( -3.67, 7.7, 2.27 ), Angle( 0, 0, 0 ), "freedom_f_main" },
	[16] = { Vector( 3.67, 7.7, 2.27 ), Angle( 0, 0, 0 ), "freedom_f_main" },

	[17] = { Vector( -10.27, 7.7, 2.27 ), Angle( 0, 0, 0 ), "freedom_f_main" },
	[18] = { Vector( 10.27, 7.7, 2.27 ), Angle( 0, 0, 0 ), "freedom_f_main" },

	[19] = { Vector( -26.47, 5.01, 2.27 ), Angle( 0, 33, 0 ), "freedom_f_ang" },
	[20] = { Vector( 26.47, 5.01, 2.27 ), Angle( 0, -33, 0 ), "freedom_f_ang" },

	[21] = { Vector( -26.47, -4.69, 2.27 ), Angle( 0, -33, 0 ), "freedom_r_ang" },
	[22] = { Vector( 26.47, -4.69, 2.27 ), Angle( 0, 33, 0 ), "freedom_r_ang" },

	[23] = { Vector( -16.89, -7.38, 2.27 ), Angle( 0, 0, 0 ), "freedom_r_main" },
	[24] = { Vector( 16.89, -7.38, 2.27 ), Angle( 0, 0, 0 ), "freedom_r_main" },

	[25] = { Vector( -10.27, -7.38, 2.27 ), Angle( 0, 0, 0 ), "freedom_r_main" },
	[26] = { Vector( 10.27, -7.38, 2.27 ), Angle( 0, 0, 0 ), "freedom_r_main" },

	[27] = { Vector( -3.67, -7.38, 2.27 ), Angle( 0, 0, 0 ), "freedom_r_main" },
	[28] = { Vector( 3.67, -7.38, 2.27 ), Angle( 0, 0, 0 ), "freedom_r_main" },

	[29] = { Vector( -31.35, 0.12, 2.17 ), Angle( 0, 90, 0 ), "freedom_alley" },
	[30] = { Vector( 31.35, 0.12, 2.17 ), Angle( 0, -90, 0 ), "freedom_alley" },

	[31] = { Vector( -31.35, 0.12,-.1 ), Angle( 0, 90, 0 ), "freedom_alley" },
	[32] = { Vector( 31.35, 0.12, -.1 ), Angle( 0, -90, 0 ), "freedom_alley" },

	[33] = { Vector( -17.47, 7.91, 1.03 ), Angle( 0, 0, 0 ), "freedom_takedown" },
	[34] = { Vector( 17.47, 7.91, 1.03 ), Angle( 0, 0, 0 ), "freedom_takedown" },
}

COMPONENT.Sections = {
	["auto_whelen_ultra_freedom"] = {
		[1] = {
			{ 1, R }, { 2, B }, { 3, R }, { 4, B }, { 5, R }, { 6, B }, { 7, R }, { 8, B }, { 9, R }, { 10, B }, { 11, R }, { 12, B }, { 13, R }, { 14, B },
			{ 15, R }, { 16, B }, { 17, R }, { 18, B }, { 19, R }, { 20, B }, { 21, R }, { 22, B }, { 23, R }, { 24, B }, { 25, R }, { 26, B }, { 27, R }, { 28, B },
			{ 29, W }, { 30, W }, { 31, W }, { 32, W }, { 33, CW }, { 34, CW }, 
		},
		[2] = {
			{ 1, "_1" }, { 3, "_1" }, { 5, "_1" }, { 7, "_1" }, { 9, "_1" }
		},
		[3] = {
			{ 2, "_2" }, { 4, "_2" }, { 6, "_2" }, { 8, "_2" }, { 10, "_2" }
		},
		[4] = {
			{ 15, "_1" }, { 17, "_1" }, { 19, "_1" }, { 21, "_1" }, { 23, "_1" }
		},
		[5] = {
			{ 16, "_2" }, { 18, "_2" }, { 20, "_2" }, { 22, "_2" }, { 24, "_2" },
		},
		[6] = {
			{ 11, "_3" }, { 13, "_3" }, { 25, "_3" }, { 27, "_3" },
		},
		[7] = {
			{ 12, "_4" }, { 14, "_4" }, { 26, "_4" }, { 28, "_4" },
		},
	},
	["auto_whelen_ultra_freedom_m_inner"] = {
		[1] = { { 3, "_1" }, { 17, "_1" }, { 9, "_1" }, { 23, "_1" } },
		[2] = { { 4, "_2" }, { 18, "_2" }, { 10, "_2" }, { 24, "_2" } },
		[3] = { { 1, "_1" }, { 15, "_1" } },
		[4] = { { 2, "_2" }, { 16, "_2" } },

		[5] = { { 1, "_1" }, { 3, "_1" }, { 9, "_1" } },
		[6] = { { 2, "_2" }, { 4, "_2" }, { 10, "_2" } },

		[7] = { { 15, "_1" }, { 17, "_1" }, { 23, "_1" } },
		[8] = { { 16, "_2" }, { 18, "_2" }, { 24, "_2" } },

		[9] = { { 1, "_1" }, { 17, "_1" }, { 9, "_1" } },
		[10] = { { 15, "_1" }, { 3, "_1" }, { 23, "_1" } },

		[11] = { { 2, "_2" }, { 18, "_2" }, { 10, "_2" } },
		[12] = { { 16, "_2" }, { 4, "_2" }, { 24, "_2" } },
	},
	["auto_whelen_ultra_freedom_outer"] = {
		[1] = { { 5, "_1" }, { 19, "_1" }, { 8, "_2" }, { 22, "_2" } },
		[2] = { { 7, "_1" }, { 21, "_1" }, { 6, "_2" }, { 20, "_2" } },
		[3] = { { 5, "_1" }, { 21, "_1" }, { 20, "_2" }, { 8, "_2" } },
		[4] = { { 19, "_1" }, { 7, "_1" }, { 6, "_2" }, { 22, "_2 " } }
	},
	["auto_whelen_ultra_freedom_illum"] = {
		[1] = { { 33, CW }, { 34, CW } },
		[2] = { { 33, CW } },
		[3] = { { 34, CW } },
	}
}

COMPONENT.Patterns = {
	["auto_whelen_ultra_freedom"] = {
		["all"] = { 1 },
		["code2"] = {
			{ 3, 4 }, 0, { 3, 4 }, 0, { 3, 4 }, 0, { 2, 5 }, 0, { 2, 5 }, 0, { 2, 5 }, 0,
			{ 3, 4 }, 0, { 3, 4 }, 0, { 3, 4 }, 0, { 2, 5 }, 0, { 2, 5 }, 0, { 2, 5 }, 0,
			{ 3, 4 }, 0, { 3, 4 }, 0, { 3, 4 }, 0, { 2, 5 }, 0, { 2, 5 }, 0, { 2, 5 }, 0,
			{ 3, 4 }, { 3, 4 }, { 3, 4 }, 0, { 2, 5 }, { 2, 5 }, { 2, 5 }, 0,
			{ 3, 4 }, { 3, 4 }, { 3, 4 }, 0, { 2, 5 }, { 2, 5 }, { 2, 5 }, 0,
			{ 3, 4 }, { 3, 4 }, { 3, 4 }, 0, { 2, 5 }, { 2, 5 }, { 2, 5 }, 0,
		}
	},
	["auto_whelen_ultra_freedom_m_inner"] = {
		["code1"] = {
			{ 1, 4 }, { 1, 4 }, { 1, 4 }, { 1, 4 }, 0,
			{ 2, 3 }, { 2, 3 }, { 2, 3 }, { 2, 3 }, 0,
			{ 1, 4 }, { 1, 4 }, { 1, 4 }, { 1, 4 }, 0,
			{ 2, 3 }, { 2, 3 }, { 2, 3 }, { 2, 3 }, 0,
			{ 1, 3 }, { 1, 3 }, { 1, 3 }, 0,
			{ 2, 4 }, { 2, 4 }, { 2, 4 }, 0,
			{ 1, 3 }, { 1, 3 }, { 1, 3 }, 0,
			{ 2, 4 }, { 2, 4 }, { 2, 4 }, 0,
			{ 1, 3 }, { 1, 3 }, { 1, 3 }, 0,
			{ 2, 4 }, { 2, 4 }, { 2, 4 }, 0,
			{ 1, 3 }, { 1, 3 }, { 1, 3 }, 0,
			{ 2, 4 }, { 2, 4 }, { 2, 4 }, 0,
			{ 1, 3 }, { 1, 3 }, { 1, 3 }, 0,
			{ 2, 4 }, { 2, 4 }, { 2, 4 }, 0,
			{ 1, 3 }, { 1, 3 }, { 1, 3 }, 0,
			{ 2, 4 }, { 2, 4 }, { 2, 4 }, 0,
		},
		["code2"] = {
			{ 5, 8 }, 0, { 5, 8 }, 0, { 5, 8 }, { 5, 8 }, { 5, 8 },
			{ 6, 7 }, 0, { 6, 7 }, 0, { 6, 7 }, { 6, 7 }, { 6, 7 }, 
		},
		["code3"] = {
			{ 1, 3 }, 0, { 2, 4 }, 0, { 1, 3 }, 0, { 2, 4 }, 0, { 1, 3 }, 0, { 2, 4 }, 0, 
			{ 1, 3 }, 0, { 2, 4 }, 0, { 1, 3 }, 0, { 2, 4 }, 0, { 1, 3 }, 0, { 2, 4 }, 0, 
			{ 1, 3 }, 0, { 2, 4 }, 0, { 1, 3 }, 0, { 2, 4 }, 0, { 1, 3 }, 0, { 2, 4 }, 0, 
			{ 1, 3 }, { 1, 3 }, { 1, 3 }, { 2, 4 }, { 2, 4 }, { 2, 4 },
			{ 1, 3 }, { 1, 3 }, { 1, 3 }, { 2, 4 }, { 2, 4 }, { 2, 4 },
			{ 1, 3 }, { 1, 3 }, { 1, 3 }, { 2, 4 }, { 2, 4 }, { 2, 4 },
			{ 1, 3 }, { 1, 3 }, { 1, 3 }, { 2, 4 }, { 2, 4 }, { 2, 4 },
		}
	},
	["auto_whelen_ultra_freedom_outer"] = {
		["code1"] = {
			1, 1, 1, 1, 2, 2, 2, 2,
			1, 1, 1, 1, 2, 2, 2, 2,
			1, 1, 1, 1, 2, 2, 2, 2,
			1, 1, 1, 2, 2, 2,
			1, 1, 1, 2, 2, 2,
			1, 1, 1, 2, 2, 2,
			1, 1, 1, 2, 2, 2,
			1, 1, 1, 2, 2, 2,
			1, 1, 2, 2,
			1, 1, 2, 2,
			1, 1, 2, 2,
			1, 1, 2, 2,
			1, 1, 2, 2,
			1, 1, 2, 2,
			1, 1, 2, 2,
		},
		["code2"] = {
			3, 0, 3, 0, 3, 3, 3, 3, 4, 0, 4, 0, 4, 4, 4, 4,
			3, 0, 3, 0, 3, 3, 3, 3, 4, 0, 4, 0, 4, 4, 4, 4,
			3, 0, 3, 0, 3, 3, 3, 3, 4, 0, 4, 0, 4, 4, 4, 4,
			3, 3, 0, 4, 4, 0,
			3, 3, 0, 4, 4, 0,
			3, 3, 0, 4, 4, 0,
			3, 3, 0, 4, 4, 0,
			3, 0, 3, 0, 4, 0, 4, 0,
			3, 0, 3, 0, 4, 0, 4, 0,
			3, 0, 3, 0, 4, 0, 4, 0,
			3, 0, 3, 0, 4, 0, 4, 0,
		},
		["code3"] = {
			1, 0, 1, 0, 1, 0, 2, 0, 2, 0, 2, 0,
			1, 0, 1, 0, 1, 0, 2, 0, 2, 0, 2, 0,
			1, 0, 1, 0, 1, 0, 2, 0, 2, 0, 2, 0,
			1, 1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 2, 
			1, 1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 2, 
			1, 1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 2,
		}
	},
	["auto_whelen_ultra_freedom_illum"] = {
		["code3"] = { 2, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0 }
	}
}

COMPONENT.TrafficDisconnect = { 

}

COMPONENT.Modes = {
	Primary = {
			M1 = {
				["auto_whelen_ultra_freedom_outer"] = "code1",	
				["auto_whelen_ultra_freedom_m_inner"] = "code1",
			},
			M2 = {
				["auto_whelen_ultra_freedom_outer"] = "code2",
				["auto_whelen_ultra_freedom_m_inner"] = "code2",	
			},
			M3 = {
				["auto_whelen_ultra_freedom_outer"] = "code3",
				["auto_whelen_ultra_freedom_m_inner"] = "code3",
				["auto_whelen_ultra_freedom_illum"] = "code3"
			}
		},
	Auxiliary = {
			L = {},
			R = {},
			D = {}
		},
	Illumination = {
		T = {
		}
	}
}

EMVU:AddAutoComponent( COMPONENT, name )