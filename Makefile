PKG_PREFIX=sflvault-

DIR_DEB=deb
DIR_COMMON=common
DIR_CLIENT=client
DIR_CLIENT_QT=client-qt
DIR_SERVER=server

all: common-deb-pkg client-deb-pkg client-qt-deb-pkg server-deb-pkg
	@echo
	@echo "sflvault has been fully built"
	@find $(DIR_DEB)

clean: common-deb-clean client-deb-clean client-qt-deb-clean server-deb-clean

common-deb-clean:
	rm -rf $(DIR_COMMON)/deb_dist
	rm -rf $(DIR_COMMON)/debian
	rm -rf $(DIR_COMMON)/*.egg-info
	rm -rf $(DIR_DEB)/$(PKG_PREFIX)$(DIR_COMMON)

common-deb-src: common-deb-clean
	mkdir $(DIR_COMMON)/debian
	cp pydist-overrides $(DIR_COMMON)/debian/
	cd $(DIR_COMMON) && python setup.py --command-packages=stdeb.command sdist_dsc
	rm -rf $(DIR_COMMON)/debian
	mkdir -pv $(DIR_DEB)/$(PKG_PREFIX)$(DIR_COMMON)
	cp -vf $(DIR_COMMON)/deb_dist/$(PKG_PREFIX)$(DIR_COMMON)*.tar.gz $(DIR_DEB)/$(PKG_PREFIX)$(DIR_COMMON)/
	cp -vf $(DIR_COMMON)/deb_dist/$(PKG_PREFIX)$(DIR_COMMON)*.dsc    $(DIR_DEB)/$(PKG_PREFIX)$(DIR_COMMON)/

common-deb-pkg: common-deb-src
	mkdir $(DIR_COMMON)/debian
	cp pydist-overrides $(DIR_COMMON)/debian/
	cd $(DIR_COMMON) && python setup.py --command-packages=stdeb.command bdist_deb
	rm -rf $(DIR_COMMON)/debian
	mkdir -pv $(DIR_DEB)/$(PKG_PREFIX)$(DIR_COMMON)
	cp -vf $(DIR_COMMON)/deb_dist/$(PKG_PREFIX)$(DIR_COMMON)*.deb $(DIR_DEB)/$(PKG_PREFIX)$(DIR_COMMON)/
	@echo
	@find $(DIR_DEB)/$(PKG_PREFIX)$(DIR_COMMON)

client-deb-clean:
	rm -rf $(DIR_CLIENT)/deb_dist
	rm -rf $(DIR_CLIENT)/debian
	rm -rf $(DIR_CLIENT)/*.egg-info
	rm -rf $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT)

client-deb-src: client-deb-clean
	mkdir $(DIR_CLIENT)/debian
	cp pydist-overrides $(DIR_CLIENT)/debian/
	cd $(DIR_CLIENT) && python setup.py --command-packages=stdeb.command sdist_dsc
	rm -rf $(DIR_CLIENT)/debian
	mkdir -pv $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT)
	cp -vf $(DIR_CLIENT)/deb_dist/$(PKG_PREFIX)$(DIR_CLIENT)*.tar.gz $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT)/
	cp -vf $(DIR_CLIENT)/deb_dist/$(PKG_PREFIX)$(DIR_CLIENT)*.dsc    $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT)/

client-deb-pkg: client-deb-src
	mkdir $(DIR_CLIENT)/debian
	cp pydist-overrides $(DIR_CLIENT)/debian/
	cd $(DIR_CLIENT) && python setup.py --command-packages=stdeb.command bdist_deb
	rm -rf $(DIR_CLIENT)/debian
	mkdir -pv $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT)
	cp -vf $(DIR_CLIENT)/deb_dist/$(PKG_PREFIX)$(DIR_CLIENT)*.deb $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT)/
	@echo
	@find $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT)

client-qt-deb-clean:
	rm -rf $(DIR_CLIENT_QT)/deb_dist
	rm -rf $(DIR_CLIENT_QT)/debian
	rm -rf $(DIR_CLIENT_QT)/*.egg-info
	rm -rf $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT_QT)

client-qt-deb-src: client-qt-deb-clean
	mkdir $(DIR_CLIENT_QT)/debian
	cp pydist-overrides $(DIR_CLIENT_QT)/debian/
	cd $(DIR_CLIENT_QT) && python setup.py --command-packages=stdeb.command sdist_dsc
	rm -rf $(DIR_CLIENT_QT)/debian
	mkdir -pv $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT_QT)
	cp -vf $(DIR_CLIENT_QT)/deb_dist/$(PKG_PREFIX)$(DIR_CLIENT_QT)*.tar.gz $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT_QT)/
	cp -vf $(DIR_CLIENT_QT)/deb_dist/$(PKG_PREFIX)$(DIR_CLIENT_QT)*.dsc    $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT_QT)/

client-qt-deb-pkg: client-qt-deb-src
	mkdir $(DIR_CLIENT_QT)/debian
	cp pydist-overrides $(DIR_CLIENT_QT)/debian/
	cd $(DIR_CLIENT_QT) && python setup.py --command-packages=stdeb.command bdist_deb
	rm -rf $(DIR_CLIENT_QT)/debian
	mkdir -pv $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT_QT)
	cp -vf $(DIR_CLIENT_QT)/deb_dist/$(PKG_PREFIX)$(DIR_CLIENT_QT)*.deb $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT_QT)/
	@echo
	@find $(DIR_DEB)/$(PKG_PREFIX)$(DIR_CLIENT_QT)

server-deb-clean:
	rm -rf $(DIR_SERVER)/deb_dist
	rm -rf $(DIR_SERVER)/debian
	rm -rf $(DIR_SERVER)/*.egg-info
	rm -rf $(DIR_DEB)/$(PKG_PREFIX)$(DIR_SERVER)

server-deb-src: server-deb-clean
	mkdir $(DIR_SERVER)/debian
	cp pydist-overrides $(DIR_SERVER)/debian/
	cd $(DIR_SERVER) && python setup.py --command-packages=stdeb.command sdist_dsc
	rm -rf $(DIR_SERVER)/debian
	mkdir -pv $(DIR_DEB)/$(PKG_PREFIX)$(DIR_SERVER)
	cp -vf $(DIR_SERVER)/deb_dist/$(PKG_PREFIX)$(DIR_SERVER)*.tar.gz $(DIR_DEB)/$(PKG_PREFIX)$(DIR_SERVER)/
	cp -vf $(DIR_SERVER)/deb_dist/$(PKG_PREFIX)$(DIR_SERVER)*.dsc    $(DIR_DEB)/$(PKG_PREFIX)$(DIR_SERVER)/

server-deb-pkg: server-deb-src
	mkdir $(DIR_SERVER)/debian
	cp pydist-overrides $(DIR_SERVER)/debian/
	cd $(DIR_SERVER) && python setup.py --command-packages=stdeb.command bdist_deb
	rm -rf $(DIR_SERVER)/debian
	mkdir -pv $(DIR_DEB)/$(PKG_PREFIX)$(DIR_SERVER)
	cp -vf $(DIR_SERVER)/deb_dist/$(PKG_PREFIX)$(DIR_SERVER)*.deb $(DIR_DEB)/$(PKG_PREFIX)$(DIR_SERVER)/
	@echo
	@find $(DIR_DEB)/$(PKG_PREFIX)$(DIR_SERVER)

