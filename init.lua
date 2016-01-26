--[[
  ## StreetsMod 2.0 ##
  Submod: streetsmod
  Optional: false
  Category: Init
]]

print("[Mod][StreetsMod] Loading...")
-- Register a global streets namespace to operate in
streets = {}

-- Config stuff goes here
streets.conf = {
  version = "2.0",
  licenseCode = "",
  licenseMedia = "CC-BY-SA 3.0",
  modpath = minetest.get_modpath("streets")
}

-- The API collects some data here
streets.api = {
  register_road_surfaces = {},
  register_road_markings = {}
}

-- Load the API file
dofile(streets.conf.modpath .. "/api.lua")

-- Load mod files
streets.load_submod("streets_roadsurface")
streets.load_submod("streets_roadmarkings")

-- Let the API register everything and finish the setup
dofile(streets.conf.modpath .. "/api_register_all.lua")