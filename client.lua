
playerMoving = false
carBurnout = true

Citizen.CreateThread(function()
	while true do Wait(0)
		if not IsPedInAnyVehicle(PlayerPedId(), false) and GetEntitySpeed(PlayerPedId()) >= 0.5 and GetFollowPedCamViewMode() ~= 4 then
			if playerMoving == false then
				ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 0.5)
				playerMoving = true
			end
		else
			if playerMoving == true then
				StopGameplayCamShaking(false)
				playerMoving = false
			end
		end
		
		if IsPedInAnyVehicle(PlayerPedId(), false) and IsVehicleInBurnout(GetVehiclePedIsIn(PlayerPedId())) then
			if carBurnout == false then
				carBurnout = true
				ShakeGameplayCam("SKY_DIVING_SHAKE", 0.55)
			end
		else
			if carBurnout == true then
				-- ShakeGameplayCam("VIBRATE_SHAKE", 0.85)
				StopGameplayCamShaking(false)
				carBurnout = false
			end
		end
	end
end)