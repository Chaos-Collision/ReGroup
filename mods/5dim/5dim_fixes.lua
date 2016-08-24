
log("running hotfix")

if data.raw.module["5d-effectivity-productivity-5"] then
	local lim = data.raw.module["5d-effectivity-productivity-5"].limitation
	local lmk = data.raw.module["5d-effectivity-productivity-5"].limitation_message_key
	data.raw.module["5d-speed-productivity-4"].limitation = lim
	data.raw.module["5d-speed-productivity-4"].limitation_message_key = lmk
	data.raw.module["5d-effectivity-productivity-4"].limitation = lim
	data.raw.module["5d-effectivity-productivity-4"].limitation_message_key = lmk
	data.raw.module["5d-pollution-productivity-4"].limitation = lim
	data.raw.module["5d-pollution-productivity-4"].limitation_message_key = lmk
end