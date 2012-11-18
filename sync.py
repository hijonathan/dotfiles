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

        backup_existing(home_path)
        remove_existing(home_path)

        make_symlink(dotfile_path, home_path)


def get_file_path(file_name):
    path_parts = file_name.split(':')
    return os.path.join(HOME_DIR, os.path.join(*path_parts))


def backup_existing(source_path):
    backup_dir = os.path.join(os.getcwd(), 'backup')
    if not os.path.exists(backup_dir) or not os.path.isdir(backup_dir):
        os.mkdir(backup_dir)
        print ('INFO: Created new backup dir at %s') % backup_dir

    contents = ''
    with open(source_path) as f:
        contents = f.read()

    backup_file_name = make_file_name(source_path)
    backup_file_path = os.path.join(backup_dir, backup_file_name)
    with open(backup_file_path, 'w') as f:
        f.write(contents)

    print ('INFO: Backed up %s as %s') % (source_path, backup_file_path)

    return


def make_file_name(file_path):
    path_parts = file_path.replace(HOME_DIR + '/', '').split('/')
    return ':'.join(path_parts)


def remove_existing(target_path):
    print ('INFO: Removed file at %s' % (target_path))
    os.remove(target_path)
    return


def make_symlink(source_path, target_path):
    try:
        print ('SUCCESS: Created a symlink between %s and %s' % (source_path, target_path))
        os.symlink(source_path, target_path)
    except:
        print ('FAILURE: Couldn\'t symlink %s and %s' % (source_path, target_path))
        pass

    return


if __name__ == '__main__':
    sync()
