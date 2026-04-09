.PHONY: install
install:
	test -d ${HOME}/.config || mkdir ${HOME}/.config
	cp -vbR ../nvim ${HOME}/.config/

.PHONY: clean
clean:
	rm -rf ${HOME}/.config/nvim
	mkdir ${HOME}/.config/nvim

.PHONY: requirements
requirements:
	@echo "Use :Mason to install missing tools!"
