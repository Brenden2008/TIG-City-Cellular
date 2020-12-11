-- Cellular-Client API 1.0.0
-- Brenden2008
os.loadAPI("basicos/apis/Base64")
os.loadAPI("basicos/apis/json")

local computerID = os.getComputerID()


function start()
  rednet.open("top")
end

function roam()
  start()
  rednet.broadcast(computerID, "MCROAM")
  senderId, message, protocol = rednet.receive("MCROAMCLI")
  if message == "ok" then
    return senderId
  else
    return false
  end
end

function sendSMS(to, msg, serviceid, servicepw)
  local id = roam()
   messageQuery = {}
   messageQuery["serviceid"] = serviceid
   messageQuery["password"] = servicepw
   messageQuery["request"] = 3
   messageQuery["to"] = to
   messageQuery["message"] = msg
  rednet.send(id, messageQuery,"MCSMS")
  local senderId, message, protocol = rednet.receive("MCSMSCLI")
  if message == "ok" then
    return true
  else
    return false
  end
end

function getSMS(serviceid, servicepw)
  local CINServerID = rednet.lookup("MCCINSERVER",serviceid)
  if CINServerID then
    messageQuery = {}
    messageQuery["serviceid"] = serviceid
    messageQuery["password"] = servicepw
    messageQuery["request"] = 1 
	  rednet.send(CINServerID, messageQuery ,"MCCINSERVER")
  else
	  print("Failed to connect to the CIN Server.")
  end
end
