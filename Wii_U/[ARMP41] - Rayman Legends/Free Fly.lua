--------- Rayman Legends - CEMU ROM -
-------------------------------------
-- Free Fly [Free Fly.lua]
-- Full control of your character
-- Usage: Rick Stick
-- Author: Divengerss
-- [[[0x14C70D3C] + 0x40] + 8] + 0x2C
-------------------------------------
debug = false
-------------------------------------
if ReadFromRAM(INT32, 0x14C70D3C) ~= 0x0 then
  ptr = ReadFromRAM(INT32, ReadFromRAM(INT32, ReadFromRAM(INT32, 0x14C70D3C) + 0x40) + 0x8) + 0x2C
  stick_x = ReadFromRAM(FLOAT, 0x13547d60)
  stick_y = ReadFromRAM(FLOAT, 0x13547d64)
  WriteToRAM(FLOAT, ptr - 0x04, stick_x * 10)
  WriteToRAM(FLOAT, ptr, stick_y * 10)
  if debug then
    LogToGUI(string.format("0x%X", ptr))
  end
elseif debug then
  LogToGUI(string.format("Invalid address 0x%X", ReadFromRAM(INT32, 0x14C70D3C)))
end