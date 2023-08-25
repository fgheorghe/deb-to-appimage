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
examples:
	make app-name=Brave  executable-path=.\\/usr\\/bin\\/brave-browser-stable package-name=brave-browser category=X-browsers icon-path=./icons/brave.png
	make app-name=CPU-X  executable-path=.\\/usr\\/bin\\/cpu-x package-name=cpu-x category=X-system icon-path=./icons/cpu-x.png
	make app-name=Thunderbird  executable-path=.\\/usr\\/bin\\/thunderbird package-name=thunderbird category=X-email icon-path=./icons/thunderbird.png
	make app-name=Konsole  executable-path=.\\/usr\\/bin\\/konsole package-name=konsole category=X-utility icon-path=./icons/terminal.png
	# make app-name=Krita  executable-path=.\\/usr\\/bin\\/krita package-name=krita category=X-utility icon-path=./icons/krita.png
	make app-name=Hardinfo  executable-path=.\\/usr\\/bin\\/hardinfo package-name=hardinfo category=X-utility icon-path=./icons/hardinfo.png
	# make app-name=GIMP  executable-path=.\\/usr\\/bin\\/gimp package-name=gimp category=X-utility icon-path=./icons/gimp.png
	# make app-name=Blender  executable-path=.\\/usr\\/bin\\/blender package-name=blender category=X-utility icon-path=./icons/blender.png
