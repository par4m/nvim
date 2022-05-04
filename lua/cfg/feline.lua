local present, feline = pcall(require, "feline")
if not present then
	return
end

local components = {
	inactive = {
		{
			{
				provider = " ",
			},
		},
	},
}

feline.setup({
	force_inactive = {
		filetypes = {
			"NvimTree",
		},
	},
	components = components,
})
