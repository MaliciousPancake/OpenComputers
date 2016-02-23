local component = require("component")
local term = require("term")
local reactor = component.br_reactor
 
component.gpu.setResolution(45, 15)
 
while true do
  if component.isAvailable("br_reactor") == true then
    term.clear()
    if reactor.getActive() == true then
      print("Реактор включен.")
      else
    print("Реактор выключен.")
    end
    print("Энергии накоплено реактором:"..reactor.getEnergyStored())
    print("Энергии выработано за тик:"..math.floor(reactor.getEnergyProducedLastTick()))
    print("Количество топлива:"..reactor.getFuelAmount())
    print("Количество охладителя:"..reactor.getCoolantAmount())
    print("Температура топлива:"..math.floor(reactor.getFuelTemperature()))
    print("Температура контура:"..math.floor(reactor.getCasingTemperature()))
    print("Топлива потреблено за тик:"..string.format("%g", reactor.getFuelConsumedLastTick()))
    os.sleep(1)
  else
    term.clear()
    print("Реактор не подключен.")
    os.sleep(1)
  end
end
