#
# Makefile for po/
# Copyright (C) 2007 Julian Andres Klode

POFILES    := $(wildcard *.po)
MOFILES    := $(POFILES:.po=.mo)
LINGUAS    := $(POFILES:.po=)
LOCALEDIR  := $(DESTDIR)/usr/share/locale
DOMAIN      = ndisgtk
top_srcdir  =..



all: $(MOFILES)

install: $(MOFILES)
	for locale in $(LINGUAS); do \
		install -D -m644 $$locale.mo $(LOCALEDIR)/$$locale/LC_MESSAGES/$(DOMAIN).mo || exit 1; \
	done

update:
	intltool-update -g $(DOMAIN) -r

clean:
	rm -f $(MOFILES)

.SUFFIXES: .po .mo

.po.mo:
	msgfmt -o $@ $<


