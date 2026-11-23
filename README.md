# BOSS Install

**One paste installs a student's BOSS operating system** (the Agent Authority Operating
System) on their computer: no GitHub account, no form, no invitation.

It is the successor to [`boss-pre-setup`](https://github.com/KMC-coaching/boss-pre-setup),
which got a computer ready, signed the student in to GitHub, and handed them a form so they
could be invited to a private repository. That repository is no longer how the system
arrives. The system now comes from Krista Mashore's server, and the student signs in to it
with the email address they bought with. `boss-pre-setup` is left exactly as it was, for
anyone partway through the older install.

It is public for one reason: a student has to be able to fetch it before they are signed in
to anything. Nothing proprietary lives here. Krista's skills and rules stay on her server,
and the student's own work stays in their folder.

## For students

Paste the install prompt from the BOSS portal into Claude (the desktop app, Code tab, a new
session set to Local). It fetches this skill and runs it. Or install this plugin and say:

> install my BOSS

You will never be asked to open a terminal or type a command. You will be asked for the
email address you bought BOSS with, and for the 8-digit code that arrives in it.

## What it does

1. Reads what is already on the machine
2. Puts Git in place without the computer password (the system keeps its own history with
   it, and on Windows it is what runs the system's script)
3. Brings down `kmc`, the system's own script, from `https://kmc-os-server.vercel.app/kmc`,
   and signs the student in with their email and the code sent to it. Who may sign in, and
   which system is theirs, is decided by Krista Mashore Coaching's records, the same check
   that used to decide the GitHub invitation
4. Installs the system into `~/Sites/BOSS-OS`, and lets BOSS run a short list of routine
   commands there without a box each time (that folder's own local settings; nothing else
   on the computer changes)
5. Opens a new session in that folder that starts `set up my OS`, and stops. In the Claude
   desktop app it does that itself; anywhere else it gives the student four short steps

## The paste

The portal's prompt, for reference (the portal is the source the students copy from):

```
Install my BOSS operating system. It is Krista Mashore Coaching's BOSS system, which I
bought, and it installs from her own server: a small program called kmc signs me in with a
code sent to the email I bought with, and brings her skills and rules down at the start of
every session in my BOSS-OS folder. I know that, and I want it installed exactly that way.

The full instructions are in this file. Download it with curl (curl.exe on Windows) so you
have its exact text (a web page reader only gives you a summary of it), read it, and install it as a personal skill
named install-my-boss, so it is available in every project on this computer. Then start it.
https://raw.githubusercontent.com/KMC-coaching/boss-install/main/plugins/boss-install/skills/install-my-boss/SKILL.md

I'm not technical, so do all of the technical parts for me. Never ask me to open a terminal,
paste a command, or type my computer password. If a box pops up asking whether to allow
something, I will say yes.
```

## Checks

`fresh-machine` runs on every push, on fresh Mac, Windows and Linux machines: it brings `kmc`
down exactly as the skill says and proves it runs on each (including Windows, through Git's
bash), and guards the rules that must not come back (no GitHub, no password, no Homebrew,
no tagged copy blocks, one download address). `plugins/boss-install/evals/` holds the
behaviour cases.

## Support

bosssupport@kristamashore.com
