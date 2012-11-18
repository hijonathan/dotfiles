import os
import logging
lg = logging.getLogger('Dotfiles Sync')

HOME_DIR = '/Users/jonathankim'
FILES_TO_IGNORE = [
    '.DS_Store'
]


def sync():
    dotfiles = filter(lambda x: x not in FILES_TO_IGNORE, os.listdir('files'))
    dotfiles_dir = os.path.join(os.getcwd(), 'files')

    for file_name in dotfiles:
        dotfile_path = os.path.join(dotfiles_dir, file_name)
        home_path = get_file_path(file_name)

        make_symlink(dotfile_path, home_path)


def get_file_path(file_name):
    path_parts = file_name.split(':')
    return os.path.join(HOME_DIR, os.path.join(*path_parts))


def make_symlink(source_path, target_path):
    try:
        print ('SUCCESS: Created a symlink between %s and %s' % (source_path, target_path))
        # os.symlink(source_path, target_path)
    except:
        print ('FAILURE: Couldn\'t symlink %s and %s' % (source_path, target_path))
        pass

    return


if __name__ == '__main__':
    sync()
