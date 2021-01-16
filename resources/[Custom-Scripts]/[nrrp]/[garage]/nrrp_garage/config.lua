Config = {}

Config.RangeCheck = 25.0 
Config.Garages = {
	["A"] = {
		["positions"] = {
			["menu"] = {
				["position"] = vector3(213.8, -809.00, 31.00)
			},
			["vehicle"] = {
				["position"] = vector3(231.48, -797.75, 30.56), 
				["heading"] = 159.29
			}
		},
		
		["camera"] = { 
			["x"] = 231.94, 
			["y"] = -803.61, 
			["z"] = 32.51, 
			["rotationX"] = -30.401574149728, 
			["rotationY"] = 00.0, 
			["rotationZ"] = 0.75157422423 
		} 
	}, 

    ["B"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(273.67422485352, -344.15573120117, 44.919834136963)
            },
            ["vehicle"] = {
                ["position"] = vector3(272.50082397461, -337.40579223633, 44.919834136963), 
                ["heading"] = 160.0
            }
        },
        ["camera"] = { 
            ["x"] = 283.28225708008, 
            ["y"] = -333.24017333984, 
            ["z"] = 50.004745483398, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 125.73228356242 
        }
    },

    ["C"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-1803.8967285156, -341.45928955078, 43.986347198486)
            },
            ["vehicle"] = {
                ["position"] = vector3(-1810.7857666016, -337.13592529297, 43.552074432373), 
                ["heading"] = 320.0
            }
			

        },
        ["camera"] = { 
            ["x"] = -1813.5513916016, 
            ["y"] = -340.40087890625, 
            ["z"] = 46.962894439697, 
            ["rotationX"] = -39.496062710881, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -42.110235854983 
        } 
    },


	["D"] = {
		["positions"] = {
			["menu"] = {
				["position"] = vector3(1036.09, -763.36, 57.99)
			},
			["vehicle"] = {
				["position"] = vector3(1022.06, -763.88, 57.95), 
				["heading"] = 319.3
			}
		},
		["camera"] = {  
			["x"] = 1023.97, 
			["y"] = -756.88062744141, 
			["z"] = 59.571212768555, 
			["rotationX"] = -35.401574149728, 
			["rotationY"] = 0.0, 
			["rotationZ"] = 180.40157422423 
		} 
	},
	
	["E"] = {
		["positions"] = {
			["menu"] = {
				["position"] = vector3(1970.08, 3773.41, 32.19)
			},
			["vehicle"] = {
				["position"] = vector3(1952.09, 3764.69, 32.21), 
				["heading"] = 319.3
			}
		},
		["camera"] = {  
			["x"] = 1953.44,
			["y"] = 3755.86, 
			["z"] = 32.2, 
			
		} 
	},
	
	["F"] = {
		["positions"] = {
			["menu"] = {
				["position"] = vector3(120.1, 6626.92, 31.95)
			},
			["vehicle"] = {
				["position"] = vector3(121.35, 6599.34, 32), 
				["heading"] = 88
			}
		},
		["camera"] = {  
			["x"] = 121.32,
			["y"] = 6590.57, 
			["z"] = 32.04,
			
		},
	},


    ["Barco"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-734.872, -1325.817, 1.595),
                ["text"] = "[ ~o~E~s~ ] Garagem",
            },
            ["vehicle"] = {
                ["position"] = vector3(-721.329, -1348.540, 0.970), 
                ["heading"] = 137.780,
                ["text"] = "[ ~o~E~s~ ] Guardar Veículo",
            }
        },
        ["camera"] = { 
            ["x"] = -709.066, 
            ["y"] = -1348.404, 
            ["z"] = 5.970, 
            ["rotationX"] = -29.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 100.73228356242 
        }
    },

    ["Aviao_Heli"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-1237.556, -3384.547, 13.940),
                ["text"] = "[ ~o~E~s~ ] Garagem",
            },
            ["vehicle"] = {
                ["position"] = vector3(-1275.560, -3388.017, 14.240), 
                ["heading"] = 328.940,
                ["text"] = "[ ~o~E~s~ ] Guardar Veículo",
            }
        },
        ["camera"] = { 
            ["x"] = -1301.229, 
            ["y"] = -3385.397, 
            ["z"] = 24.265, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -87.73228356242 
        }
    },

    ["Camiao"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(913.513, -1273.216, 27.092),
                ["text"] = "[ ~o~E~s~ ] Garagem",
            },
            ["vehicle"] = {
                ["position"] = vector3(912.942, -1259.862, 25.731), 
                ["heading"] = 5.744,
                ["text"] = "[ ~o~E~s~ ] Guardar Veículo",
            }
        },
        ["camera"] = { 
            ["x"] = 901.102, 
            ["y"] = -1256.479, 
            ["z"] = 31.271, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -120.73228356242 
        }
    }
}


Config.Trim = function(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end

Config.AlignMenu = "center" 