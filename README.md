## Introduction
This script can automatically install @oblitum's Interceptions tools and caps2esc (https://gitlab.com/interception/linux/plugins/caps2esc) and add a configuration to map your ***Esc*** and ***Ctrl*** keys to ***CapsLock***. You will get a ***Esc*** key with only a ***CapsLock*** pressed and get a ***Ctrl*** key when pressing ***CapsLock*** with other keys at the same time.

## Installation
**May only works in Linux.**

Make sure you have installed below
```
cmake
libevdev
yaml-cpp
```

Use `git clone --recursive https://github.com/qsdrqs/caps2esc_autoinstall.git` to clone and run : `./install.sh` to take the installation.
You can use `-s [DIR]` to point out your customized path of **systemd** services if the default path is not work for you.

The default `systemd` path in this project is `/lib/systemd/system`.

:WQ## License
GPL-3.0
