-- LEGO City Undercover - CEMU ROM
-------------------------------------
-- Custom Heart Count [ctm_heart_count.lua]
-- Replace the current heart count
-- Author: Divengerss
-------------------------------------
debug = false
heart_nb = 0x2F
active_nb = 0x2F
-------------------------------------
if ReadFromRAM(INT32, 0x4EDB2CA4) ~= 0x0 and ReadFromRAM(INT32, ReadFromRAM(INT32, 0x4EDB2CA4) + 0x1C) ~= 0x0 then
  ptr = ReadFromRAM(INT32, ReadFromRAM(INT32, 0x4EDB2CA4) + 0x1C) + 0x3B0
  if debug then
    LogToGUI("Address " .. string.format("%X", ptr))
  end
  WriteToRAM(INT8, ptr + 0x02, heart_nb)
  WriteToRAM(INT8, ptr + 0x03, active_nb)
elseif debug then
  LogToGUI("Invalid Address 0x0")
end