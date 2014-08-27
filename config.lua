-- config.lua

--[[

iPadRetina @ 4.2
iPad/iPhone4&5/iPodTouch4&5/KindleFire/GalaxyTablet/NookColor
iPhone @ 1.0

]]--

local dev = system.getInfo("model")
if string.find(dev, "iPad") ~= nil then
	if display.pixelHeight > 1024 then
		application = {
			content = {
				fps = 30,
				scale = "letterbox",
				width = 1536,
				height = 2048,
			}
		}
	else
		application = {
			content = {
				fps = 30,
				scale = "letterbox",
				width = 768,
				height = 1024,
			}
		}
	end
elseif string.find(dev, "iPhone") ~= nil or string.find(dev, "iPod") ~= nil then
	-- iphone 5
	if display.pixelHeight >= 1136 then
		application = {
			content = {
				fps = 30,
				scale = "letterbox",
				width = 640,
				height = 1136,
			}
		}
	-- iphone 4
	elseif display.pixelHeight >= 960 then
		application = {
			content = {
				fps = 30,
				scale = "letterbox",
				width = 640,
				height = 960,
			}
		}
	-- iphone
	else
		application = {
			content = {
				fps = 30,
				scale = "letterbox",
				width = 320,
				height = 480,
			},
		}
	end
elseif string.find(dev, "Kindle Fire") ~= nil or string.find(dev, "Galaxy Tab") ~= nil or string.find(dev, "Nook Color") ~= nil then
	application = {
		content = {
			fps = 30,
			scale = "letterbox",
			width = 768,
			height = 1024,
			
		}
	}
else
	application = {
		content = {
			fps = 30,
			scale = "letterbox",
			width = 320,
			height = 480,
		},
	}
end