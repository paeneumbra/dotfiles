# Ranger

To add devicon plugins

```shell
git submodule add git@github.com:cdump/ranger-devicons2.git
```

To remove before update

```shell
git submodule deinit -f base/.config/ranger/plugins/ranger-zoxide
git submodule deinit -f base/.config/ranger/plugins/ranger-devicons2
rm -rf .git/modules/base/.config/ranger/plugins/ranger-zoxide
rm -rf .git/modules/base/.config/ranger/plugins/ranger-devicons2
git rm base/.config/ranger/plugins/ranger-zoxide
git rm base/.config/ranger/plugins/ranger-devicons2
```
