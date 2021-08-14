# metoo-overlay

USE AT YOUR OWN RISK!

## Installation

This overlay can be installed using
[eselect-repository](https://wiki.gentoo.org/wiki/Eselect/Repository):

```console
# eselect repository add metoo git https://github.com/sideeffect42/metoo-overlay.git
# emerge --sync metoo
```

Alternatively, this overlay can also be installed using
[layman](https://wiki.gentoo.org/wiki/Layman):

```console
# layman -o https://github.com/sideeffect42/metoo-overlay/raw/master/repository.xml -f -a metoo
# layman-updater -R
```
