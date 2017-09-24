
--[[
	This system will be anti-errored, get roast'd roblox
	
	--to-do
		--Make it check updates
		--set up repositories
		--__manager load the scripts within repositories
--]]
print'RUNNING NOW';

wait();
local __self = script;
local __plugin = plugin;
local __folder = __self.Parent or __plugin:children()[1];
local __modules = __folder:WaitForChild('Modules', 5);
local __assets = __folder:WaitForChild('Assets', 5);
local __recursive = __folder:WaitForChild('RecursiveCompatability', 5);
local __select = game:service'Selection';
local __compatability = require(__modules:FindFirstChild'__compatability');
local __http = require(__modules:FindFirstChild'__http');
local __github = require(__modules:FindFirstChild'__github');

local __toolbar = __plugin:CreateToolbar'Packy';
local __bsettings = __toolbar:CreateButton('Settings', 'Open Packy\'s settings', 'http://www.roblox.com/asset/?id=78930759');
local __bupdates = __toolbar:CreateButton('Updates', 'Check for asset updates', 'http://www.roblox.com/asset/?id=78930759');
local __bdpackages = __toolbar:CreateButton('Downloaded Packages', 'Shows downloaded packages', 'http://www.roblox.com/asset/?id=78930759');
local __bbpackages = __toolbar:CreateButton('Installed Packages', 'Shows available packages', 'http://www.roblox.com/asset/?id=78930759');

local __packyhub = {
	user = 'BLOXREPORT';
	repository_name = 'rbxpacky';
};

__packyhub.__approvedpackages = __github.__rawbase..__packyhub.user..'/'..__packyhub.repository_name..'/master'..'ratified_packages.json';

__bsettings.Click:connect(function()
	warn'Got settings';
end);

__bupdates.Click:connect(function()
	warn'Checking updates';
end);

__bdpackages.Click:connect(function()
	warn'Checking downloaded packages';
end);

__bbpackages.Click:connect(function()
	warn'Checking available packages';
end);

local __testbutton = __toolbar:CreateButton('Test', 'Test button', 'Testing');

__testbutton.Click:connect(function()
	local git_object = __github:GitObject('alphafantomu', 'Repository-Compiler', 'master', 'JavaPath.json');
	local git_repository = __github:RepositoryAsset(git_object);
	__assets.Parent = game;
end);

print'CREATED.';





