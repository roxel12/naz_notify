local x, y = guiGetScreenSize()
local link = "http://mta/"..getResourceName(getThisResource()).."/web-side/index.html"
local browser = createBrowser(x, y, true, true, false)
local talking = false



setDevelopmentMode(true, true)

function dxNUII()

    dxDrawImage(0, 0, x, y, browser)
    
    
end
addEventHandler('onClientRender', getRootElement(), dxNUII) 

function SendNUIMessage(browser, table)
    if isElement(browser) and type(table) == "table" then
       return executeBrowserJavascript(browser, 'window.postMessage('..toJSON(table)..'[0])')
    end
 end

addEvent("Notify", true)
addEventHandler("Notify", getRootElement(), function(css, mensagem, timer)
    if not timer then timer = 4000 end
    SendNUIMessage(browser, { css = css, mensagem = mensagem, timer = timer })
    playSound("web-side/demo.ogg")
end)



addEventHandler("onClientBrowserCreated", browser, function()
    loadBrowserURL(source, link)
end)