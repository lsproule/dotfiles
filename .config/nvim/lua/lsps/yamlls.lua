return {
	"yamlls",
	config = function(lspconfig)
		lspconfig.yamlls.setup({
			schemas = {
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0/all.json"] = "k8s/**",
				["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
					"ci/*.yml",
					".gitlab-ci.yml",
				},
				["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = {
					"*.yaml",
					"*.yml",
				},
			},
			settings = {
				yaml = {
					schemaStore = {
						url = "https://www.schemastore.org/api/json/catalog.json",
						enable = true,
					},
					schemas = {
						["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0/all.json"] = "k8s/**",
						["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
							"ci/*.yml",
							".gitlab-ci.yml",
						},
					},
				},
			},
		})
	end,
}
