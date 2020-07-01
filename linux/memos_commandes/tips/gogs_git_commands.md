# Gogs and git commands

[Gogs](https://gogs.io/) is an open source painless selft hosted git server.

### Git commands

* Create a new repository on the command line
```
touch README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin http://domain.name/user/repo_name.git
git push -u origin master
```

* Push an existing repository from the command line
```
git remote add origin http://git.antonin.io/antonin/config_files.git
git push -u origin master
```
