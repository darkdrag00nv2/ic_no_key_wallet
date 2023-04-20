.PHONY: check docs test

install-dfx-cache: 
	dfx cache install

check: install-dfx-cache
	find src -type f -name '*.mo' -print0 | xargs -0 $(shell dfx cache show)/moc $(shell vessel sources) --check

all: check-strict docs test

check-strict: install-dfx-cache
	find src -type f -name '*.mo' -print0 | xargs -0 $(shell dfx cache show)/moc $(shell vessel sources) -Werror --check

docs: install-dfx-cache
	$(shell dfx cache show)/mo-doc

third_party: install-dfx-cache
	./setup_third_party.sh

test:
	make -C test
