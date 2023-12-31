## Hoon School: 06.2023 Cohort:

This repo serves to store all of my notes and work for the [Summer 2023 Hoon School Curriculum](https://developers.urbit.org/courses/hsl). File names and folders should be self-explanatory. A Glossary and Ecosystem.md was added, as Hoon has a number of frameworks and terms that are unfamiliar to most novice users (incluidng me).

This readme.md file will store environment set-up instructions, to get examples working, or aide a developer in setting up a project.


## Setting up an Urbit Machine:

As Urbit can be computationally intensive, a Dell Optiplex-7050 micro tower was selected. This was done to alleviate load off of my development laptop.

The Optiplex-7050 micro was selected due to its high maximum specs (16Gb Ram, i7-7th gen processor), low power consumption (65W - using a laptop power supply), and modest price point (relative to a Raspberry Pi 4th gen).

Basic Steps to setup the machine are as follows:

## Home Server Checklist:
1) Kubuntu 22.04 LTS was installed as the OS.
2) RustDesk (or an equivalent remote desktop software) was installed on the server machine, and development machine.
3) An urbit directory (urRoot) was created in the root of the /home folder.
4) The latest urbit binary was downloaded and installed in the urbit root folder.
5) Following the instructions [here](https://urbit.org/getting-started/cloud-hosting), my pier folder was tarred and transfered to the
server machine. It was then un-tarred and left in the root folder.
6) Again following the instructions [here](https://urbit.org/getting-started/cloud-hosting) my ship folder was docked with the urbit binary, using:

```
./urbit dock <pier folder name>

```

This creates a .run file in the folder, so urbit can be run directly. Keep the urbit binary around for testing later.

7) My urbit ship was run with the following settings:

```
./<name of ship folder>/.run --loom 32 --http-port <port number>

```

Note: Setting --loom to 32 increases urbits memory from 2Gb to 4Gb.

8) Next, we need to setup the machine to auto-run urbit on restart. I used KDE's script runner for this. In System Settings>Startup and Shutdown>Autostart, configure a login script with the following commands:

```
!#/bin/bash 
konsole -e "/<absolute path to ship folder>/<name of ship folder>/.run --loom 32 --http-port <port number>" &

```

put this in a file (say - urbitStart.sh) stored in the urbit root folder, and point KDE's autorunner to this file. Ensure that executable permissions (chmod u+x) have been set, so the file can be run when the user logs in from the SDDM login screen.

9) Restart the machine, and test that your remote desktop and urbit autostart.

10) Finally, router settings were configured for the server machine:
    - DHCP was frozen/disabled, fixing the internal LAN address for the urbit server machine.
    - Port Forwarding was set-up, so external connections can map to the urbit http-front end on the server machine.
    - It also helps to have a static external IP address (talk to your ISP to get this).

11) Test that your can access your ship from the external internet, with `http://<your ext ip address>:<your chosen port number>`
12) Done!


## Setting up Development Environment.

VS Studio Code for linux is used, with the Hoon and Hoon Assist exensions used. [Fake Ships]() are used to test code snippits.

To set-up a fake ship, run the following command in the directory where the urbit binary resides:

```
./urbit -F zod
```

Running your fakeship:

```
./urbit /path/tofakeship/...

```

Remember to make a copy of oyur fakeship with the copy (cp) command!


## Coding Hoon Scripts, running them in Dojo:

When developing Gall Apps, we need to have our own desks in our ship (on Mars). We write and develop on Earth (our local file system), and cart files over to Mars (on a desk in our ship).

- Mount a desk:  `|mount  %deskname`
- Unmount a desk: `|unmount %deskname`

- For development, I will use a desk called %galldesk or %alfa

### Commiting code and running it:

1) Mount the appropriate desk in the Dojo console. You can generate a new one with: `|merge  %newdesk our %base`
2) Update the desk.bill file in ./zod/alfa desk folder:

```
$ cd zod/alfa
$ echo "~[%alfa]" > desk.bill
```

3) Place your testcode in /zod/alfa/app folder with a .hoon extension.

4) Commit and boot:

```
> |commit %alfa

> |install our %alfa

```


