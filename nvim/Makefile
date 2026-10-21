.PHONY: install
install:
	test -d ${HOME}/.config || mkdir ${HOME}/.config
	rsync -av --delete \
		--exclude 'lazy-lock.json' \
		../nvim/ ${HOME}/.config/nvim/

.PHONY: clean
clean:
	rm -rf ${HOME}/.config/nvim
	mkdir ${HOME}/.config/nvim

.PHONY: requirements
requirements:
	@echo "Use :Mason to install missing tools!"
