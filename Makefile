.PHONY: apollo-cli apollo-schema apollo-generate apollo-config

PACKAGE_DIR := Packages/TsugiKit
APOLLO_CLI  := .build/apollo-ios-cli

GRAPHQL_DIR    := GraphQL
CODEGEN_CONFIG := $(GRAPHQL_DIR)/apollo-codegen-config.json

apollo-cli: $(APOLLO_CLI)

$(APOLLO_CLI):
	@mkdir -p $(dir $@)
	@if [ -f $(PACKAGE_DIR)/apollo-ios-cli ]; then \
		cp -f $(PACKAGE_DIR)/apollo-ios-cli $@ && rm -f $(PACKAGE_DIR)/apollo-ios-cli; \
	elif [ -f apollo-ios-cli ]; then \
		cp -f apollo-ios-cli $@ && rm -f apollo-ios-cli; \
	else \
		(cd $(PACKAGE_DIR) && swift package --allow-writing-to-package-directory --allow-network-connections all apollo-cli-install) && \
		if [ -f $(PACKAGE_DIR)/apollo-ios-cli ]; then SRC=$(PACKAGE_DIR)/apollo-ios-cli; else SRC=apollo-ios-cli; fi && \
		cp -f "$$SRC" $@ && rm -f "$$SRC"; \
	fi
	@chmod +x $@
	@./$@ --version

apollo-schema: apollo-cli
	@./$(APOLLO_CLI) fetch-schema --path $(CODEGEN_CONFIG)

apollo-config: apollo-cli
	@./$(APOLLO_CLI) init \
		--schema-namespace TsugiGraphQL \
		--module-type other \
		--path $(CODEGEN_CONFIG)

apollo-generate: apollo-cli
	@./$(APOLLO_CLI) generate --path $(CODEGEN_CONFIG)
