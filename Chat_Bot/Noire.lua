local term = require("term")
local sides = require("sides")
local component = require("component")
local event = require("event")
local unicode = require("unicode")
local rs = component.redstone
local cb = component.command_block
local x, z
local dover = {MaliciousPancake=true,ViperBP77=false,ECS=true,Pblcb=true,Noire=true,IEmen=true,errclman=true,axelpx=true,admin=true}
component.chat_box.setName("Noire")
local s
t = {}
while true do
_, _, p, m=event.pull("chat_message")

-- p = игрок m = сообщение
if string.find(unicode.lower(m), "кто я") and dover[string.format("%s",p)] then
component.chat_box.say("ТЫ МАЛАЦА")
end
if string.find(unicode.lower(m), "кто я") and not dover[string.format("%s",p)] then
component.chat_box.say(string.format("Ты большой крокодил, %s, большой крокодил...", p))
end
if string.find(unicode.lower(m), "объява") and dover[string.format("%s",p)] then
cb.setCommand(string.format("/tellraw @a [\"\",{\"text\":\"Объявление:\",\"color\":\"aqua\"},{\"text\":\"%s\",\"color\":\"blue\"}]",unicode.sub(m, 7)))
cb.executeCommand()
end
if string.find(unicode.lower(m),"нойра ты теперь") and dover[string.format("%s",p)] then
component.chat_box.setName(string.format("%s",unicode.sub(m, 17)))
component.chat_box.say("Слушаюсь.")
end
if string.find(unicode.lower(m),"колумбия") then
component.chat_box.say("КОЛУМБИЯ-РОДИНА НАША")
end
if string.find(unicode.lower(m), "hola") then
component.chat_box.say(string.format("Hola, %s!", p))
end
if string.find(unicode.lower(m), "вечер в хату") then
component.chat_box.say("Жизнь ворам!")
end
if string.find(unicode.lower(m), "как") and string.find(unicode.lower(m), "приватить") then
os.sleep(5)
component.chat_box.say("Почитай на экране на спауне во вкладке 'Приват'.")
end
--if string.find(unicode.lower(m), "нойра") and string.find(unicode.lower(m), "помолимся") then--
--component.chat_box.say("Помолимся! Аллаху акбар! Смерть кафирам неверным!")--
--end--
if string.find(unicode.lower(m), "напугай их") and dover[string.format("%s",p)] then
component.chat_box.say("Слушаюсь!")
rs.setOutput(sides.north, 15)
os.sleep(9)
rs.setOutput(sides.north, 0)
end
if string.find(unicode.lower(m), "как") and string.find(unicode.lower(m), "крафтить")) then
component.chat_box.say("Советую погуглить.")
end
if string.find(unicode.lower(m), "and his name is") and dover[string.format("%s",p)] then
component.chat_box.say(string.format("AND HIS NAME IS %s!", string.upper(p)))
rs.setOutput(sides.east, 15)
os.sleep(1)
rs.setOutput(sides.east, 0)
end
if string.find(unicode.lower(m), "мяу") and dover[string.format("%s",p)] then
cb.setCommand("/playsound mob.cat.meow @a")
cb.executeCommand()
end
if string.find(unicode.lower(m), "гав") and dover[string.format("%s",p)] then
cb.setCommand("/playsound mob.wolf.bark @a")
cb.executeCommand()
end
if string.find(unicode.lower(m), "хрю") and dover[string.format("%s",p)] then
cb.setCommand("/playsound mob.pig.say @a")
cb.executeCommand()
end
if string.find(unicode.lower(m), "муу") and dover[string.format("%s",p)] then
cb.setCommand("/playsound mob.cow.say @a")
cb.executeCommand()
end
--[[if string.find(m, "adm") then
cb.setCommand(
end]]--
if string.find(unicode.lower(m),"нойра") and (string.find(unicode.lower(m), "пидор") or string.find(unicode.lower(m), "пидорас") or string.find(unicode.lower(m), "мудак")) or string.find(unicode.lower(m), "уёбок") then
component.chat_box.say(string.format("/ban %s", p))
end
if string.find(unicode.lower(m), "лмм") then
component.chat_box.say("ЛММ-Бог наш")
end
if string.find(unicode.lower(m), "подскажи время") then
t=os.date("!*t")
component.chat_box.say(string.format("%s:%s", (t.hour-1), t.min))
end
if string.find(unicode.lower(m), "елдараунд") and p=="MaliciousPancake" then
for x=-118, -93 do
for z=186, 210 do
cb.setCommand(string.format("/setblock %s 70 %s 1", x, z))
cb.executeCommand()
end
end
end
end
