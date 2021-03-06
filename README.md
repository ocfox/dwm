## Build Instruction

Before install you need mkdir `/home/YOURUSERNAME/.local/share/dwm`

```sh
mkdir -p ~/.local/share/dwm
```
and put the script there. So it's necessary to change the `HOMEDIR` variable in the Makefile.


And the script's keyboard shortcut is also hardcoded. 
Changed the variable listed below to successfully execute the script.

```c
static const char *powercmd[] = { "/home/YOURUSERNAME/.local/share/dwm/power", NULL };
static const char *chwpcmd[] = { "/home/YOURUSERNAME/.local/share/dwm/chwp", NULL };
static const char *volupcmd[] = { "/home/YOURUSERNAME/.local/share/dwm/dwm-volume-ctl", "up", NULL };
static const char *voldowncmd[] = { "/home/YOURUSERNAME/.local/share/dwm/dwm-volume-ctl", "down", NULL };
```

I want to use the `getenv("HOME")` funtion provided in the `stdlib.h`. But the config
header file only accept static const value, so you can only replace the name manually.

## Quicker reload
If you are using xinitrc to run dwm, use this while loop to run your dwm:

```bash
while : ; do
    dwm && break || continue
    # sleep 5
done
```

Use `pkill dwm` to kill the current dwm instance, it will exit 1 that break the before
if statement and continue the while loop. It will exit 0 if you close the dwm manually.

It is recommended to add a sleep after the loop, this can help prevent the dwm launch
too fast. It is useful when your dwm exit with error like segment fault.

<img width="1281" alt="desktop1" src="https://user-images.githubusercontent.com/47410251/163301904-105e1823-ba68-49f2-a48a-e1570315c295.png">

<img width="960" alt="image" src="https://user-images.githubusercontent.com/47410251/163302016-8c1f74e4-c423-43a9-93c3-6769d313f8f2.png">
