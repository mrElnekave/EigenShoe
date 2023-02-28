

import os


def main():
    """Create an application that will take all files in the local directory, and add the .jpg extension to them. But not if they are .gif, .jpg, .py, .m files.
    """
    for f in os.listdir():
        if f.endswith(".gif") or f.endswith(".jpg") or f.endswith(".py") or f.endswith(".m"):
            continue
        os.rename(f, f + ".jpg")


if __name__ == "__main__":
    main()
