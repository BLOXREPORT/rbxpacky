
--[[
	manages script and package loadings
--]]
local __self = script;
local __modules = __self.Parent;
local __main = __modules.Parent;
local __recursive = __main:WaitForChild('RecursiveCompatability', 5);
local __manager = {
	
	managing = {};
};
local __compatability = require(__recursive.__getModule:Invoke'__compatability');
local loadstring = require(__recursive.__getModule:Invoke'__loadstring');
local env = require(__recursive.__getModule:Invoke'__environment');

function __manager:Replicate(array)
	local new_array = {};
	for i, v in next, array do
		rawset(new_array, i, v);
	end;
	return new_array;
end;

function __manager:SetRepositoryEvent(repository)
	local bindable = Instance.new'BindableEvent';
	bindable.Name = '__stopRepository:'..repository;
	bindable.Parent = __recursive;
end;

function __manager:ExecuteScript(source_container, event)
	local modified_env = __manager:Replicate(env);
	modified_env.__recursive = __recursive;
	if (source_container.ClassName == 'Script') then
		__manager.managing[source_container..source_container:GetDebugId(37)] = loadstring([[
			__recursive:FindFirstChild('__stopRepository:]]..event.Name:sub(18)..[[').Event:connect(function()
				
			end;
		]], modified_env);
	elseif (source_container.ClassName == 'LocalScript') then
		
	end;
end;

function __manager:LoadRepository(repository)
	for i, v in next, repository:children() do
		__manager:ExecuteScript(v, __manager:SetRepositoryEvent(repository));
	end;
end;

return __manager;







