## mμ-emacs

# Reasoning
I wanted something that worked a little like Doom Emacs or Spacemacs, but that I understood (mostly) and could make my own. I wanted it to be fast, even-though I run emacs as a daemon. There might be times I purposely or accidentally start an instance outside daemon and it should not be slow.

I wanted my config to be pretty because why not?

## Some of the packages used
- SidharthArya's [[https://github.com/SidharthArya/modular-config.el/tree/2bd77193fa3a7ec0541db284b4034821a8f59fea][modular-config.el]] as the core so that it functions somewhat like Spacemacs.
- use-package
- straight
- fontaine
- deft
- consult/embark/vertico/marginalia/orderless

# Installation
You will want to save your current configs someplace safe. Then just clone this repo to your preferred /user-emacs-directory/ like so:
#+begin_example
  git clone https://github.com/lesliesrussell/mu-emacs ~/.your-prefered-user-emacs-directory
#+end_example
I have a file called /README.org/ because github uses that as a default. But I'd probably rename it to init.org on your side. It won't change how the file tangles, that is handled by the header arguments. One quick thing, if you have trouble tangling any of these files after making changes, just put the point on the header argument line and press *C-c C-c* that will force org-mode to reload those arguments and might save you some headaches.

I add aliases to zsh to make working on the command line more comfortable, now might be a good time to do this but that is up to you.

Now, once you have the repo cloned and you are ready to jump in, just start emacs the way you normally would. It takes straight a little while to clone all the repos, and then a little while for emacs to run through and configure everything, but after that your editor should start in +0.4 seconds+ I have that time down to 0.2 seconds (I did several tests and included the output of one run to show you I ain't fabricatin'). What that means for me is that I can use emacs without starting a daemon. Because sometimes I want to do that. Mostly I use emacsclient. And you should be able to run this config either way with very little frustration.

# Configuration
Directly lifted from the example on the /modular-config/ github repo. It works.
** Use emacs built ins as much as I can stand
Lots of emacs built ins are great. But if there wasn't a good built in, I inserted a respected solid one in its place. I tried /viper/ and found that contrary to opinions, it was pretty good. Ultimately it wasn't for me so I tried /evil/. It was then that I realized that I just don't like vim movement very much. So I left /viper/ and /evil/. You can do whatever you want  but respectfully, it is good to learn the emacs way because most help you will find speaks emacs not evil.

## Bootstrap straight.el
This is lifted from the package authors repo. It works and I didn't need to change it.

## Modules list configuration
So this started out as nothing but an attempt to simplify my, out of control, config. But I quickly realized how powerful this little package is. Combined with use-package, general, and straight; my little config is now reproducible and can be used by anyone. Not that you should, but I have stolen the best bits from a couple of my favorite configs (Spacemacs, Sanemacs, Doom Emacs) and borrowed heavily from some very intelligent Emacsen to arrive at a very fast, usable and easily expandable config.

It works for me.
