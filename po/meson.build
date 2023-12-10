project('ndisgtk', 'c')

po_dir = 'po'
localedir = get_option('prefix') / 'usr' / 'share' / 'locale'
domain = 'ndisgtk'

po_files = files(glob(join_paths(po_dir, '*.po')))
mo_files = [file.replace_suffix('.mo') for file in po_files]
linguas = [file.name.replace('.po', '') for file in po_files]

targets = []

foreach lang: linguas
  target_name = '@0@/LC_MESSAGES/@1@.mo'.format(lang, domain)
  targets += custom_target(target_name, input: join_paths(po_dir, '@0@.po'.format(lang)), output: target_name,
                           command: ['msgfmt', '-o', '@OUT@', '@INPUT@'])

install_targets = []
foreach lang: linguas
  install_targets += install_data(targets[linguas.index(lang)], install_dir: '@0@/@1@'.format(localedir, lang))

po_clean_files = [file.replace_suffix('.mo') for file in po_files]
po_clean_files += [join_paths(po_dir, '*.gmo')] # Add any additional generated files

foreach file: po_clean_files
  configure_file(file, output: file, install_dir: '@0@'.format(localedir))
endforeach

install_data('po-update.sh', install_dir: po_dir, install_mode: 'rwxr-xr-x')

add_install_script('$(builddir)/@0@/po-update.sh'.format(po_dir))
