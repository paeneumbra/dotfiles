# Git Repos

To get all repo links under a single folder

```shell
$ grep -oh "url = .*" */.git/config | cut -d " " -f3 > repos_list.txt
```

To get all repo links under a monorepo

```shell
$ grep -oh "url = .*" .gitmodules | cut -d " " -f3 > repos_list.txt
```

To clone the full list

```shell
$ grep . repos_list.txt | while read line ; do git clone "$line"; done
```

or

```shell
$ cat *.txt | while read line ; do git clone "$line"; done
```
