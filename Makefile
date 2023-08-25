all: set-up download-dependencies extract-packages package
set-up:
	@echo "Setting up $(app-name)"
	@rm -rf build/$(app-name)
	@mkdir -p build/$(app-name)/dependencies
	@mkdir -p build/$(app-name)/$(app-name)-x86_64.AppImage
	@cat template.desktop | sed 's/APP_NAME/$(app-name)/' | sed 's/CATEGORY/$(category)/' > build/$(app-name)/$(app-name)-x86_64.AppImage/$(app-name).desktop
	@cat AppRun.template | sed 's/EXECUTABLE_PATH/$(executable-path)/' > build/$(app-name)/$(app-name)-x86_64.AppImage/AppRun
	@chmod +x build/$(app-name)/$(app-name)-x86_64.AppImage/AppRun
	@cp $(icon-path) build/$(app-name)/$(app-name)-x86_64.AppImage/$(app-name).png
	@echo "Done setting up."
download-dependencies:
	@echo "Downloading dependencies..."
	@./download-dependencies.sh $(package-name) build/$(app-name)/dependencies
	@echo "Done downloading dependencies."
extract-packages:
	@echo "Extracting packages..."
	@./extract-packages.sh build/$(app-name)/dependencies $(app-name)-x86_64.AppImage
package:
	@ARCH=x86_64 ./appimagetool-x86_64.appimage build/$(app-name)/$(app-name)-x86_64.AppImage/ build/$(app-name)-x86_64.AppImage