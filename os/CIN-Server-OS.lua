-- CIN Server Version 1.0.0
-- Brenden2008

print("[BOOT] Starting CIN Server Version 1.0.0...")
print()
print("[INFO] Opening modem...")
rednet.open("back")
print("[SUCCESS] Opened!")

print("[INFO] Opening CIN files...")

local carrier_name = fs.open("carrier_name.cin", "r")
print("[INFO] Loaded 1 out of 5 files.")
local carrier_protocal = fs.open("carrier_protocal.cin", "r")
print("[INFO] Loaded 2 out of 5 files.")
local carrier_service_id = fs.open("carrier_service_id.cin", "r")
print("[INFO] Loaded 3 out of 5 files.")
local carrier_service_pw = fs.open("carrier_service_pw.cin", "r")
print("[INFO] Loaded 4 out of 5 files.")
local cin_number = fs.open("cin_number.cin", "r")
print("[INFO] Loaded 5 out of 5 files.")
local cin_number_unloaded = cin_number.readAll()
local pcID = os.getComputerID()

print("[SUCCESS] All CIN flies loaded!")

print("[INFO] Adding this CIN Server to the CINDNS as CIN Number: "..cin_number_unloaded.." and at PC ID Number: "..pcID.." !")
rednet.host("CINDNS",cin_number_unloaded)
print("[SUCCESS] Added!")

print("[INFO] CIN Server started as CIN: "..cin_number_unloaded.." !")
while true do
  local senderId, message, protocol = rednet.receive()
  print(message)
end
