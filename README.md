# BOSS Install

**One paste installs a student's BOSS operating system** (the Agent Authority Operating
System) on their computer, and opens their setup: no GitHub account, no form, no invitation,
no second paste.

[`install-prompt.txt`](install-prompt.txt) is the paste, word for word. It is the single
source: the BOSS portal shows this exact text in its Copy box, and the checks here guard it.
The student pastes it into Claude (the desktop app, Code tab, a new Local session). Claude
then:

1. makes `~/Sites/BOSS-OS` (or carries on in an earlier try of it);
2. brings down `kmc`, the system's one script, from `https://kmc-os-server.vercel.app/kmc`;
3. asks the student for the email address they bought with, and for the 8-digit code Krista's
   server emails to it, and signs them in. Who may sign in, and which system is theirs, is
   decided by Krista Mashore Coaching's records, the same check that used to decide the GitHub
   invitation;
4. installs the system into the folder;
5. opens a new session in the folder, **Set up my BOSS**, that starts `set up my OS`, and puts
   it on the student's screen. The system's rules only load in a session started inside its
   own folder, which is why it is a new session; the student does not have to start it.
   Where the app cannot open sessions, Claude tells the student the folder and the one thing
   to type there.

It replaces [`boss-pre-setup`](https://github.com/KMC-coaching/boss-pre-setup) (computer
setup, GitHub sign-in, then a form and an invitation to a private repository). That repo is
left exactly as it was, for anyone partway through the older install.

## Why the steps are in the paste, not in a file Claude downloads

Tested 2026-11-23 with real headless Claude Code runs, each in a throwaway home folder against
the live server. Asked to download a long instruction file from this repo and follow it,
Claude refused or stopped to warn the student in most runs, however the file was worded:
following instructions fetched from the internet reads to it as an attack. A short paste with
the steps written in it went straight through to asking for the email in most runs.

The paste stays short on purpose. What Claude has to tell the student along the way (whose
sign-in a computer already has, what to do when no code arrives, Apple's developer tools
window, a folder that already holds someone's things, and that setup runs in the new session)
is said by `kmc` itself, at the moment each applies, not written into the paste: Claude reads
`kmc`'s words only once it has started, so they cannot make it stop at the first message.

Sonnet, the first turn, 2026-11-23 (each run a throwaway home against the live server):

| Paste | Went straight on to ask for the email |
|---|---|
| the portal's earlier paste, which stops before opening the session | 27 of 30 |
| this paste, which also opens the session | 15 of 20 |
| this paste with two sentences of step 5 removed | 12 of 20 |

Every run that stopped named the same thing: the product's own design, in which Krista's
server sends Claude her current skills and rules at the start of every session. Some named the
vercel.app address as one it could not vouch for. Of five that stopped, two carried on when the
student said yes and three refused again, so a stop is not always one "yes" away. Opus went
straight through in every run (4 of 4).

## Checks

`fresh-machine` runs on every push and daily, on fresh Mac, Windows and Linux machines:

- it brings `kmc` down exactly as the paste says and proves it runs on each, including from
  PowerShell on Windows through Git's own bash;
- it guards the paste: the one download address, the BOSS-OS folder, the new session that
  starts `set up my OS`, no GitHub, no password, no Terminal.

## Support

bosssupport@kristamashore.com
