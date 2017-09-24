
local __self = script;
local __modules = __self.Parent;
local __main = __modules.Parent;
local __recursive = __main:WaitForChild('RecursiveCompatability', 5);
local __compatability = {};

function __compatability:SetBindable(bindable_name, void)
	local __bindable = __recursive:FindFirstChild(bindable_name);
	if (__bindable.ClassName == 'BindableFunction') then
		function __bindable.OnInvoke(...)
			return void(...);
		end;
	elseif (__bindable.Classname == 'BindableEvent') then
		__bindable.Event:connect(void);
	end;
end;

__compatability:SetBindable('__getModule', function(module_name)
	return __modules:FindFirstChild(module_name);
end);

return __compatability;







