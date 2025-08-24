-- /HOOKS\

cloneref = missing("function", cloneref, function(...) return ... end)
sethidden =  missing("function", sethiddenproperty or set_hidden_property or set_hidden_prop)
gethidden =  missing("function", gethiddenproperty or get_hidden_property or get_hidden_prop)
queueteleport =  missing("function", queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport))
httprequest =  missing("function", request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request))
everyClipboard = missing("function", setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set))
firetouchinterest = missing("function", firetouchinterest)
waxwritefile, waxreadfile = writefile, readfile
writefile = missing("function", waxwritefile) and function(file, data, safe)
    if safe == true then return pcall(waxwritefile, file, data) end
    waxwritefile(file, data)
end
readfile = missing("function", waxreadfile) and function(file, safe)
    if safe == true then return pcall(waxreadfile, file) end
    return waxreadfile(file)
end
isfile = missing("function", isfile, readfile and function(file)
    local success, result = pcall(function()
        return readfile(file)
    end)
    return success and result ~= nil and result ~= ""
end)
makefolder = missing("function", makefolder)
isfolder = missing("function", isfolder)
waxgetcustomasset = missing("function", getcustomasset or getsynasset)
hookfunction = missing("function", hookfunction)
hookmetamethod = missing("function", hookmetamethod)
getnamecallmethod = missing("function", getnamecallmethod or get_namecall_method)
checkcaller = missing("function", checkcaller, function() return false end)
newcclosure = missing("function", newcclosure)
getgc = missing("function", getgc or get_gc_objects)
setthreadidentity = missing("function", setthreadidentity or (syn and syn.set_thread_identity) or syn_context_set or setthreadcontext)
replicatesignal = missing("function", replicatesignal)

-- /SERVICES\

local cg = game:GetService("CoreGui")
local ws = game:GetService("Workspace")
local rs = game:GetService("ReplicatedStorage")
local rf = game:GetService("ReplicatedFirst")
local sp = game:GetService("StarterPlayer")
local spack = game:GetService("StarterPack")
local tm =  game:GetService("Teams")
local ss = game:GetService("SoundService")
local sg = game:GetService("StarterGui")
local tcs = game:GetService("TextChatService")
local vcs = game:GetService("VoiceChatService")

local Luna = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/luna", true))()
local Window = Luna:CreateWindow({
    Name = "RobloxAntiKick",
    Subtitle = "V1.0.0",
    LogoID = "82795327169782",
    LoadingEnabled = true,
    LoadingTitle = "RobloxAntiKick Setup",
    LoadingSubtitle = "by GozBlox (F4X) | RobloxAntiKick Is Currently Creating The UI Please Wait...",

    ConfigSettings = {
        RootFolder = nil, 
        ConfigFolder = "RobloxAntiKick Loader"
    },

    KeySystem = false,
    KeySettings = {
        Title = "RobloxAntiKick KeySystem",
        Subtitle = "Key System",
        Note = "idk there no key system ye ye ye",
        SaveInRoot = false
        SaveKey = true,
        Key = {"Free Palestine"},
        SecondAction = {
            Enabled = true,
            Type = "Link",
            Parameter = ""
        }
    }
})

local important = Window:CreateTab({
    Name = "Important",
    Icon = "view_in_ar",
    ImageSource = "Material",
    ShowTitle = true
})
esp:CreateSection("Try These Exploits")
local vr7Exploit = important:CreateButton({
    Name = "VR7",
    Description = nil, 
    Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/VR7ss/OMK/refs/heads/main/VR7-ON-TOP"))()
        
    end
})
local akTab = Window:CreateTab({
    Name = "Anti Kick Tab",
    Icon = "view_in_ar",
    ImageSource = "Material",
    ShowTitle = true
})
akTab:CreateSection("Anti Kick Section")
local wiak = akTab:CreateParagraph({
    Title = "What is Anti Kick",
    Text = "It is a button or feature that prevents any Client Anti Cheat system in games from banning you from the game (the scripts that tell you that they disable Server Anti Cheat are all lies)"
})
local githubLink = akTab:CreateLabel({
    Text = "https://github.com/GozBlox/RobloxAntiKick",
    Style = 3
})
akTab:CreateSection("Anti Kick Feature")
local clientAntiKick = akTab:CreateButton({
    Name = "Anti Kick",
    Description = "bypass client anti cheats",
    Callback = function()
      local LP = game.LocalPlayer
      local oldhm
      local oldhmc
      local oldKickFunction
      if hookfunction then
        oldKickFunction = hookfunction(LP.Kick, function() end)
      end
      oldhm = hookmetamethod(game, "__index", function(self, method)
        if self == LocalPlayer and method:lower() == "kick" then
          return error("Expected ':' not '.' calling member function Kick", 2)
        end
        return oldhm(self, method)
      end)
      oldhmc = hookmetamethod(game, "__namecall", function(self, ...)
        if self == LocalPlayer and getnamecallmethod():lower() == "kick" then
          return
        end
        return oldhmc(self, ...)
    end)
    end
})
