# Install zurg-cli

- Clone the repo into your `$HOME/` directory on Mac.
- Set the directory (`cd`) to be in your install of `zurg-cli`.
- Execute `$ sh install.sh` to install Zurg. 
  - It's recommended to say yes (`y`) to any prompts from the install.
  - Password will be prompted for sudo commands (Fonts and default shell update).
- Configure a Nerd Font for your terminal (Refer to the **Fonts** section below).
- Quit your terminal and restart the session.

# Fonts
[Starship](https://starship.rs/) requires a [Nerd Font](https://www.nerdfonts.com/) to be installed and configured with your terminal to show the git status icons. If you are seeing a `[?]` in your shell, that means you have yet to configure your terminal font to use a Nerd Font.

The Zurg installation comes with the Meslo Nerd Font installed via brew. There are a lot of [Nerd Fonts](https://www.nerdfonts.com/) and any can be [installed via brew](https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e).

## Configure Font in Terminal App
- In Terminal, press `CMD` and `,` at the same time to open up preferences.
- Navigate to Profiles.
- In Profiles, click the Text -> Font -> `Change` button.
- Select a Nerd Font. `MesloLGMDZ Nerd Font Mono` is a great starter font as it's the closest to the default font that comes with Mac OS.

## Configure Font for iTerm2
Although there are many great terminal alternatives to use, [iTerm2](https://iterm2.com/) is a fantastic option for getting started
- In Terminal, press `CMD` and `,` at the same time to open up preferences.
- Navigate to Profiles.
- Select the profile that has a star (meaning it's the default). It is most likely named `Default`.
- In the selected profile, navigate to Text. Then under Font use the dropdown to select a Nerd Font. `MesloLGMDZ Nerd Font Mono` is a great starter font as it's the closest to the default font that comes with Mac OS. 
# Uninstall

- Zurg can be uninstalled by running `$ sh uninstall.sh` in the `zurg-cli` directory.
- Quit your terminal and reset the session.
