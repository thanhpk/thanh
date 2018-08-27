# My home config

This includes:
* VIM config
* Emacs config
* bash config

```sh
k43e ~ d/thanhpk
$ cd workspace/src/git.subiz.net/executor/
k43e ~/workspace/src/git.subiz.net/executor [master]d/thanhpk
$ ls
executor.go       Gopkg.lock  util.go       worker.go
executor_test.go  Gopkg.toml  util_test.go
k43e ~/workspace/src/git.subiz.net/executor [master]d/thanhpk
$ go build
k43e ~/workspace/src/git.subiz.net/executor [master]d/thanhpk
$

```

# Set up
```sh
mkdir .dotfiles
cd .dotfiles
git init
git remote  add origin git@github.com:thanhpk/thanh.git
git fetch
git --work-tree=$HOME reset --hard origin/master
exit
```

# Commit new changes
```sh
dgit status
dgit add .
dgit commit "some changes"
dgit push origin master
```
