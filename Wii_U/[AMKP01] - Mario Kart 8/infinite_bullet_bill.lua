-- Mario Kart 8 [000500001010ED00][PAL]
----------------------------------------
-- Infinite Bullet Bill [infinite_bullet_bill.lua]
-- Infinite bullet bill with control. Also works on main menu
-- Usage: none
-- Author: Divengerss
-- [[0x433C8E7C] + 0x10] + 0x144 = value
-------------------------------------
debug = false
-------------------------------------
ptr = ReadFromRAM(INT32, ReadFromRAM(INT32, 0x433C8E7C) + 0x10) + 0x144

if ptr >= 0x40000000 then
    if debug then
        LogToGUI(string.format("Address 0x%X", ptr))
    end
    WriteToRAM(INT16, ptr, 0x0020)
elseif debug then
    LogToGUI("Invalid address")
end