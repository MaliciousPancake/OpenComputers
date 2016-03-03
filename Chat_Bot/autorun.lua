local event = require("event")
local term = require("term")
local computer = require("computer")
local pass, passin
pass = "55669822"

while true do
  event.shouldSoftInterrupt = function()
    return false
  end
  event.shouldInterrupt = function()
    return false
  end
  term.clear()
  print("Анти-PaladinCVM защита инициализирована.")
  print("Введите пароль.")
  passin = term.read(_, _, _, "*")
  if passin == (pass .. "\n") then
    term.clear()
    os.exit()
  else
    print("Пароль не верен. Паладин, ты ли это?")
    for i = 1, 3 do
      computer.beep()
    end
    os.sleep(1)
  end  
end
