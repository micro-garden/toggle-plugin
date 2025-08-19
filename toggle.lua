-- Original code by Dmytro Maluka (https://github.com/dmaluka)
-- Ref: https://github.com/zyedidia/micro/issues/2086#issuecomment-826351299

VERSION = "0.0.1"

local micro = import("micro")
local config = import("micro/config")

function Toggle(bp, args)
	if #args < 1 then
		micro.InfoBar():Error("Not enough arguments")
		return
	end
	local val = config.GetGlobalOption(args[1])
	if type(val) ~= "boolean" then
		micro.InfoBar():Error("Non-boolean option ", args[1])
		return
	end
	config.SetGlobalOptionNative(args[1], not val)
end

function ToggleLocal(bp, args)
	if #args < 1 then
		micro.InfoBar():Error("Not enough arguments")
		return
	end
	local val = bp.Buf.Settings[args[1]]
	if type(val) ~= "boolean" then
		micro.InfoBar():Error("Non-boolean option ", args[1])
		return
	end
	bp.Buf:SetOptionNative(args[1], not val)
end

function init()
	config.MakeCommand("toggle", Toggle, config.OptionComplete)
	config.MakeCommand("togglelocal", ToggleLocal, config.OptionComplete)
	config.AddRuntimeFile("toggle", config.RTHelp, "help/toggle.md")
end
