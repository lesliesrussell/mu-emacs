
# Table of Contents

-   [Reasoning](#org08194ca)
    -   [Some of the packages used](#org1cc5df1)
-   [Installation](#org46c68e0)
-   [Alternate configs](#org2de87b0)
-   [Configuration](#org206467b)
    -   [Use emacs built ins as much as I can stand](#org75771ed)
    -   [Modules list configuration](#org85a9cb5)
        -   [My setup](#org6ca5988)
        -   [Creating new modules](#org0b0a1a5)
        -   [Future](#org71a43f6)
-   [Test results](#org3bfba2b)

![img](./docs/mu-emacs-logo.png)


<a id="org08194ca"></a>

# Reasoning

I wanted something that worked a little like Doom Emacs or Spacemacs, but that I understood (mostly) and could make my own. I wanted it to be fast, even-though I run emacs as a daemon. There might be times I purposely or accidentally start an instance outside daemon and it should not be slow.

I wanted my config to be pretty because why not?


<a id="org1cc5df1"></a>

## Some of the packages used

-   SidharthArya's [modular-config.el](https://github.com/SidharthArya/modular-config.el/tree/2bd77193fa3a7ec0541db284b4034821a8f59fea) as the core so that it functions somewhat like Spacemacs.
-   [use-package](https://github.com/jwiegley/use-package/tree/a7422fb8ab1baee19adb2717b5b47b9c3812a84c)
-   [straight](https://github.com/radian-software/straight.el)
-   [fontaine](https://git.sr.ht/~protesilaos/fontaine)
-   [deft](https://jblevins.org/projects/deft/)
-   [consult](https://github.com/minad/consult)/[embark](https://github.com/oantolin/embark)/[vertico](https://github.com/minad/vertico)/[marginalia](https://github.com/minad/marginalia/tree/26f2bd9ee7b63bcad6604108e2f565b34bc6083b)/[orderless](https://github.com/oantolin/orderless?hmsr=joyk.com)


<a id="org46c68e0"></a>

# Installation

You will want to save your current configs someplace safe. Then just clone this repo to your preferred *user-emacs-directory* like so:

    git clone https://github.com/lesliesrussell/mu-emacs ~/.your-prefered-user-emacs-directory

One quick thing, if you have trouble tangling any of these files after making changes, just put the point on the header argument line and press **C-c C-c** that will force org-mode to reload those arguments and might save you some headaches.

I add aliases to zsh to make working on the command line more comfortable, now might be a good time to do this but that is up to you.

Now, once you have the repo cloned and you are ready to jump in, just start emacs the way you normally would. It takes straight a little while to clone all the repos, and then a little while for emacs to run through and configure everything, but after that your editor should start in <del>0.4 seconds</del> I have that time down to 0.2 seconds (I did several tests and included the output of one run to show you I ain't fabricatin'). What that means for me is that I can use emacs without starting a daemon. Because sometimes I want to do that. Mostly I use emacsclient. And you should be able to run this config either way with very little frustration.


<a id="org2de87b0"></a>

# Alternate configs

You'll want to check [modular-config](https://github.com/SidharthArya/modular-config.el/tree/2bd77193fa3a7ec0541db284b4034821a8f59fea) documentation as the author does a much better job of explaining the workings than I can, but for this repo: what you'll find in [init](init.md) is a variable *modular-config-list* that holds a list of lists<sup><a id="fnr.1" class="footref" href="#fn.1" role="doc-backlink">1</a></sup>. Those sub-lists contain the definition of the modules, which consist of a *name* and a list of file names under *modular-config-path* associated with that module. Each module can require or depend on another module.

For this config, I have set up a folder structure under *modular-config-path*:

    ~/.config/emacs/modules/
    ├── base
    │   ├── ...
    ├── private
    │   └── ...
    ├── stable
    │   ├── ...
    └── testing
        └── ...

And these directories are where my config files live.
If you are running the mμ-emacs config, pressing **<SHIFT>-<F8>** will dired-jump you to the *modular-config-path* directory. Or You can press **M-s f** to search by name, while **M-s F** allows you to grep files in your current directory recursively. In most cases you will be in *user-emacs-directory* when you start emacs, but you can cd or open a dired to the *user-emacs-directory* and then grep<sup><a id="fnr.2" class="footref" href="#fn.2" role="doc-backlink">2</a></sup>.

For this config, the modules are chained such the next module in the list requires the previous module. That way the *testing* module (where I place new things I am playing with, and which the default module) inherits all the previous modules. If you don't like this, it is easy to change.


<a id="org206467b"></a>

# Configuration

Directly lifted from the example on the *modular-config* github repo. It works.


<a id="org75771ed"></a>

## Use emacs built ins as much as I can stand

Lots of emacs built ins are great. But if there wasn't a good built in, I inserted a respected solid one in its place. I tried *viper* and found that contrary to opinions, it was pretty good. Ultimately it wasn't for me so I tried *evil*. It was then that I realized that I just don't like vim movement very much. So I left *viper* and *evil*. You can do whatever you want  but respectfully, it is good to learn the emacs way because most help you will find speaks emacs not evil.


<a id="org85a9cb5"></a>

## Modules list configuration

So this started out as nothing but an attempt to simplify my, out of control, config. But I quickly realized how powerful this little package is. Combined with use-package, general, and straight; my little config is now reproducible and can be used by anyone. Not that you should, but I have stolen the best bits from a couple of my favorite configs (Spacemacs, Sanemacs, Doom Emacs) and borrowed heavily from some very intelligent Emacsen to arrive at a very fast, usable and easily expandable config.

It works for me.


<a id="org6ca5988"></a>

### My setup

<del>As of right now I have four module groups; *base*, *stable*, *private*, and *testing* with *private* set as the *modular-config-default*. I couldn't come up with a good reason to have different bookmarks for each config so I am not using *modular-config-use-seperate-bookmarks* at this time.</del>

With *testing* as the default config, if I start emacs with no *&#x2013;config* argument I get the *testing* version of my config with all the bells and bobs that I know work.

I use vifm, and for that and the command line I alias emacs to start with the *base* config.

    alias e='emacs -nw --config base'

<del>Probably one day I won't do that but there was a good reason and I can't remember why.</del> I remembered why, and stopped.

If I need to I can pass the *none* parameter to *&#x2013;config* and have just plain old emacs which can be handy.


<a id="org0b0a1a5"></a>

### Creating new modules

I wanted to make it simple because I feel like it is something that will be done a lot so if you *M-x* **mu-new-module-buffer** mμ-emacs will ask a couple of questions, create a new buffer, and save it in the place you want it.


<a id="org71a43f6"></a>

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


<a id="org3bfba2b"></a>

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

All the code came from reading other users config. Directly stealing from Spacemacs, Doom Emacs, and Sanemacs.
I have tried to attribute everyone from whom I have stolen, but I am afraid I have missed many. So I'll include some links where I probably took things and just don't remember what:

-   [Xha Lee](http://xahlee.org/)
-   [Sasha Chua](https://sachachua.com/blog/)
-   [Howard Abrams](http://www.howardism.org/)
-   [Stack Exchange](https://stackexchange.com/)
-   [Irreal](https://irreal.org/blog/?tag=emacs)
-   and many more that I still can't remember

The code could be cleaned up and made even faster I'll bet but it works for me.
<del>Eventually I will get an evil module, as part of the base and tinker with that.</del> But aside from a few bugs I haven't found a good solution for yet anybody could use this as a great starting point.

Not that anyone should. There are much better available.


# Footnotes

<sup><a id="fn.1" href="#fnr.1">1</a></sup> [Cons Cell and List Types](https://www.gnu.org/software/emacs/manual/html_node/elisp/Cons-Cell-Type.html) explains.

<sup><a id="fn.2" href="#fnr.2">2</a></sup> A handy little thing I found when stumbling around directories is to press *C-u* then *C-x d* and open a dired buffer in the *user-emacs-directory*. Once there all the sub-directories will have been inserted for you (as if you pressed *i* on each sub-directory). You can then press *%g* and grep all the files and emacs will mark the files containing matches to your pattern.
