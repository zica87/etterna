local t = Def.ActorFrame{}

local whee
local top
local function mouseInput(event)
	if event.DeviceInput.button == "DeviceButton_left mouse button" and event.type == "InputEventType_FirstPress"then
		if INPUTFILTER:GetMouseX() > 500 then
			local n=0
			local m=1
			if INPUTFILTER:GetMouseY() > 220 and INPUTFILTER:GetMouseY() < 256 then
				m=0
			elseif INPUTFILTER:GetMouseY() > 256 and INPUTFILTER:GetMouseY() < 292 then
				m=1
				n=1
			elseif INPUTFILTER:GetMouseY() > 292 and INPUTFILTER:GetMouseY() < 328 then
				m=1
				n=2
			elseif INPUTFILTER:GetMouseY() > 328 and INPUTFILTER:GetMouseY() < 364 then
				m=1
				n=3
			elseif INPUTFILTER:GetMouseY() > 364 and INPUTFILTER:GetMouseY() < 400 then
				m=1
				n=4
			elseif INPUTFILTER:GetMouseY() > 400 and INPUTFILTER:GetMouseY() < 436 then
				m=1
				n=5
			elseif INPUTFILTER:GetMouseY() > 184 and INPUTFILTER:GetMouseY() < 220 then
				m=-1
				n=1
			elseif INPUTFILTER:GetMouseY() > 148 and INPUTFILTER:GetMouseY() < 184 then
				m=-1
				n=2
			elseif INPUTFILTER:GetMouseY() > 112 and INPUTFILTER:GetMouseY() < 148 then
				m=-1
				n=3
			elseif INPUTFILTER:GetMouseY() > 76 and INPUTFILTER:GetMouseY() < 112 then
				m=-1
				n=4
			elseif INPUTFILTER:GetMouseY() > 40 and INPUTFILTER:GetMouseY() <76 then
				m=-1
				n=5
			end
			for i=1,n do
				whee:Move(m)
				whee:Move(0)
			end
			if m==0 then
				top:SelectCurrent(0)
			end
		end
	end
end

t[#t+1] = Def.Actor{
	BeginCommand=function(self)
		top = SCREENMAN:GetTopScreen()
		whee = top:GetMusicWheel()
		top:AddInputCallback(mouseInput)
	end,
	CodeMessageCommand=function(self,params)
		if params.Name == "AvatarShow" then
			SCREENMAN:AddNewScreenToTop("ScreenAvatarSwitch")
		end
	end
}
t[#t+1] = LoadActor("../_frame")
t[#t+1] = LoadActor("../_PlayerInfo")
t[#t+1] = LoadActor("currentsort")
t[#t+1] = LoadFont("Common Large")..{
	InitCommand=cmd(xy,5,32;halign,0;valign,1;zoom,0.55;diffuse,getMainColor('positive');settext,"Select Music:");
}
t[#t+1] = LoadActor("../_cursor")
t[#t+1] = LoadActor("../_mousewheelscroll")
t[#t+1] = LoadActor("../_halppls")
t[#t+1] = LoadActor("currenttime")

return t
