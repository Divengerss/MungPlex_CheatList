-- Mario Kart 8 [000500001010ED00][PAL]
----------------------------------------
-- Rainbow Menu Background [rainbow_menu_background.lua]
-- Change the main menu background color
-- Usage: none
-- Author: Divengerss
-------------------------------------
R = ReadFromRAM(INT8, 0x3D7690BC)
G = ReadFromRAM(INT8, 0x3D7690BD)
B = ReadFromRAM(INT8, 0x3D7690BE)
A = ReadFromRAM(INT8, 0x3D7690BF)

if A ~= 0xFE then
    WriteToRAM(INT64, 0x3D7690BC, 0x000000FE53010000) -- Set 0x000000FE
end if R < 0xFF and G == 0x0 and B == 0x0 then
    WriteToRAM(INT8, 0x3D7690BC, R + 0x01) -- FF0000
end if R == 0xFF and G < 0xFF and B == 0x0 then
    WriteToRAM(INT8, 0x3D7690BD, G + 0x01) -- FFFF00
end if R > 0x0 and G == 0xFF and B == 0x0 then
    WriteToRAM(INT8, 0x3D7690BC, R - 0x01) -- 00FF00
end if R == 0x0 and G == 0xFF and B < 0xFF then
    WriteToRAM(INT8, 0x3D7690BE, B + 0x01) -- 00FFFF
end if R == 0x0 and B == 0xFF and G > 0x0 then
    WriteToRAM(INT8, 0x3D7690BD, G - 0x01) -- 0000FF
end if R < 0xFF and B == 0xFF and G == 0x0 then
    WriteToRAM(INT8, 0x3D7690BC, R + 0x01) -- FF00FF
end if B > 0x0 and G == 0x0 and R == 0xFF then
    WriteToRAM(INT8, 0x3D7690BE, B - 0x01) -- FF0000
end