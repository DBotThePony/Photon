--[[-- Serverside Vehicle Metafunctions
@copyright Photon Team
@release v74 Hot Sulphur Springs
@author Photon Team
@module ent
--]]--

local ent = FindMetaTable("Vehicle")

--- A generic combined getter/setter for NW2Vars.
-- @string key Data key for the data to be assigned to.
-- @string type Type of data to be set.
-- @param default[opt] Value to be returned if the entity is invalid.
-- @param val[opt] Value to set. Nil for no change.
-- @return Mixed return data.
function ent:PhotonData(key, type, default, val)
	if not IsValid(self) then return default end
	if isstring(key) then
		key = "PhotonLE." .. key
	end

	if val ~= nil then
		self["SetNW2" .. type](self, key, val)
	end
	return self["GetNW2" .. type](self, key)
end

--- Combined getter/setter for photon booleans.
-- @string key Key to fetch/set boolean on.
-- @param[opt] val Value to set.
function ent:PhotonBool(key, val)
	return self:PhotonData(key, "Bool", false, val)
end

--- Combined getter/setter for photon integers.
-- @string key Key to fetch/set boolean on.
-- @param[opt] val Value to set.
function ent:PhotonInteger(key, val)
	return self:PhotonData(key, "Int", 0, val)
end

-- Getter/Setter for Vehicle Headlights
-- @bool[opt] val New headlight state.
-- @treturn bool Current headlight state.
function ent:CAR_Headlights(val)
	return self:PhotonBool("CAR_HEADLIGHTS", val)
end

-- Getter/Setter for break state
-- @bool[opt] val New headlight state.
-- @treturn bool Current headlight state.
function ent:CAR_Braking(val)
	return self:PhotonBool("CAR_BRAKING", val)
end

-- Getter/Setter for reverse state
-- @bool[opt] val New reverse state.
-- @treturn bool Current reverse state.
function ent:CAR_Reversing(val)
	return self:PhotonBool("CAR_REVERSING", val)
end

-- Getter/Setter for running lights state
-- @bool[opt] val New running lights state.
-- @treturn bool Current running lights state.
function ent:CAR_Running(val)
	return self:PhotonBool("CAR_RUNNING", val)
end

-- Getter/Setter for indicator state.
-- @bool[opt] val New indicator state.
-- @treturn bool Current indicator state.
function ent:CAR_Signal(val)
	return self:PhotonInteger("CAR_BLINKER", val)
end

--- Wrapper to check a turn signal.
-- @int check State to check against.
-- @int[opt] val New state to set.
function ent:CAR_TurnState(check, val)
	if val ~= nil then
		val = check
	end

	return self:CAR_Signal(val) == check
end

--- Wrapper for checking left turn signals.
-- @bool[opt] val New indicator state.
-- @treturn bool If the vehicle has its left indicator enabled.
function ent:CAR_TurnLeft(val)
	return self:CAR_TurnState(CAR_BLINKER_LEFT, val)
end

--- Wrapper for checking right turn signals.
-- @bool[opt] val New indicator state.
-- @treturn bool If the vehicle has its right indicator enabled.
function ent:CAR_TurnRight(val)
	return self:CAR_TurnState(CAR_BLINKER_RIGHT, val)
end

--- Wrapper for checking hazard lights.
-- @bool[opt] val New hazard state.
-- @treturn bool If the vehicle has its hazards enabled.
function ent:CAR_Hazards(val)
	return self:CAR_TurnState(CAR_BLINKER_HAZARD, val)
end

--- Disable all car signals.
function ent:CAR_StopSignals()
	return self:CAR_TurnState(CAR_BLINKER_NONE)
end

--- Check if a given entity is currently breaking.
-- @treturn bool If the vehicle is breaking.
function ent:IsBraking()
	if not IsValid(self) then return false end
	if self:IsReversing() then return false end

	-- They're holding the handbreak.
	local driver = self:GetDriver()
	if driver:KeyDown(IN_JUMP) then
		return true
	end

	-- If they're not holding the handbreak or the regular break, then we're not breaking.
	if not driver:KeyDown(IN_BACK) then
		return false
	end

	-- We haven't yet recorded a speed, so it's better to be safe and not.
	local speed = self:GetPhysicsObject():GetVelocity():Length()
	if not self.LastSpeed then self.LastSpeed = speed return false end

	local slowing = (self.LastSpeed - speed) >= 0
	if slowing then return true end

	if self:Photon_AdjustedSpeed() < 2 then return true end

	return false
end

-- Check if we're currently reversing.
-- @treturn bool If the vehicle is reversing.
function ent:IsReversing()
	if not IsValid(self) then return false end

	local ply = self:GetDriver()
	if not IsValid(ply) then return false end
	if not ply:IsPlayer() then return false end

	local vel = self:GetPhysicsObject():GetVelocity()
	vel:Normalize()

	-- Check we're actually moving backwards.
	local sum = vel * self:GetForward()
	if sum.x > 0 or sum.y > 0 then
		return false
	end

	if not ply:KeyDown(IN_BACK) then
		return false
	end

	if self:Photon_AdjustedSpeed() <= 2 then
		return false
	end

	if ply:KeyDown(IN_JUMP) then return false end
	return true
end

local stayon = GetConVar("photon_emv_stayon")
hook.Add("InitPostEntity", "Photon.SVMeta.FetchEMVStayon", function()
	stayon = GetConVar("photon_emv_stayon")
end)

--- If the vehicle's lighting is forced to stay on.
-- @treturn bool If the lighting is forced.
function ent:GetPhotonLEStayOn()
	return stayon:GetBool() or self:GetNW2Bool("PhotonLEStayOn", false)
end

--- Set the lighting force status.
-- @bool val Force status.
function ent:SetPhotonLEStayOn(val)
	return self:SetNW2Bool("PhotonLEStayOn", val)
end

--- Check if this vehicle has customizable wheels.
-- @treturn bool If the vehicle has wheels.
function ent:Photon_WheelEnabled()
	return istable(Photon.Vehicles.WheelPositions[self.VehicleName]) and istable(Photon.Vehicles.WheelOptions[self.VehicleName])
end

--- Emulate a player setting a new wheel index.
-- @int val New index.
function ent:Photon_PlayerSetWheelIndex(val)
	if not self:Photon_WheelEnabled() then return false end

	local max = #Photon.Vehicles.WheelOptions[self.VehicleName]
	if val > max then val = 1 end

	self:Photon_SetWheelIndex( val )
end

--- Getter/setter for the wheel index.
-- @int val New index.
-- @treturn int Selected wheel index.
function ent:Photon_SetWheelIndex(val)
	return self:PhotonInteger("CAR_WHEEL_OPTION", val)
end

function Photon:SetupCar(car, index)
	car:CAR_Headlights(false)
	car:CAR_Braking(false)
	car:CAR_Running(false)
	car:CAR_Reversing(false)
	car:CAR_StopSignals()

	if car:Photon_WheelEnabled() then
		car:Photon_SetWheelIndex(1)
	end

	car:PhotonBool("CAR_HAS_PHOTON", true)
end