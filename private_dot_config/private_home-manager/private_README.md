# Setup

## Step 1

Install the nix package manager manually following the [instructions](https://nixos.org/download/#download-nix).
For WSL2, I have always used the single-user installation and have never bothered setting up systemd.

## Step 3

Run `nix run home-manager/master -- init --switch` when using home-manager for the first time.

## Step 4

To build a new generation run `home-manager switch`


## Upgrade packages

Run `nix flake update`

## Clean up the nix

Run nix-collect-garbage -d
