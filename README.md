Dotfiles Template
=================

This is a template repository for bootstrapping your dotfiles with [Dotbot][dotbot].

To get started, you can [fork][fork] this repository (and probably delete this
README and rename your version to something like just `dotfiles`).

In general, you should be using symbolic links for everything, and using git
submodules whenever possible.

To keep submodules at their proper versions, you could include something like
`git submodule update --init --recursive` in your `install.conf.yaml`.

To upgrade your submodules to their latest versions, you could periodically run
`git submodule update --init --remote`.

Inspiration
-----------

If you're looking for inspiration for how to structure your dotfiles or what
kinds of things you can include, you could take a look at some repos using
Dotbot.

* [anishathalye's dotfiles][anishathalye_dotfiles]
* [csivanich's dotfiles][csivanich_dotfiles]
* [m45t3r's dotfiles][m45t3r_dotfiles]
* [alexwh's dotfiles][alexwh_dotfiles]
* [azd325's dotfiles][azd325_dotfiles]
* [bluekeys' dotfiles][bluekeys_dotfiles]
* [wazery's dotfiles][wazery_dotfiles]
* [thirtythreeforty's dotfiles][thirtythreeforty_dotfiles]

And there are about [700 more here][dotbot-users].

If you're using Dotbot and you'd like to include a link to your dotfiles here
as an inspiration to others, please submit a pull request.

Riza's Specific Environment
---------------------------

Some manual steps that need to be done manually before or after `./install`

* On Mac, install [coreutils][brew-coreutils].
* On iTerm2, go to Preference > Profile, and then set the following:
  * On Colors, Import [gruvbox][gruvbox-iterm2] color scheme.
  * On Text, Install [powerline font][powerline-font], and set Meslo LG M for
    Powerline 14pt.
  * On Keys:
    * Set Left Option key to Esc+.
    * Setup [mac keyboard shortcut][zsh-iterm-shortcut] for zsh.


License
-------

This software is hereby released into the public domain. That means you can do
whatever you want with it without restriction. See `LICENSE.md` for details.

That being said, I would appreciate it if you could maintain a link back to
Dotbot (or this repository) to help other people discover Dotbot.

[dotbot]: https://github.com/anishathalye/dotbot
[fork]: https://github.com/anishathalye/dotfiles_template/fork
[anishathalye_dotfiles]: https://github.com/anishathalye/dotfiles
[csivanich_dotfiles]: https://github.com/csivanich/dotfiles
[m45t3r_dotfiles]: https://github.com/m45t3r/dotfiles
[alexwh_dotfiles]: https://github.com/alexwh/dotfiles
[azd325_dotfiles]: https://github.com/Azd325/dotfiles
[bluekeys_dotfiles]: https://github.com/bluekeys/.dotfiles
[wazery_dotfiles]: https://github.com/wazery/dotfiles
[thirtythreeforty_dotfiles]: https://github.com/thirtythreeforty/dotfiles
[dotbot-users]: https://github.com/anishathalye/dotbot/wiki/Users
[gruvbox-iterm2]: https://github.com/morhetz/gruvbox-contrib/tree/master/iterm2
[zsh-highlight]: https://github.com/zsh-users/zsh-syntax-highlighting
[brew-coreutils]: https://formulae.brew.sh/formula/coreutils
[powerline-font]: https://github.com/powerline/fonts
[zsh-iterm-shortcut]: https://coderwall.com/p/a8uxma/zsh-iterm2-osx-shortcuts
