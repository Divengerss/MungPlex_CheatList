-- Super Mario 3D World -- CEMU ROM -
-------------------------------------
-- Free Fly [Free Fly.lua]
-- Full control of your character, works anywhere in the game
-- Usage: Fly with B, move with the Left Stick
-- Author: Divengerss
-------------------------------------
debug = false
velocity = 20
-------------------------------------
if ReadFromRAM(INT32, 0x103BBE14) ~= 0x0 then
  ptr = ReadFromRAM(INT32, ReadFromRAM(INT32, ReadFromRAM(INT32, 0x103BBE14) + 0xC0)) + 0x28
  lstick_x = ReadFromRAM(FLOAT, 0x316934ac)
  lstick_y = ReadFromRAM(FLOAT, 0x316934b0)
  input_b = ReadFromRAM(INT8, 0x316934a2)

  WriteToRAM(FLOAT, ptr - 0x04, lstick_x * velocity)
  WriteToRAM(FLOAT, ptr + 0x04, lstick_y * -velocity)
  if input_b == 0x40 then
    WriteToRAM(FLOAT, ptr, velocity)
  end if debug then
    LogToGUI(string.format("0x%X", ptr))
  end
elseif debug then
  LogToGUI("Invalid Address 0x0")
end