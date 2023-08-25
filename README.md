Converts debian packages to App Images.

# Makefile parameters:

``app-name`` - Application name (ie: Brave, CPU-X).

```executable-path``` - Path to executable within image directory. (i.e.: ./usr/bin/cpu-x).

```package-name``` - Debian package name (i.e.: cpu-x, nano)

```category``` - App image category name (i.e.: X-browsers)

```icon-path``` - Path to icon file to include (i.e.: images/brave.png).

# Example usage

See Makefile examples task.

# TODO

Many items on the todo list, including: cleanup after extracting packages, add automated output testing, include versioning.

Some builds fail for: gimp, xfce4-terminal, krita due to missing shared libraries.