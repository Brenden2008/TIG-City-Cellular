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
  if protocal == "MCSMS" then
    local randomMsgNumber = math.random(000000,999999)
    print("[INFO] A message was sent to this CIN Server! Storing as message number: "..randomMsgNumber.." .")
    local messageFile = fs.open(randomMsgNumber, "w")
    local decodedMsg = textutils.unserialize(message)
    local textMessage = decodedMsg["message"]
    messageFile.write(textMessage)
    messageFile.flush()
    print("[SUCCESS] Saved to file!")
    messageFile.close()
    local messageListFile = fs.open(msgList.txt, "w")
  elseif protocal == "MCCINSERVER" then
    print("[INFO] A command was sent to this CIN.")
    local decodedCommand = textutils.unserialize(message)
    if decodedCommand["serviceid"] == carrier_service_id.readAll() then
      if decodedCommand["servicepw"] == carrier_service_pw.readAll() then
        if decodedCommand["command"] == 1 then
          
  end
end
