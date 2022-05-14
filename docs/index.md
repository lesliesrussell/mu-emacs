
# Table of Contents

-   [Reasoning](#org03a3fc4)
    -   [Some of the packages used](#org01e464c)
-   [Installation](#org45ca058)
-   [Configuration](#orgf9248ef)
    -   [Use emacs built ins as much as I can stand](#orgf0afc8a)
    -   [Bootstrap straight.el](#org6cc48ea)
    -   [Install use-package](#org148ae2d)
    -   [Modules list configuration](#orgd6e3a62)
        -   [My setup](#org61f0dbb)
        -   [Future](#org89363b2)
-   [Test results](#orge1db239)

![img](../screenshot.png)


<a id="org03a3fc4"></a>

# Reasoning

I wanted something that worked a little like Doom Emacs or Spacemacs, but that I understood (mostly) and could make my own. I wanted it to be fast, even-though I run emacs as a daemon. There might be times I purposely or accidentally start an instance outside daemon and it should not be slow.

I wanted my config to be pretty because why not?


<a id="org01e464c"></a>

## Some of the packages used

-   SidharthArya's [modular-config.el](https://github.com/SidharthArya/modular-config.el/tree/2bd77193fa3a7ec0541db284b4034821a8f59fea) as the core so that it functions somewhat like Spacemacs.
-   use-package
-   straight
-   fontaine
-   deft
-   consult/embark/vertico/marginalia/orderless


<a id="org45ca058"></a>

# Installation

You will want to save your current configs someplace safe. Then just clone this repo to your preferred *user-emacs-directory* like so:

    git clone https://github.com/lesliesrussell/mu-emacs ~/.your-prefered-user-emacs-directory

I have a file called *README.org* because github uses that as a default. But I'd probably rename it to init.org on your side. It won't change how the file tangles, that is handled by the header arguments. One quick thing, if you have trouble tangling any of these files after making changes, just put the point on the header argument line and press **C-c C-c** that will force org-mode to reload those arguments and might save you some headaches.

I add aliases to zsh to make working on the command line more comfortable, now might be a good time to do this but that is up to you.

Now, once you have the repo cloned and you are ready to jump in, just start emacs the way you normally would. It takes straight a little while to clone all the repos, and then a little while for emacs to run through and configure everything, but after that your editor should start in <del>0.4 seconds</del> I have that time down to 0.2 seconds (I did several tests and included the output of one run to show you I ain't fabricatin'). What that means for me is that I can use emacs without starting a daemon. Because sometimes I want to do that. Mostly I use emacsclient. And you should be able to run this config either way with very little frustration.


<a id="orgf9248ef"></a>

# Configuration

Directly lifted from the example on the *modular-config* github repo. It works.


<a id="orgf0afc8a"></a>

## Use emacs built ins as much as I can stand

Lots of emacs built ins are great. But if there wasn't a good built in, I inserted a respected solid one in its place. I tried *viper* and found that contrary to opinions, it was pretty good. Ultimately it wasn't for me so I tried *evil*. It was then that I realized that I just don't like vim movement very much. So I left *viper* and *evil*. You can do whatever you want  but respectfully, it is good to learn the emacs way because most help you will find speaks emacs not evil.


<a id="org6cc48ea"></a>

## Bootstrap straight.el

This is lifted from the package authors repo. It works and I didn't need to change it.

    ;; -*- lexical-binding: t; -*-
    (defvar bootstrap-version)
    (let ((bootstrap-file
           (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
          (bootstrap-version 5))
      (unless (file-exists-p bootstrap-file)
        (with-current-buffer
    	(url-retrieve-synchronously
    	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
    	 'silent 'inhibit-cookies)
          (goto-char (point-max))
          (eval-print-last-sexp)))
      (load bootstrap-file nil 'nomessage))


<a id="org148ae2d"></a>

## Install use-package

    (straight-use-package 'use-package)


<a id="orgd6e3a62"></a>

## Modules list configuration

So this started out as nothing but an attempt to simplify my, out of control, config. But I quickly realized how powerful this little package is. Combined with use-package, general, and straight; my little config is now reproducible and can be used by anyone. Not that you should, but I have stolen the best bits from a couple of my favorite configs (Spacemacs, Sanemacs, Doom Emacs) and borrowed heavily from some very intelligent Emacsen to arrive at a very fast, usable and easily expandable config.

It works for me.


<a id="org61f0dbb"></a>

### My setup

<del>As of right now I have four module groups; *base*, *stable*, *private*, and *testing* with *private* set as the *modular-config-default*. I couldn't come up with a good reason to have different bookmarks for each config so I am not using *modular-config-use-seperate-bookmarks* at this time.</del>

With *testing* as the default config, if I start emacs with no *&#x2013;config* argument I get the *testing* version of my config with all the bells and bobs that I know work.

I use vifm, and for that and the command line I alias emacs to start with the *base* config.

    alias e='emacs -nw --config base'

<del>Probably one day I won't do that but there was a good reason and I can't remember why.</del> I remembered why, and stopped.

If I need to I can pass the *none* parameter to *&#x2013;config* and have just plain old emacs which can be handy.

    (use-package modular-config
      :straight t
      :custom
      (modular-config-list '((none ())
    			 ;; the most minimal config I can stand
    			 (base (base/core
    				base/daemon
    				base/appearance
    				;; base/mode-line
    				base/undo
    				base/keybindings
    				base/searching
    				base/git
    				base/completion
    				base/which))
    			 ;; my stable module group for daily use
    			 (stable ((base)
    				  stable/mu-org
    				  stable/writing
    				  stable/org-roam
    				  stable/deft-extras
    				  ))
    			 ;; just private configs that might not want in repo
    			 (private ((stable)
    				   ;; private/keybinds
    				   ))
    			 ;; if I add a new module I can test drive it
    			 (testing ((private)
    				   testing/org-test
    				   testing/proced-extras
    				   testing/lambda-line-config
    				   testing/esup
    				   testing/proced-extras
    				   ;; testing/programming-go
    				   ;; testing/shr-eww
    				   ;; testing/evil
    				   testing/popper-config
    				   testing/fontaine-config
    				   ))
    			 ))
      ;; I default to private but so far it has been both
      ;; comfortable and safe to change this to any of the other
      ;; module groups.
      (modular-config-default 'testing)

      ;; the developer of this package uses /lisp as his path
      ;; but I wanted something that makes more sense for me
      ;; since I use /lisp for something else
      ;; This probably ought to be a concat with emacs user directory
      (modular-config-path (concat user-emacs-directory "modules"))

      ;; I don't use this but I included it because other people might want
      ;; to use it and I might find a need for it later.
      ;; (modular-config-use-separate-bookmarks t)
      :config
      (modular-config-command-line-args-process))


<a id="org89363b2"></a>

### DONE Future

A lot of this stuff needs to be refactored and cleaned up. I intend to test this config either in a VM or a fresh install on a lappy.

-   DONE Correct references to .emacs.d

    Since this i my personal config I just kinda knocked it together, so lots of bad ideas got through. This one need fixing

-   DONE Fix the core modules

    Really need to follow some naming conventions. Core modules should probably be prefixed with *core-* or something similar.

-   DONE evil

    -   Note taken on <span class="timestamp-wrapper"><span class="timestamp">[2022-05-09 Mon 16:09] </span></span>
        Yeah&#x2026;I am not a fan of evil. I tried it I really did. Just not working for me.
    -   But it is there if you need it

    I may not use evil, but I'd like to get it working as a module so that can test it at least.

-   DONE Mode line

    -   Note taken on <span class="timestamp-wrapper"><span class="timestamp">[2022-05-14 Sat 02:52] </span></span>
        Changed from mood-line to lambda-line. It has a few weird intermittent bugs but otherwise works pretty well.

    Something is off about the current mode line.

-   DONE Fix module list

    -   Note taken on <span class="timestamp-wrapper"><span class="timestamp">[2022-05-06 Fri 13:59] </span></span>
        I am now pretty happy with how the module list looks and works.

    The module list needs work. I am not happy with the way it looks.

-   DONE convert to org mode in module

    so I can have documentation and etc

-   TODO base-core

    I want to clean up base-core and move key bindings into a module


<a id="orge1db239"></a>

# Test results

After getting to a point where I feel comfortable with using this config daily I decided to test the start up time.
I am happy with the results:

    Total User Startup Time: 0.274sec     Total Number of GC Pauses: 4     Total GC Time: 0.023sec

    bootstrap.el:82  0.194sec   70%

    lambda-line-config.el:37  0.021sec   7%

    bootstrap.el:80  0.018sec   6%

    fontaine-config.el:40  0.013sec   4%

    core.el:155  0.012sec   4%

    vc-git.elc:397  0.009sec   3%

    bootstrap.el:8  0.004sec   1%

I haven't done anything special. All the code came from reading other users config. Directly stealing from Spacemacs, Doom Emacs, and Sanemacs.
The code could be cleaned up and made even faster I'll bet but it works for me.
<del>Eventually I will get an evil module, as part of the base and tinker with that.</del> But aside from a few bugs I haven't found a good solution for yet anybody could use this as a great starting point.

Not that anyone should. There are much better available.
