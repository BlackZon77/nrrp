exports['mythic_progbar']:Progress({
	name = "unique_action_name",
	duration = 1000,
	label = 'Doing Something',
	useWhileDead = true,
	canCancel = true,
	controlDisables = {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	},
	animation = {
		animDict = "missheistdockssetup1clipboard@base",
		anim = "base",
		flags = 49,
	},
	prop = {
		model = "p_amb_clipboard_01",
		bone = 18905,
		coords = { x = 0.10, y = 0.02, z = 0.08 },
		rotation = { x = -80.0, y = 0.0, z = 0.0 },
	},
	propTwo = {
		model = "prop_pencil_01",
		bone = 58866,
		coords = { x = 0.12, y = 0.0, z = 0.001 },
		rotation = { x = -150.0, y = 0.0, z = 0.0 },
	},
}, function(cancelled)
	if not cancelled then
		-- Do Something If Action Wasn't Cancelled
	else
		-- Do Something If Action Was Cancelled
	end
end)