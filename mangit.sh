##Uso Git init
git init
git init <directory>
git init --bare <directory>
##ejemplo de creacion de repositorio central con git init
ssh <user>@<host>
cd path/above/repo 
git init --bare my-project.git
##git clone
git clone <repo>
git clone <repo> <directory>
##ejemplo de como obtener una copia local de un repositorio central
git clone ssh://john@example.com/path/to/my-project.git 
cd my-project
# Start working on the project
##git config
git config user.name <name>
git config --global user.name <name>
git config --global user.email <email>
git config --global alias.<alias-name> <git-command>
git config --system core.editor <editor>
git config --global --edit
##Archvivo de configuracion de git config
[user] 
name = John Smith
email = john@example.com
[alias]
st = status
co = checkout
br = branch
up = rebase
ci = commit
[core]
editor = vim
##Ejemplo de configuracion con git config
# Dile a Git quien eres
git config --global user.name "John Smith"
git config --global user.email john@example.com
# Selecciona tu editor favorito de texto
git config --global core.editor vim
# agrega algunos alias SVN
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.up rebase
git config --global alias.ci commit

##Salvando cambios con git add
git add <file>
git add <directory>
git add -p
##ejemplos con git add
git add .
git commit
git add hello.py
git commit
##git commit
git commit
git commit -m "<message>"
git commit -a
##ejemplos con git commit
git add hello.py
git commit
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Changes to be committed:
# (use "git reset HEAD <file>..." to unstage)
#
#modified: hello.py

Change the message displayed by hello.py

- Update the sayHello() function to output the user's name
- Change the sayGoodbye() function to a friendlier message

##inspeccionar repositorio con git status
git status
##ejemplo de salida de git status
# On branch master
# Changes to be committed:
# (use "git reset HEAD <file>..." to unstage)
#
#modified: hello.py
#
# Changes not staged for commit:
# (use "git add <file>..." to update what will be committed)
# (use "git checkout -- <file>..." to discard changes in working directory)
#
#modified: main.py
#
# Untracked files:
# (use "git add <file>..." to include in what will be committed)
#
#hello.pyc
##ignornado archivos
*.pyc
##ejemplo de git status
# Edit hello.py
git status
# hello.py is listed under "Changes not staged for commit"
git add hello.py
git status
# hello.py is listed under "Changes to be committed"
git commit
git status
# nothing to commit (working directory clean)
##git log
git log
git log -n <limit>
git log --oneline
git log --stat
git log -p
git log --author="<pattern>"
git log --grep="<pattern>"
git log <since>..<until>
git log <file>
git log --graph --decorate --oneline
##ejemplo de salida de git log
commit 3157ee3718e180a9476bf2e5cab8e3f1e78a73b7
Author: John Smith
##ejemplos de uso de git log con otros parametros
git log --author="John Smith" -p hello.py
git log --oneline master..some-feature
##viendo commits antiguos con git checkout
git checkout master
git checkout <commit> <file>
git checkout <commit>
##ejemplo de una revision antigua
git log --oneline
b7119f2 Continue doing crazy things
872fa7e Try something crazy
a1e8fb5 Make some important changes to hello.py
435b61d Create hello.py
9773e52 Initial import
#otros usos
git checkout a1e8fb5
git checkout master
git checkout a1e8fb5 hello.py
git checkout HEAD hello.py
##deshacer cambios con git revert
git revert <commit>
##ejemplo de git revert
# Edit some tracked files

# Commit a snapshot
git commit -m "Make some changes that will be undone"

# Revert the commit we just created
git revert HEAD
##git reset
git reset <file>
git reset
git reset --hard
git reset <commit>
git reset --hard <commit>
##ejemplo de git reset
# Edit both hello.py and main.py

# Stage everything in the current directory
git add .

# Realize that the changes in hello.py and main.py
# should be committed in different snapshots

# Unstage main.py
git reset main.py

# Commit only hello.py
git commit -m "Make some changes to hello.py"

# Commit main.py in a separate snapshot
git add main.py
git commit -m "Edit main.py"
##removiendo commits locales
# Create a new file called `foo.py` and add some code to it

# Commit it to the project history
git add foo.py
git commit -m "Start developing a crazy feature"

# Edit `foo.py` again and change some other tracked files, too

# Commit another snapshot
git commit -a -m "Continue my crazy feature"

# Decide to scrap the feature and remove the associated commits
git reset --hard HEAD~2
##git clean
git clean -n
git clean -f
git clean -f <path>
git clean -df
git clean -xf
##ejemplo de git clean
# Edit some existing files
# Add some new files
# Realize you have no idea what you're doing

# Undo changes in tracked files
git reset --hard

# Remove untracked files
git clean -df

##rescribiendo el historial
git commit --amend
##ejemplo 
# Edit hello.py and main.py
git add hello.py
git commit

# Realize you forgot to add the changes from main.py
git add main.py
git commit --amend --no-edit

##git rebase
git rebase <base>
##ejemplos de git rebase
# Start a new feature
git checkout -b new-feature master
# Edit files
git commit -a -m "Start developing a feature"

# Create a hotfix branch based off of master
git checkout -b hotfix master
# Edit files
git commit -a -m "Fix security hole"
# Merge back into master
git checkout master
git merge hotfix
git branch -d hotfix

git checkout new-feature
git rebase master

git checkout master
git merge new-feature
##git rebase -i
git rebase -i <base>
##ejemplos de git rebase-i
# Start a new feature
git checkout -b new-feature master
# Edit files
git commit -a -m "Start developing a feature"
# Edit more files
git commit -a -m "Fix something from the previous commit"

# Add a commit directly to master
git checkout master
# Edit files
git commit -a -m "Fix security hole"

# Begin an interactive rebasing session
git checkout new-feature
git rebase -i master

pick 32618c4 Start developing a feature
pick 62eed47 Fix something from the previous commit

pick 32618c4 Start developing a feature
squash 62eed47 Fix something from the previous commit

git checkout master
git merge new-feature

##git reflog
git reflog
git reflog --relative-date
##ejemplos de git reflog
0a2e358 HEAD@{0}: reset: moving to HEAD~2
0254ea7 HEAD@{1}: checkout: moving from 2.2 to master
c10f740 HEAD@{2}: checkout: moving from master to 2.2

git reset --hard 0254ea7
