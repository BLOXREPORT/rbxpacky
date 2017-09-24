
--[[
	java_data = {
		1;
		{
			'asds/asd/asd';
		};
	};
	
	java_path = {
		Name = '';
		Class = '';
		Disabled = true;
		Source = '';
	};
--]]
local __self = script;
local __modules = __self.Parent;
local __main = __modules.Parent;
local __assets = __main:FindFirstChild'Assets';
local __recursive = __main:WaitForChild('RecursiveCompatability', 5);
local __github = {
	__rawbase = 'https://raw.githubusercontent.com/';
	__repositories = {};
};
local __http = require(__recursive.__getModule:Invoke'__http');
local __compatability = require(__recursive.__getModule:Invoke'__compatability');

function __github:GitObject(user, repository_name, branch, java_path)
	local proxy = newproxy(true);
	local data = getmetatable(proxy);
	data.__index = {
		--https://raw.githubusercontent.com/alphafantomu/Repository-Compiler/master/JavaPath.json
		repository_name = repository_name;
		user = user;
		branch = branch;
		java_path = java_path;
		path_data = __github.__rawbase..user..'/'..repository_name..'/'..branch..'/'..java_path;
	};
	
	function data:GetPath(get_path)
		return __github.__rawbase..user..'/'..repository_name..'/'..branch..'/'..get_path;
	end;
	
	return proxy;
end;

function __github:GetSource(path)
	return __http:GetAsync(path, false);
end;

function __github:RecordRepository(git_object, asset)
	__github.__repositories[asset.Name] = {};
end;

function __github:RepositoryAsset(git_object)
	local java_data, check, result = __http:Devert(__github:GetSource(git_object.path_data));
	local repository_asset = Instance.new'Folder';
	repository_asset.Name = git_object.repository_name;
	repository_asset.Parent = __assets;
	local version_asset = Instance.new'Folder';
	version_asset.Name = java_data[1] or '';
	version_asset.Parent = repository_asset;
	------------DOWNLOAD DATA STARTS HERE--------------
	for index, value in next, java_data[2] or {} do
		local java_path = __http:Devert(__github:GetSource(git_object:GetPath(value)));
		--create script here
		local java_script = Instance.new(java_path.Class);
		java_script.Name = java_path.Name;
		java_script.Source = java_path.Source;
		java_script.Disabled = java_path.Disabled;
		java_script.Parent = version_asset;
	end;
	__github:RecordRepository(git_object, repository_asset);
	
	return repository_asset;
end;

__compatability:SetBindable('__getRepository', function(repository_name)
	return __github:FindFirstChild(repository_name);
end);

return __github;










