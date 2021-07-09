-- LEGO City Undercover - CEMU ROM
-------------------------------------
-- Infinite Vehicle Speed [inf_vehicle_speed.lua]
-- No more speed limit with vehicles
-- Usage: ZR | ZL
-- Author: Divengerss
-------------------------------------
debug = true
instant_stop = true -- Set back the speed to 0 when no button is pressed
speed_add = 0.3
-------------------------------------
if ReadFromRAM(INT32, 0x1042FA00) ~= 0x0 and ReadFromRAM(INT32, ReadFromRAM(INT32, 0x1042FA00) + 0x220) ~= 0x0 then
  ptr = ReadFromRAM(INT32, ReadFromRAM(INT32, 0x1042FA00) + 0x220) + 0x2EC
  inputs = ReadFromRAM(INT8, 0x104788DA)
  speed = ReadFromRAM(FLOAT, ptr)
  if inputs == 0x01 then
    speed = speed + speed_add
  elseif inputs == 0x02 then
    speed = speed - speed_add
  elseif inputs ~= 0x02 and inputs ~= 0x01 then
    if speed > 0.42 and not instant_stop then
      speed = speed - speed_add
    elseif speed < -0.45 and not instant_stop  then
      speed = speed + speed_add
    elseif speed > -0.4 and speed < 0.4 and not instant_stop  then
      speed = 0
    end
  end if inputs == 0x00 and instant_stop then
    speed = 0
  end if debug then
    LogToGUI("pointer address 0x" .. string.format("%X ", ptr) .. "Speed " .. speed * -1)
  end
  WriteToRAM(FLOAT, ptr, speed)
  WriteToRAM(FLOAT, ptr - 0x04, speed)
elseif debug then
  LogToGUI("Invalid Address 0x0")
end