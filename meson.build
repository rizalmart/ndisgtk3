project('ndisgtk', 'c')

dest_bin = get_option('prefix') / 'usr' / 'sbin'
dest_support = get_option('prefix') / 'usr' / 'share' / 'ndisgtk'
dest_icons = get_option('prefix') / 'usr' / 'share' / 'icons' / 'hicolor' / '48x48' / 'apps'
dest_pixmaps = get_option('prefix') / 'usr' / 'share' / 'pixmaps'
dest_menu = get_option('prefix') / 'usr' / 'share' / 'applications'
dest_localedir = get_option('prefix') / 'usr' / 'share' / 'locale'

sources = files('ndisgtk.c')
input_files = files(glob('*.in'))

executable('ndisgtk', sources)

install_data('ndisgtk', install_dir: dest_bin)
install_data('ndisgtk.png', install_dir: dest_icons)
install_data('ndisgtk-error.png', install_dir: dest_icons)
install_data('ndisgtk.xpm', install_dir: dest_pixmaps)
install_data('ndisgtk.glade', install_dir: dest_support)
install_data('ndisgtk.desktop', install_dir: dest_menu)
install_data('ndisgtk-kde.desktop', install_dir: dest_menu)

foreach file: input_files
  configure_file(file, output: file.basename(), install_dir: dest_support)
endforeach

po_dir = 'po'
localedir_option = '--localedir=' + dest_localedir

meson.add_install_script('install -d @0@ @1@ @2@ @3@ @4@'.format(dest_bin, dest_support, dest_menu, dest_icons, dest_pixmaps))
meson.add_install_script('make -C @0@ install LOCALEDIR=@1@'.format(po_dir, dest_localedir))

clean_files = ['@0@'.format(file.basename()) for file in input_files]
meson.add_clean_files(clean_files)
