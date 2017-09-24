
local __http = {};
local __service = game:service'HttpService';

function __http:Convert(...)
	local synced_data;
	local get_arguments = {...};
	local send, result = pcall(function()
		synced_data = __service:JSONEncode(unpack(get_arguments));
	end);
	if (not send) then
		result = tostring(result);
	end;
	return synced_data, send, result;
end;

function __http:Devert(...)
	local synced_data;
	local get_arguments = {...};
	local send, result = pcall(function()
		synced_data = __service:JSONDecode(unpack(get_arguments));
	end);
	if (not send) then
		result = tostring(result);
	end;
	return synced_data, send, result;
end;

function __http:SetAsync(...)
	local get_arguments = {...};
	if (__http:HttpEnabled() == true) then
		local synced_data;
		local send, result = pcall(function()
			synced_data = __service:PostAsync(unpack(get_arguments));
		end);
		if (not send) then
			result = tostring(result);
		end;
		return synced_data, send, result;
	end;
end;

function __http:GetAsync(...)
	local get_arguments = {...};
	if (__http:HttpEnabled() == true) then
		local synced_data;
		local send, result = pcall(function()
			synced_data = __service:GetAsync(unpack(get_arguments));
		end);
		if (not send) then
			result = tostring(result);
		end;
		return synced_data, send, result;
	end;
end;

function __http:HttpEnabled()
	local synced_data, status, result_end;
	local send, result = pcall(function()
		synced_data = __service:GetAsync'google.com';
	end);
	if (not send) then
		result = tostring(result);
		if (string.lower(result) == 'http requests are not enabled') then
			result_end = result;
			status = false;
		else
			result_end = result;
			status = true;
		end;
	end;
	return status, result_end;
end;

return __http;
