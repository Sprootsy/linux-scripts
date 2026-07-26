vim.filetype.add({
	pattern = {
		[".*\\.py$"] = "python",
		["docker-compose.yaml"] = "yaml.docker-compose",
		[".*/.gitconfig.*"] = "gitconfig",
		[".*/ansible/.*.ya?ml"] = "yaml.ansible",
	},
})
