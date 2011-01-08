-- Create Easy Raid Marking Frame
local EasyRaidTargetFrame = CreateFrame("Frame", "EasyRaidTargets", UIParent);
EasyRaidTargetFrame:SetBackdrop( {
	bgFile = "Interface\\AddOns\\EasyWorldMarker\\media\\flat.tga",
	edgeFile = "Interface\\AddOns\\EasyWorldMarker\\media\\flat.tga",
	tile = false, tileSize = 0, edgeSize = 1,
	insets = {left = -1, right = -1, top = -1, bottom = -1}
	} );
EasyRaidTargetFrame:RegisterForDrag("LeftButton");
EasyRaidTargetFrame:EnableMouse(true);
EasyRaidTargetFrame:SetMovable(true);
EasyRaidTargetFrame:SetScript("OnDragStart", EasyRaidTargetFrame.StartMoving);
EasyRaidTargetFrame:SetScript("OnDragStop", EasyRaidTargetFrame.StopMovingOrSizing);
EasyRaidTargetFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 100, -100);
EasyRaidTargetFrame:SetBackdropColor(.1, .1, .1, .8);
EasyRaidTargetFrame:SetBackdropBorderColor(.2, .2, .2, .9);
EasyRaidTargetFrame:SetWidth(90);
EasyRaidTargetFrame:SetHeight(165);
EasyRaidTargetFrame:Hide();
local ertf_visible = false;

-- Create Icon Marking Button function
local function CreateEasyRaidTargetButton(btnName, btnText, point, relativeTo, pointRel)
	local frame = CreateFrame("Button", btnName, EasyRaidTargetFrame, "SecureActionButtonTemplate");
	frame:SetPoint(point, relativeTo, pointRel, 0, -3);
	frame:SetWidth(90);
	frame:SetHeight(15);
	frame:SetFrameLevel(EasyRaidTargetFrame:GetFrameLevel() + 1);
	frame:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight");
	
	local t = frame:CreateFontString(nil, "OVERLAY", frame);
	t:SetFont("Interface\\AddOns\\EasyWorldMarker\\media\\font.ttf", 10, "OUTLINE");
	t:SetText(btnText);
	t:SetPoint("CENTER");
	t:SetJustifyH("CENTER");
end

-- Create Marking Buttons
CreateEasyRaidTargetButton("ERT_Skull", "|cffefefefWhite Skull|r", "TOP", EasyRaidTargetFrame, "TOP");
ERT_Skull:SetScript("OnMouseUp", function() 
	SetRaidTarget("target", 8);
end)

CreateEasyRaidTargetButton("ERT_X", "|cfff1385bRed X|r", "TOP", ERT_Skull, "BOTTOM");
ERT_X:SetScript("OnMouseUp", function() 
	SetRaidTarget("target", 7);
end)

CreateEasyRaidTargetButton("ERT_Star", "|cfff5de61Yellow Star|r", "TOP", ERT_X, "BOTTOM");
ERT_Star:SetScript("OnMouseUp", function() 
	SetRaidTarget("target", 1);
end)

CreateEasyRaidTargetButton("ERT_Square", "|cff71a1d4Blue Square|r", "TOP", ERT_Star, "BOTTOM");
ERT_Square:SetScript("OnMouseUp", function() 
	SetRaidTarget("target", 6);
end)

CreateEasyRaidTargetButton("ERT_Circle", "|cfff59d2aOrange Circle|r", "TOP", ERT_Square, "BOTTOM");
ERT_Circle:SetScript("OnMouseUp", function() 
	SetRaidTarget("target", 2);
end)

CreateEasyRaidTargetButton("ERT_Diamond", "|cffc05ef8Purple Diamond|r", "TOP", ERT_Circle, "BOTTOM");
ERT_Diamond:SetScript("OnMouseUp", function() 
	SetRaidTarget("target", 3);
end)

CreateEasyRaidTargetButton("ERT_Moon", "|cffb6b2b2Silver Moon|r", "TOP", ERT_Diamond, "BOTTOM");
ERT_Moon:SetScript("OnMouseUp", function() 
	SetRaidTarget("target", 5);
end)

CreateEasyRaidTargetButton("ERT_Triangle", "|cff7de87fGreen Triangle|r", "TOPLEFT", ERT_Moon, "BOTTOMLEFT");
ERT_Triangle:SetScript("OnMouseUp", function() 
	SetRaidTarget("target", 4);
end)

CreateEasyRaidTargetButton("ERT_Remove", "|cff505050Clear Target|r", "TOPLEFT", ERT_Triangle, "BOTTOMLEFT");
ERT_Remove:SetScript("OnMouseUp", function() 
	SetRaidTarget("target", 0);
end)

local function ERTF_Toggle()
	if(ertf_visible == true) then
		EasyRaidTargetFrame:Hide();
		ertf_visible = false;
	else
		EasyRaidTargetFrame:Show();
		ertf_visible = true;
	end
end

-- Create slash command
SLASH_EASYRAIDMARKS1 = "/erm";
SLASH_EASYRAIDMARKS2 = "/rm";
SlashCmdList["EASYRAIDMARKS"] = function() ERTF_Toggle(); end