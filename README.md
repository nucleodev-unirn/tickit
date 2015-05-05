# tickit
projeto do núcleo de desenvolvimento da unirn, 2015

# README #

# Command line #
## I'm starting from scratch ##
### Set up your local directory ###

Set up Git on your machine if you haven't already.


```
#!bash

mkdir /path/to/your/project
cd /path/to/your/project
git init
git remote add origin https://<user>@github.com/marciodavimm/tickit.git


```

Create your first file, commit, and push

```
#!bash

echo "something" >> contributors.txt
git add contributors.txt
git commit -m 'Initial commit with something'
git push -u origin master
```

Great job, now you're all set up! Get started coding or create a team and invite people to work with you.
I have an existing project

## Already have a Git repository on your computer? Let's push it up to Bitbucket. ##


```
#!bash

cd /path/to/my/repo
git remote add origin https://<user>@bitbucket.org/marciodavimm/ndschamado.git
git push -u origin --all # pushes up the repo and its refs for the first time
git push -u origin --tags # pushes up any tags
```


This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

