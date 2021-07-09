-- Mario Kart 8 [000500001010ED00][PAL]
----------------------------------------
-- No Countdown [no_countdown.lua]
-- Disable the race countdown.
-- Usage: Just drive as soon as the track is loaded
-- Author: Divengerss
-- [[0x3EAAD7E0] + 0x20] + 0x74 = 0x0101
-- [0x433AAB4C] + 0x38C = 0x01
-------------------------------------
debug = true
-------------------------------------
ptr1 = ReadFromRAM(INT32, ReadFromRAM(INT32, 0x3EAAD7E0) + 0x20) + 0x74
ptr2 = ReadFromRAM(INT32, 0x433AAB4C) + 0x38C

if ptr1 > 0x43000000 and ptr2 > 0x42000000 then
    if debug then
        LogToGUI(string.format("Address 0x%X 0x%X", ptr1, ptr2))
    end
    WriteToRAM(INT16, ptr1, 0x0101)
    WriteToRAM(INT8, ptr2, 0x01)
elseif debug then
    LogToGUI("Invalid address")
end
