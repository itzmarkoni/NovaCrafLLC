local function run()
    local monitor = peripheral.wrap("top")
    local modem = peripheral.wrap("back")
    print(monitor)
    monitor.setTextScale(1)
    local maxWidth, maxHeight = monitor.getSize()
    local y = 1
    monitor.setCursorPos(1, y)
    local init = "Initalizing stream...."
    monitor.write(init)
    print(init)
    y = y+1
    modem.open(80)

    while true do
        local _, _, _, _, message = os.pullEvent("modem_message")
        monitor.setCursorPos(1, y)
        print(message)
        monitor.write(message)
        y=y+1
    end
end

return { run = run }