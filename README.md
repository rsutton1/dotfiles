# dotfiles

This repo stores my dotfiles. Managed by [ chezmoi ](https://www.chezmoi.io/).

# Setup

[ Install chezmoi ](https://www.chezmoi.io/install/) and then run these commands:

```
chezmoi init rsutton1 # configure chezmoi to use this repo
chezmoi diff # see chezmoi's changes before applying them
chezmoi apply # apply the changes
```

See the [ chezmoi user guide
](https://www.chezmoi.io/user-guide/command-overview/) for more info.

# Save changes

Here's how to save changes back into the repo.

```
chezmoi diff # you should see chezmoi wants to undo your changes
chezmoi add ~/.some_dotfile
chezmoi add salt/files/packages.sls
chezmoi diff # should be no changes
chezmoi cd
git add dot_some_dotfile salt/files/packages.sls
git commit -m "changed some dotfile, changed packages"
git push
```

# Troubleshooting

If the repo was cloned with HTTPS, run this before pushing to use SSH:

```
$ git remote set-url origin git@github.com:rsutton1/dotfiles.git
```
