# Quoil *(Name in progress)*

**What is Quoil?** Quoil is a group of configuration files made by me *(Kroma)* for Quickshell.

**What is Quickshell?** Quickshell is a desktop shell for wayland, or rather a toolkit for building a desktop shell developed by outfoxxed.

**What is a desktop shell?** A desktop shell is the user interface for which you use to interact with your desktop environment. Components of a desktop shell include, a status bar, power menu, etc.

## What Does Quoil Offer?

Quoil offers a super sleak, minimilistic and modern desktop design to integrate with your Hyprland desktop environment, providing you with every feature you could need from a workspace arranger and power profile configurer to a power menu and lock screen.

## Requirements

This configuration was designed for Arch linux running the Hyprland desktop environment on Wayland. While it should work on other distros, I'm not sure how well it will integrate with other desktop environments. You will need to install Quickshell (git version) however:

    yay -S quickshell-git

and be running Wayland as it is a requirement for Quickshell.

## Other Recommended Applications

- Rofi for App launcher
- Legcord for Discord
- Dolphin for file manager
- Kitty for terminal
- VS Codium for code and text editor
- Micro for terminal based text editor
- Timeshift for snapshots

## Detailed List of Features

- List of features will be added as the project gets closer to completion

## Current TODO List

- #### STATUS BAR:
    - Status Icons:
        - [ ] Make Performance icon show cpu, gpu, and ram utilization, space, temperature and such. (Also add computer up time)
            - [ ] Change logo to the speed dial thingy shown on the performance on the dashboard. Rather than cpu logo.
        - [ ] Make clicking icons do things (mostly opening programs)
            - [ ] bluetooth opens bluetooth manager
            - [ ] network opens network settings
            - [ ] performance opens system monitor
        - [ ] Readd idle manager or something (clicking on it makes hypridle not lock/shutdown computer after idle time)
        - [ ] Add more status icons
            - [ ] Audio: for changing volume and IO audio devices.
            - [ ] Media: or music. It shows media controls like the media tab of the dashboard. (Only display if media is loaded)
                - [ ] (Clicking opens a music window that I design. Will have options like an audio reactor that can be placed on a second monitor for texture)
            - [ ] Display: change brightness, turn on blue light filter. - [ ] Clicking opens monitor settings like changing refresh rate and monitor position
        - [ ] Make network icon change to ethernet icon if ethernet is connected
        - [ ] Make hovering or clicking the clock in the center open up a calendar
    - [ ] Center clock on screen

- #### SYSTEM:
    - [ ] Make system (power menu) appear in the middle of the screen rather than the side
        - [ ] Remove dragging to open system
    - [ ] Add sleep option
    Remove spinning character

- #### COLOR/THEMES:
    - [ ] Revam the theme system. Don't use theme presets. Have folders with "theme" files. They have color names with the hex to the right.
        - [ ] Themes can be applied maybe in the display status icon? Add wallpaper switcher there too?

- #### OSD:
    - [ ] Remove. The audio and display settings will be added to the status icons on the status bar

- #### DASHBOARD:
    - [ ] Remove. All features are added elsewhere
        - [ ] Dashboard: Everything displayed already has a place somewhere else except for weather. Maybe add that to status bar if you think necessary.
        - [ ] Media: Media gets it's own status icon on the status bar
        - [ ] Performance: Performance gets its own status icon on the status bar

- #### LOCK SCREEN:
    - [ ] Remove everything but clock, and password entry
    - [ ] Password characters entered should appear on all screens.
    - [ ] Overall revamp lock screen to make it look nice.

- #### LAUNCHER:
    - [ ] Remove. Everything can be done with rofi + everything else that will be added.
    - [ ] Launcher looks really cool. Maybe I can come up with a different use case for a tab that can be dragged up from the bottom.

- #### CAELESTIA:
    - [ ] Figure out why my quickshell only works when in the caelestia folder. Somehow remove caelestia dotfiles and make my hypr dots and quickshell dots work independantly
    - [ ] Once everything is done, Share on github, reddit and discord! You're set and awesome.