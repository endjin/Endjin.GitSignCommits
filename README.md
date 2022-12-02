# Git Commit Signing 

This shell script makes it easier to set up Git commit signing on Windows

## Running the Script

Open Powershell and from the repository `Endjin.GitSignCommits` run the following command: 

```
./gitsigning.sh
```

If you are on Windows, the script needs to run within Git Bash. 

## Linking to GitHub

Now we need to link it to Github. To do this get the result of the armor command. Copy your GPG key, beginning with `-----BEGIN PGP PUBLIC KEY BLOCK-----` and ending with `-----END PGP PUBLIC KEY BLOCK-----`

Go to settings in Github and then SSH and GPG Keys and create a new GPG Key. Insert the GPG key, including the lines that show the beginning and the end of the key block.

Now we need to tell Git about the GPG signing key. Using your own GPG key ID instead of the example one, run the line below
```
$ git config --global user.signingkey 3AA5C34371567BD2
```

## How to sign a commit 

Now you should be able to stage and commit any change to GitHub, when you go to GitHub and you look at your commit you should see that it is now **verified**.

![Verified Image](README_images/Verified.png)

## Notes

The writing in  **green** will guide you through the process 