-- LEGO City Undercover - CEMU ROM
-------------------------------------
-- Custom Vehicle Heart Count [ctm_vehicle_heart_count.lua]
-- Replace the current heart count
-- Author: Divengerss
-------------------------------------
debug = false
heart_nb = 0x0F
-------------------------------------
if ReadFromRAM(INT32, 0x1042FA00) ~= 0x0 and ReadFromRAM(INT32, ReadFromRAM(INT32, 0x1042FA00) + 0x1B4) ~= 0x0 then
  ptr = ReadFromRAM(INT32, 0x1042FA00) + 0x1B4
  ptr2 = ReadFromRAM(INT32, ptr) + 0x44
  ptr3 = ReadFromRAM(INT32, ptr2) + 0xC
  if debug then
    LogToGUI("Address " .. string.format("%X", ptr3))
  end
  WriteToRAM(INT8, ptr3 + 0x03, heart_nb)
  WriteToRAM(INT8, ptr3 + 0x07, heart_nb)
else if debug then
    LogToGUI("Invalid Address 0x0")
  end
end