Converts debian packages to App Images.

# Makefile parameters:

``app-name`` - Application name (ie: Brave, CPU-X).

```executable-path``` - Path to executable within image directory. (i.e.: ./usr/bin/cpu-x).

```package-name``` - Debian package name (i.e.: cpu-x, nano)

```category``` - App image category name (i.e.: X-browsers)

```icon-path``` - Path to icon file to include (i.e.: images/brave.png).

# Example usage

Convert Brave:

```make app-name=Brave  executable-path=.\\/usr\\/bin\\/brave-browser-stable package-name=brave-browser category=X-browsers icon-path=./icons/brave.png```

Convert CPU-X:

```make app-name=CPU-X  executable-path=.\\/usr\\/bin\\/cpu-x package-name=cpu-x category=X-system icon-path=./icons/cpu-x.png```

Convert Thunderbird:

```make app-name=Thunderbird  executable-path=.\\/usr\\/bin\\/thunderbird package-name=thunderbird category=X-email icon-path=./icons/thunderbird.png```


# TODO

Many items on the todo list, including: cleanup after extracting packages, add automated output testing, include versioning.