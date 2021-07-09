-- Mario Kart 8 [000500001010ED00][PAL]
----------------------------------------
-- Infinite Star Power [no_countdown.lua]
-- Set the Star Power countdown to the given value.
-- Usage: none
-- Author: Divengerss
-- [[0x3EAAD7E0] + 0x20] + 0x160 = value
-------------------------------------
debug = false
timer = 0xFFFF
-------------------------------------
ptr = ReadFromRAM(INT32, ReadFromRAM(INT32, 0x3EAAD7E0) + 0x20) + 0x162

if ptr > 0x43000000 then
    if debug then
        LogToGUI(string.format("Address 0x%X", ptr))
    end
    WriteToRAM(INT16, ptr, timer)
elseif debug then
    LogToGUI("Invalid address")
end