How to use SFML in replit using NixOS  - Updted June-2023
- if you have any questions or need help send me a message on replit




To install SFML and build code with the libraries, there are two methods. One is - is to install the packages.
The second - you can use a script to call a new "nix shell" with the needed packages loaded.


Using the nix-shell approach is favorable if you aren't sure about the packages you want to install or will need, and want to try several things out without having to "undo" any of it

Both of these approaches will get the header libraries/includes set up without having to do any extra work


#############################################
Install a package permanently:
#############################################
1) run the install command from your nix shell
# install the nix packages
nix-env -iA nixpkgs.sfml nixpkgs.csfml

2) check in the nix shell to be sure the packages are there
# nix-env -q --installed
csfml-2.5.1
nix-2.3.16
sfml-2.5.1

3) run your G++ command

Extra troubleshooting:
how to find where packages are:
# nix-build --no-out-link -E '(with import <nixpkgs> {}; lib.getDev sfml)'
-- this will show a path. if something is supposed to be installed but G++ cant find it, check with this 


#############################################
package(s) with nix shell temporarily
#############################################
To use temporary nix shell packages with repl , it is easiest to start with a "bash shell" template. OR, modify your current repl to start into a bash shell with this line (check script.sh and .replit file in this repl)

1) repl needs to start a bash script, we use the bash script to avoid repeating typing in the same package names each time
# run = "chmod +x * ; bash script.sh"
-- this is the 1st line of my .replit file, so despite this being a "C++" repl, the first thing it does is run a bash script

2) make a script.sh and put this in it:
2a) Compile command
echo 'script starting'
nix-shell -p sfml csfml --run 'bash -c "g++ main.cpp -o main -lsfml-graphics -lsfml-window -lsfml-system"'
-- what is happening here? We are telling nix-shell to start with the SFML and CSFML libraries , and with a --run flag, we are starting a second bash shell, with a command all ready to execute right away. Its the G++ compile command.

This lets us start a new nix shell, and then from inside that nix shell (where the SFML header files are visible), run the command to start the built SFML app. 
2b) start program inside nix shell
    #  bash -c "./main"


For a full example, check out the script.sh and .replit file of this repl 



