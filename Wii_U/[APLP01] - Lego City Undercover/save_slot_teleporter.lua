-- LEGO City Undercover - CEMU ROM
-------------------------------------
-- Free Fly [free_fly.lua]
-- Go anywhere in the air!
-- Usage: Fly with A, move with the Left Stick
-- Author: Divengerss
-------------------------------------
debug = false
save_address = 0x10A00550 -- Don't change unless you know what you're doing
-------------------------------------
if ReadFromRAM(INT32, 0x103F7E4C) ~= 0x0 and ReadFromRAM(INT32, ReadFromRAM(INT32, 0x103F7E4C) - 0xC8) ~= 0x0 then
  ptr = ReadFromRAM(INT32, ReadFromRAM(INT32, 0x103F7E4C) - 0xC8) + 0x58
  if ReadFromRAM(INT16, ptr + 0x4C) == 0x3F80 then
  inputs = ReadFromRAM(INT8, 0x104788E7)
  if inputs == 0x10 then
      WriteToRAM(FLOAT, save_address, ReadFromRAM(FLOAT, ptr))
      WriteToRAM(FLOAT, save_address + 0x04, ReadFromRAM(FLOAT, ptr + 0x04))
      WriteToRAM(FLOAT, save_address + 0x08, ReadFromRAM(FLOAT, ptr + 0x08))
  elseif inputs == 0x01 then
      WriteToRAM(FLOAT, ptr, ReadFromRAM(FLOAT, save_address))
      WriteToRAM(FLOAT, ptr + 0x04, ReadFromRAM(FLOAT, save_address + 0x04))
      WriteToRAM(FLOAT, ptr + 0x08, ReadFromRAM(FLOAT, save_address + 0x08))
  end
  if debug then
    LogToGUI("Saved: " .. ReadFromRAM(FLOAT, save_address) .. " " .. ReadFromRAM(FLOAT, save_address + 0x04) .. " " .. ReadFromRAM(FLOAT, save_address + 0x08) .. " 0x" .. string.format("%X", ptr))
  end
  elseif debug then
    LogToGUI("Invalid pointer destination")
  end
elseif debug then
  LogToGUI("Invalid Address 0x0")
end