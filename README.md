# What's here?

Simple repository to create and delete pull requests from. 
Used for testing of github-branch-source plugin, among 
probably other things.

## Prerequisites

1. An up to date Linux system on which to do this. Might work on a Mac - I haven't tried.

2. You need [`hub`](https://github.com/github/hub) installed and on your path. More on that below.

## Installing Hub

I've found that the binaries provided by package managers (like apt-get, dnf, etc) aren't feature complete.
In particular the `-p` switch was often missing or broken. So I decided to follow, exactly, the 
steps provided by GitHub themselves, here, and unsurprisingly, that worked:

```
mkdir -p "$GOPATH"/src/github.com/github
git clone \
  --config transfer.fsckobjects=false \
  --config receive.fsckobjects=false \
  --config fetch.fsckobjects=false \
  https://github.com/github/hub.git "$GOPATH"/src/github.com/github/hub
cd "$GOPATH"/src/github.com/github/hub
make install prefix=/usr/local
```

It'll probably bark at you for not having write access to `/usr/local` but somehow worked anyway.

```
kshultz@gigantic-laptop:~/GitHub$ hub version
git version 2.19.1
hub version 2.9.0-7-g2b67d8c3
```

## Using Hub with Github Enterprise

If you want to push this repo onto a GitHub Enterprise server of your own, you'll need to whitelist 
that server so that hub will talk to it:

```
git config --add hub.host your.github-enterprise-server.org
```

