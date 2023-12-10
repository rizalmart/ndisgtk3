BIN = $(DESTDIR)/usr/sbin
SUPPORT = $(DESTDIR)/usr/share/ndisgtk
ICONS = $(DESTDIR)/usr/share/icons/hicolor/48x48/apps
PIXMAPS = $(DESTDIR)/usr/share/pixmaps
MENU = $(DESTDIR)/usr/share/applications
LOCALEDIR = $(DESTDIR)/usr/share/locale
INPUT_FILES = $(wildcard *.in)


all: $(INPUT_FILES:.in=)
	$(MAKE) -C po

install: all
	install -d $(BIN) $(SUPPORT) $(MENU) $(ICONS) $(PIXMAPS)
	install ./ndisgtk $(BIN)
	install -m644 ndisgtk.png $(ICONS)
	install -m644 ndisgtk-error.png $(ICONS)
	install -m644 ndisgtk.xpm $(PIXMAPS)
	install -m644 ndisgtk.glade $(SUPPORT)
	install -m644 ndisgtk.desktop $(MENU)
	install -m644 ndisgtk-kde.desktop $(MENU)
	$(MAKE) -C po install LOCALEDIR=$(LOCALEDIR)

clean:
	$(MAKE) -C po clean
	rm -f $(INPUT_FILES:.in=)

.SUFFIXES: .in
.in:
	intltool-merge -d po $< $@ 
