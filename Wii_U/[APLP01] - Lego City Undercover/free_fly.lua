-- LEGO City Undercover - CEMU ROM
-------------------------------------
-- Free Fly [free_fly.lua]
-- Go anywhere in the air!
-- Usage: Fly with A, move with the Left Stick
-- Author: Divengerss
-------------------------------------
debug = false
move_velocity = 8
fly_velocity = 0.3
-------------------------------------
if ReadFromRAM(INT32, 0x103F7E4C) ~= 0x0 and ReadFromRAM(INT32, ReadFromRAM(INT32, 0x103F7E4C) - 0xC8) ~= 0x0 then
  ptr = ReadFromRAM(INT32, ReadFromRAM(INT32, 0x103F7E4C) - 0xC8) + 0x9C
  if ReadFromRAM(INT16, ptr + 0x8) == 0x3F80 then
    input_a = ReadFromRAM(INT8, 0x104788e4)
    x = ReadFromRAM(FLOAT, 0x10478900)
    y = ReadFromRAM(FLOAT, 0x10478904)
    z = ReadFromRAM(FLOAT, ptr)

    WriteToRAM(FLOAT, ptr - 0x04, x * move_velocity)
    WriteToRAM(FLOAT, ptr + 0x04, y * move_velocity)
    if input_a == 0x40 then
        z = z + fly_velocity
        WriteToRAM(FLOAT, ptr, z)
    else
        z = z - fly_velocity
    end
    if debug then
      LogToGUI("Address 0x" .. string.format("%X  X: %f  Y: %f  Z: %f", ptr, x, y, z))
    end
  elseif debug then
    LogToGUI("Invalid pointer destination")
  end
elseif debug then
  LogToGUI("Invalid Address 0x0")
end