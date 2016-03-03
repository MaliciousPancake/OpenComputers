local term = require("term")
local sides = require("sides")
local component = require("component")
local event = require("event")
local filesystem = require("filesystem")
local unicode = require("unicode")
local computer = require("computer")
local rs = component.redstone
local cb = component.command_block
local x, z, r

component.chat_box.setName("Noire")

local userList = {}
local allowedUsersListPath = "/mnt/109/list.txt"
local matPath = "/mnt/109/mat.txt"

local function exec(command)
  cb.setCommand(command)
  cb.executeCommand()
end

local function chb(com)
  component.chat_box.say(com)
end

local function loadAllowedUsersList()
  userlist = {}
  local file = io.open(allowedUsersListPath, "r")
  for line in file:lines() do
    table.insert(userList, line)
  end
  file:close()
  return userList
end

local function check(player)
  for i = 1, #userList do 
    if userList[i] == player then
      return true
    end
  end
end

local function loadMatList()
  matList = {}
  local file = io.open(matPath)
  for line in file:lines() do
    table.insert(matList, line)
  end
  return matList
end
  
  
local function mat(mat)
  for i = 1, #matList do
    if string.find(m , matList[i]) then
      return true
    end
  end
end

chb("Чат-бот v1.2 инициализирован.")

loadAllowedUsersList()
loadMatList()

while true do
  _, _, p, m = event.pull("chat_message")

  local check = check(p)

  local ms = unicode.lower(m)
  if string.find(ms, "кто я") and check then
    component.chat_box.say("ТЫ МАЛАЦА")
  
  elseif string.find(ms, "кто я") and not check then
    math.randomseed(os.time())
    r = math.random(1, 3)
    if r == 1 then
      component.chat_box.say("Ты большой крокодил, "..p..", большой крокодил...")
    elseif r == 2 then
      component.chat_box.say("Ты-спаситель галактики, "..p.."!")
    elseif r == 3 then
      component.chat_box.say("Ты милашка, "..p..":3")
    end

  elseif string.find(ms, "test") and check then
    chb("Test Completed")

  elseif string.find(ms, "объява") and check then
    cb.setCommand(string.format("/tellraw @a [\"\",{\"text\":\"Объявление:\",\"color\":\"aqua\"},{\"text\":\"%s\",\"color\":\"blue\"}]",unicode.sub(m, 7)))
    cb.executeCommand()

  elseif string.find(ms,"пал ты теперь") and check then
    component.chat_box.setName(tostring(unicode.sub(m, 17)))
    component.chat_box.say("Слушаюсь.")

  elseif string.find(ms,"колумбия") then
    component.chat_box.say("КОЛУМБИЯ-РОДИНА НАША")

  elseif string.find(ms, "hola") then
    component.chat_box.say("Hola, "..p.."!")

  elseif string.find(ms, "вечер в хату") then
    component.chat_box.say("Жизнь ворам!")

  elseif string.find(ms, "как") and string.find(ms, "приватить") then
    os.sleep(5)
    component.chat_box.say("Почитай на экране на спауне во вкладке 'Приват'.")

  --if string.find(unicode.lower(m), "пал") and string.find(unicode.lower(m), "помолимся") then--
  --component.chat_box.say("Помолимся! Аллаху акбар! Смерть кафирам неверным!")--
  --end--

  elseif string.find(ms, "reboot list") and p == "PaladinCVM" then
    loadAllowedUsersList()
    loadMatList()
    chb("Done.")  
 elseif string.find(ms, "sudo") and check then
    local s = string.sub(m, 6)
    local function executeCommand(str)
      local success, reason = load(s)

      if success then
        local success2, reason2 = pcall(success)
        print(success2, reason2)
        if success2 and reason2 then
          chb("Результат: "..tostring(reason2))
        else
          chb("ОШИБКА: "..tostring(reason2))
      end
      else
        chb("Ошибка: " .. reason)
      end
    end
    executeCommand(s)

  elseif string.find(ms, "напугай их") and check then
    component.chat_box.say("Слушаюсь!")
    rs.setOutput(sides.north, 15)
    os.sleep(9)
    rs.setOutput(sides.north, 0)

  elseif string.find(ms, "noire off") and check then
    computer.shutdown(true)

  elseif string.find(ms, "echo") and check then
    chb(unicode.sub(m, 6))

  elseif string.find(ms, "как") and string.find(ms, "крафтить") then
    component.chat_box.say("Советую погуглить.")

  elseif string.find(ms, "and his name is") and check then
    component.chat_box.say(string.format("AND HIS NAME IS %s!", string.upper(p)))
    rs.setOutput(sides.east, 15)
    os.sleep(1)
    rs.setOutput(sides.east, 0)
  end


  if string.find(ms, "мяу") and check then
    exec("/playsound mob.cat.meow @a ~0 ~0 ~0 2.0")
  end

  if string.find(ms, "мяя") and check then
    exec("/playsound mob.cat.hitt @a ~0 ~0 ~0 2.0")
  end

  if string.find(ms, "мур") and check then
    exec("/playsound mob.cat.purreow @a ~0 ~0 ~0 2.0")
  end

  if string.find(ms, "мрр") and check then
    exec("/playsound mob.cat.purr @a")
  end

  if string.find(ms, "гав") and check then
    exec("/playsound mob.wolf.bark @a")
  end

  if string.find(ms, "хрю") and check then
    exec("/playsound mob.pig.say @a")
  end

  if string.find(ms, "муу") and check then
    exec("/playsound mob.cow.say @a")
  end

  if string.find(ms, "пук") and check then
    exec("/playsound cfm:fart3 @a")
  end

  if string.find(ms,"нойра") and mat(string.sub(m, 12)) and not (string.sub(m, 12) == "" ) then
    component.chat_box.say(string.format("/ban "..p))
  end

  if string.find(ms, "лмм") then
    component.chat_box.say("ЛММ-Бог наш")

  elseif string.find(ms, "подскажи время") then
    t=os.date("!*t")
    component.chat_box.say((t.hour-1)..":"..t.min)

  elseif string.find(ms, "елдараунд") and p=="MaliciousPancake" then
    for x=-118, -93 do
      for z=186, 210 do
        cb.setCommand(string.format("/setblock %s 70 %s 1", x, z))
        cb.executeCommand()
      end
    end
  end
end
