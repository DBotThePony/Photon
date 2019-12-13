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

	end

	function ent:CAR_TurnLeft( val )
		if not IsValid( self ) then return false end
		if (val!=nil) then self:CAR_Signal( CAR_TURNING_LEFT ) end
		return self:CAR_Signal() == CAR_TURNING_LEFT

	end

	function ent:CAR_TurnRight( val )
		if not IsValid( self ) then return false end
		if (val!=nil) then self:CAR_Signal( CAR_TURNING_RIGHT ) end
		return self:CAR_Signal() == CAR_TURNING_RIGHT

	end

	function ent:CAR_Hazards( val )
		if not IsValid( self ) then return false end
		if (val!=nil) then self:CAR_Signal( CAR_HAZARD ) end
		return self:CAR_Signal() == CAR_HAZARD

	end

	function ent:CAR_StopSignals()
		if not IsValid( self ) then return false end
		self:CAR_Signal( 0 )
	end

	function ent:IsBraking( )
		if not IsValid( self ) then return false end
		if self:IsReversing() then return false end
		local speed = self:GetPhysicsObject():GetVelocity():Length()
		if not self.LastSpeed then self.LastSpeed = speed return false end
		if (self.LastSpeed - speed) >= 0 and ( self:GetDriver():KeyDown( IN_BACK ) and not self:IsReversing() ) or ( self:GetDriver():KeyDown( IN_BACK) and self:Photon_AdjustedSpeed() < 2 ) or self:GetDriver():KeyDown( IN_JUMP ) then
			return true
		end
		return false
	end

	function ent:IsReversing()
		if not IsValid( self ) then return false end
		if self:GetDriver() and self:GetDriver():IsValid() and self:GetDriver():IsPlayer() then
			local ply = self:GetDriver()
			local velocity = self:GetPhysicsObject():GetVelocity()
			velocity:Normalize()
			local direction = self:GetForward()
			local sum = Vector()
			sum.x = velocity.x * direction.x
			sum.y = velocity.y * direction.y
			if not (sum.x >= 0 and sum.y >= 0) then
				if (ply:KeyDown( IN_BACK ) and (ent:Photon_AdjustedSpeed() > 10)) and not ply:KeyDown( IN_JUMP ) then return true end
			end
		end
		return false
	end

	function ent:GetPhotonLEStayOn()
		if GetConVar("photon_emv_stayon"):GetBool() then return true end
		return self:GetNW2Bool("PhotonLEStayOn", false)
	end
	function ent:SetPhotonLEStayOn(val)
		return self:SetNW2Bool("PhotonLEStayOn", val)
	end

	function ent:Photon_WheelEnabled()
		return istable( Photon.Vehicles.WheelPositions[ self.VehicleName ] ) and istable( Photon.Vehicles.WheelOptions[ self.VehicleName ] )
	end

	function ent:Photon_PlayerSetWheelIndex( val )
		if not self:Photon_WheelEnabled() then return false end
		local max = #Photon.Vehicles.WheelOptions[ self.VehicleName ]
		if val > max then val = 1 end
		self:Photon_SetWheelIndex( val )
	end

	function ent:Photon_SetWheelIndex( val )
		if not IsValid( self ) then return 0 end
		if (val!=nil) then self:SetNW2Int( "PhotonLE.CAR_WHEEL_OPTION", val ) end
		return self:GetNW2Int( "PhotonLE.CAR_WHEEL_OPTION" )
	end

	ent:CAR_Headlights( false )
	ent:CAR_Braking( false )
	ent:CAR_Running( false )
	ent:CAR_Reversing( false )
	ent:CAR_StopSignals()
	if ent:Photon_WheelEnabled() then ent:Photon_SetWheelIndex( 1 ) end

	-- ent:SetNWString( "PhotonVehicle", index )
	ent:SetNW2Bool( "PhotonLE.CAR_HAS_PHOTON", true )

end