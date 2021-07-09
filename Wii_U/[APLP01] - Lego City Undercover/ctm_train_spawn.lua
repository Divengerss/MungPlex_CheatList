-- LEGO City Undercover - CEMU ROM
-------------------------------------
-- Custom Train ID Spawner [ctm_train_spawn.lua]
-- Replace the spawn ID for trains
-- [[0x103F40B0] + 0x1EC] + 0x40
-- Author: Divengerss
-------------------------------------
debug = true
locomotive_id = 0x02f2
carriage1_id = 0x0379
carriage2_id = 0x037A
remove_engine = false -- Must be 'true' to use custom IDs (non train vehicles), you'll need inf_vehicle_speed.lua to move
-------------------------------------
if ReadFromRAM(INT32, 0x103F40B0) ~= 0x0 and ReadFromRAM(INT32, ReadFromRAM(INT32, 0x103F40B0) + 0x1EC) ~= 0x0 then
    ptr = ReadFromRAM(INT32, ReadFromRAM(INT32, 0x103F40B0) + 0x1EC) + 0xA
    if remove_engine then
        WriteToRAM(INT32, ptr + 0x3A, 0x0)
    elseif not remove_engine then
        WriteToRAM(INT32, ptr + 0x3A, 0x4bf1b988)
    end if ptr > 0x43000000 and ptr < 0x47000000 then
        WriteToRAM(INT16, ptr, carriage2_id)
        WriteToRAM(INT16, ptr + 0x1C, carriage1_id)
        WriteToRAM(INT16, ptr + 0x38, locomotive_id)
    end if debug then
        LogToGUI(string.format("%X", ptr))
    end
elseif debug then
    LogToGUI("Invalid Address 0x0")
end