import os


def walk_file_tree(f, proc):
    for root, dirs, files in os.walk(f):
        for file in files:
            proc(os.path.join(root, file))


if __name__ == "__main__":
    walk_file_tree("C:\\", lambda f: print(os.path.abspath(f)))
