threshold = 50
sleep_sec = 60

temp = 0

while (true) do
	th, err = rt.hw.open("thermometer1")
	if (th) then
		temp = th:read()
		th:close()
	end
    hour = os.date("*t")["hour"]

	if ((temp > threshold) and ((hour > 8) and (hour < 18))) then
		rt.command("usbhost use on")
	else
  		rt.command("usbhost use off")
	end

	rt.sleep(sleep_sec)
end
