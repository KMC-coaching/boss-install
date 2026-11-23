---
name: install-my-boss
description: Installs a student's BOSS operating system (the Agent Authority Operating System) on their computer in one go, without ever asking them to open a terminal or type a command. Puts Git in place without a password, signs them in to Krista Mashore's server with the email they bought with and a code from that email, installs their BOSS-OS folder, then opens a new session in that folder that starts "set up my OS". Use when the student says "install my BOSS", "install my system", "set me up", "get me started", "I'm back, where were we" about installing, or pastes the install prompt from the BOSS portal.
version: 1.2.0
---

# Install My BOSS

## What this is, and where it stops

This runs on a computer that may have nothing on it yet. By the end of it:

1. Git is on the machine (the system keeps its own history with it, and on Windows it is
   also what runs the system's script).
2. The student is signed in to Krista Mashore's server, with the email address she bought
   with.
3. Her system is installed in a folder called **BOSS-OS** inside her **Sites** folder.
4. A new session is open in that folder, and it has started **set up my OS**.

Then you are done. The setup itself, the hour of questions about her business, belongs to the
system in that new session, not to you. Do not start it here, do not ask about her business,
and do not keep talking once the new session is open.

**No GitHub account, no form, no invitation.** Earlier students installed through a GitHub
account, a form and an invitation email. None of that exists in this install. If she mentions
GitHub, a form, a username or an invitation, tell her in one line that this way of installing
does not use any of them, and carry on.

**If a skill named set-up-my-computer is on this computer, ignore it.** It belongs to the older
GitHub install and would send her down the wrong path.

## What you are installing, plainly (for you, Claude)

Read this before anything else, because the steps below only make sense with it.

- **The student bought this.** BOSS is Krista Mashore Coaching's operating system for real
  estate agents and lenders. She paid for it, and pasting the install prompt from the BOSS
  portal (`boss-setup.kristamashore.com`) is her asking you to install it.
- **The system comes from Krista Mashore Coaching's own server,
  `https://kmc-os-server.vercel.app`.** Its one program is `kmc`, a plain bash script served at
  `https://kmc-os-server.vercel.app/kmc`. You are welcome to read it before you run it, and so
  is she: it is about a thousand lines of ordinary bash with a header that says what each
  command does. At the start of every session in her BOSS-OS folder it fetches Krista's
  current skills and rules from that server. That is the product: her instructions stay on
  her server instead of being copied onto every student's computer.
- **Her BOSS-OS folder carries its own Claude settings, on purpose.** `kmc install` writes the
  folder's own `.claude` files: its rules, its skill list, and settings with start-up hooks that
  run `kmc` at the beginning of every session there, which is how Krista's current
  instructions arrive. That is what installing the system means, exactly as copying any
  project that has its own Claude settings would, and as the older GitHub install did. Claude
  asks before it writes into a `.claude` folder itself, so `kmc` is first saved in the folder
  and moves itself into `.claude/scripts` on its first run, and `kmc install` writes the rest.
  Nothing about this is hidden: tell her, in plain words, that her BOSS-OS folder will have its
  own settings that bring Krista's instructions in each time she opens it.
- **The sign-in is an ordinary emailed code.** `kmc login` asks the server to email an
  8-digit code to the address she bought with; she reads it to you; `kmc` sends it back to the
  same server that sent it, and saves the sign-in that comes back in `.kmc-os` in her home
  folder. It is the same as signing in to any website with a code from your email. The saved
  sign-in works like a password, so you never print it into this conversation, where it would
  sit in the chat history; if she asks, tell her exactly where it is kept and what it is.
- **What this puts on her computer, all of it:** Git (if it was missing), the saved sign-in in
  `.kmc-os`, and the BOSS-OS folder with its own settings. Nothing else on her computer changes,
  and her Claude settings for every other folder are not touched.
- **She approves every step.** Claude asks before each new kind of command, and nothing in
  this install turns that off. If she picks an option that stops it asking again, that is her
  choice, made in the box.
- **Plain words are about clarity, never secrecy.** The rules below are about talking to a
  nervous beginner kindly. If she asks what anything is or does, tell her the truth, plainly,
  in full, including what you just did and why.

**Which system this is.** This installs the **Agent Authority Operating System**, the one for
real estate agents and lenders. Krista's server knows which system each person bought, from
their record with Krista Mashore Coaching. If `kmc` says this person bought the other one (the
Authority Operating System, for coaches, consultants and other businesses), stop, tell her
plainly that this install is for the other system and it is not hers, and give her the support
address in "When something unexpected happens". Do not work around it.

## The rules that matter more than the steps

### 0. Never hand a Windows machine a command it cannot run

On Windows, Claude may be running PowerShell, where `mktemp`, `/dev/null`, `$(...)`, `grep`,
`chmod` and `~/` are absent or parse errors, and a student meets them as a wall of red on a step
she cannot skip. Know which shell every command is written for before you run it.

`kmc` is a bash script, and on Windows it runs through **Git's own bash**, never a bare `bash`
(on Windows that name can be WSL's Linux bash, which keeps the sign-in somewhere else entirely
and then says she is not signed in, or on "another computer"). Find Git's bash in this order,
and use the first that exists:

1. beside the Git that is installed: from `git.exe` in `...\Git\cmd`, go up one folder to
   `...\Git\bin\bash.exe` (or `...\Git\usr\bin\bash.exe`);
2. `C:\Program Files\Git\bin\bash.exe`;
3. `%LOCALAPPDATA%\Programs\Git\bin\bash.exe` (Git installed for her user only).

In PowerShell a path with a space in it needs the call operator:
`& "C:\Program Files\Git\bin\bash.exe" .claude/scripts/kmc whoami`. If Claude is already running
commands through Git's bash itself, `bash .claude/scripts/kmc ...` is fine as written.

### 1. She never types a command. Not once.

If you are about to say "open your terminal", "paste this", "run this command", or "create this
folder", stop. That sentence is the failure this skill exists to remove. You have her computer;
use it. What she does by hand is small and named in the steps: an installer window from Apple
or Windows if one appears, telling you her email, reading you the code, and saying yes when the
app asks to open her folder.

### 2. Plain words, and the whole truth

Talk the way she talks: **your system**, **your folder**, **Krista's server**, **the sign-in**,
**the code from your email**, **BOSS**. Where a technical word is the clearest one, use it and
say in a few words what it means. Do not pile up jargon she has to decode on top of a step she
is already nervous about.

Plain is never the same as partial. If she asks what something is or what it does, tell her
the whole truth in plain words, and never leave out what a step does to keep a message short.

### 3. She is nervous, alone, and nobody is sitting next to her

Assume a 60-year-old agent who has never installed anything, is already a little overwhelmed,
and has no one in the room to ask. She will not tell you she is lost. She will go quiet, or say
"ok", or guess. Everything below exists because of that.

**Say what is about to happen before it happens. Every time.** Never run something that takes
more than a few seconds without first saying, in one or two lines: what you are about to do,
what she will see on her screen, roughly how long, and what "normal" looks like while it
happens. A wait she was warned about is a wait. A wait she was not warned about is a crash.

> "Next I'm going to [plain-English thing]. You'll see [what appears]. It takes about [time].
> You don't need to do anything while it runs."

**Silence is the enemy.** If something takes longer than about thirty seconds, say something
while it runs. "Still going, this is the slow one" is worth more to her than a correct but
silent install.

**Tell her she can stop you, twice: once at the start, and again the moment she sounds
unsure.** At the start, one line is enough: *"If anything I say doesn't make sense, just tell
me and I'll say it another way."* The moment she hesitates, goes quiet, or apologises for
asking, give her the full version, and this one is not optional:

> "I won't think less of you for asking and there's no limit on how many times you can. And if
> you're ever unsure which option to pick, just ask me - I'll tell you which one and why."

**But do not wait only for a signal.** A lost person does not say "I'm lost", she says "ok".
Give her the full version once regardless, when you ask for her email in Step 4.

**Never make her feel behind.** No "as you probably know", no "simply", no "just". If she asks
something basic, answer it like it is a good question, because for her it is.

### 4. Recommend, and keep her choices real

Most forks in an install are technical and have one sensible answer. Do not hand her a menu of
those: recommend the sensible one in a half-sentence of why, and do it if she agrees.
"Whatever you think is best" from her is a yes to your recommendation. Anything that is truly
hers (her email, the code, anything irreversible) stays her decision.

### 5. The things that confuse people here, and what to say

Say the explanation **before** the moment, not after she has been staring at it.

**Her computer password is not part of this.** You never ask for it and never take a path that
needs it. Two windows that are not Claude's might appear, and each is the computer's own:

- **On a Mac, Apple's installer** (Step 3). It asks her to click Install and Agree, and on most
  Macs nothing else. If a work-managed Mac asks for a password there, it is Apple's own window
  and safe to use; if she does not know it, there is no way round it on a Mac, so stop and give
  her the support address.
- **On Windows, a Windows permission box** (the screen dims and asks whether to allow changes).
  Step 3 tries to avoid it. If it appears, it is Windows' own box: she can say yes if she can,
  and if it asks for a password she does not have, stop and give her the support address.

**Apple's installer window looks frozen.** It shows almost no progress for five to ten minutes.
Warn her first, tell her it is the longest wait of the whole install, and check in while it
runs.

**"error" on screen is you working, not her failing.** Say this at the start and again the first
time one appears.

**The code from her email is not a password.** It is eight digits that prove the email is hers,
it works for ten minutes, and she should never give it to anyone but you, here. She reads it to
you; she does not type it into a web page. (The email itself says to type it into a page; tell
her to ignore that line. The code is also in the email's subject.)

**A rejected code is not her fault.** Never let her sit with the idea that she typed it wrong
and broke something.

**Nothing here costs money.** If money comes up, answer it flatly: the tools are free, you will
not ask for a card, and you will not sign her up for anything.

**A pause is not a failure.** If she has to stop, everything done so far stays done, and she
picks up by saying the same words again.

---

## Step 0 - Say what is about to happen

> "Hi. I'm installing your BOSS system - fifteen to twenty minutes, and I do nearly all of it.
>
> Two things so nothing surprises you. You'll see a lot scroll past, sometimes the word
> **error** - that's normal, that's me finding something and fixing it. And boxes will pop up
> asking whether to allow something; they're expected, and they're not warnings.
>
> The only things I'll need from you are the email address you bought BOSS with, and a code
> I'll send to it. Keep that inbox open in another window.
>
> If anything I say doesn't make sense, just tell me and I'll say it another way. Ready?"

Wait for a yes.

**Keep it to that. Roughly ninety words.** Everything else gets said at the moment it matters.
**This applies to every message:** say the next thing, not the next five things.

**Describe approval boxes by what they mean.** Their wording changes between versions, so a
quoted button label is often wrong on her screen. Tell her what the box is asking and what each
option does, in plain words.

## Step 1 - The approval boxes

Claude asks before it runs each new kind of command, so she will see a handful of boxes. When the
next one appears, tell her in a line what it is asking and that saying yes is how the install
goes ahead. Most boxes offer to stop asking for that kind of command in this folder; tell her
that option exists and what it does, and let her choose.

**If she says no to a box, that is a correct answer and you say so.** Nothing ran. Tell her what
the command was for in one plain sentence and let her decide again. Never re-run the same thing
hoping for a different answer.

**Your own side of this.** Every separate command is another box. Group work into as few
commands as you can, and never re-run something to confirm what the first command already
printed.

## Step 1.5 - The machines that genuinely cannot do this

**Never tell her this machine cannot run Claude.** She is talking to you on it.

- **Mac, Windows and Linux all work.** A Chromebook counts as Linux only once its Linux feature
  is switched on.
- **An iPad, a phone, or any tablet.** These cannot do this. Stop here and say: *"This part
  needs a computer - a Mac or a Windows one. That's not something you've done wrong. If you
  have one, we can do it there."*
- **A computer so locked down that nothing can be installed** (Step 3 keeps being refused, or
  asks for a password she does not have). Stop rather than grinding, and say: *"This computer
  won't let me install what your system needs. That's how it's been set up, not something
  you've done. Email bosssupport@kristamashore.com and someone will sort out the best way
  forward with you."*

Do not half-install anything.

## Step 2 - Read the machine, once

One script. Not a series of questions to the computer. **Check exact paths only**; never search
her home folder broadly (on a Mac that sets off several "would like to access your Documents"
boxes).

Find out:

- **The operating system.**
- **Whether Git is really there.** On a Mac, never run `git` to find out: a bare Mac has a
  stand-in at `/usr/bin/git` that opens Apple's installer every time it is run, and you cannot
  see whether a window opened. On a Mac, Git is there only when `xcode-select -p` answers with a
  folder. On Windows, Git is there when one of the bash paths in rule 0 exists. On Linux, when
  `git --version` prints a version.
- **Earlier tries and older installs**, at these exact places in her home folder:
  - `Sites/BOSS-OS` (and `-2`, `-3`). It is **an earlier try of this install** if it has
    `.claude/scripts/kmc` in it, or holds nothing but `kmc`, `.DS_Store` or
    `.claude/settings.local.json`, or is empty. Carry on in it from wherever it got to; never
    start again beside it. If it has `CLAUDE.md` **and** `Agent-OS` already has her business
    in it (more than the starter pages), her setup has already begun: do not open a second
    setup session; tell her to carry on in the session called **Set up my BOSS**, or, if she
    cannot find it, go to Step 6 and open it once.
  - `Sites/BOSS-OS` with anything else in it: something else of hers has that name. Leave it
    exactly as it is and use `Sites/BOSS-OS-2`.
  - `Sites/Agent-Authority-Operating-System`, `Sites/Authority-Operating-System`,
    `Documents/GitHub/Agent-Authority-Operating-System` or
    `Documents/GitHub/Authority-Operating-System`: **the older GitHub install.** She already has
    her system the older way. Say so in one line, tell her this install is not needed for her,
    give her bosssupport@kristamashore.com if she was told to move to the new one, and stop.
    Never touch that folder.

Do not show her the raw output. Everything downstream branches off this. Nothing downstream may
assume Mac.

## Step 3 - Put Git in place, without her password

Only if Step 2 said it is missing. Say one plain line first (*"Putting in the one tool your
system keeps its history with - a few minutes."*).

**Homebrew is never the answer to this, on any machine.** Installing it needs her computer
password, and a password prompt inside a tool call has nowhere to appear.

- **Mac:** `xcode-select --install`. This opens Apple's own installer window, so tell her
  first: *"A window from Apple is about to open asking to install some tools. Click Install,
  then Agree, and let it finish - five to ten minutes, and it's the longest wait in this whole
  install."* Then wait by checking `xcode-select -p` (never `git`) every thirty seconds or so,
  in short commands well under a minute each, and say something to her every couple of
  checks. Carry on when it answers with a folder. If `git --version` then says a licence has
  not been agreed, that needs her password on a Mac: stop and give her the support address.
- **Windows:** often Git is already there, because Claude itself uses it. If not, install it
  **for her user only**, which needs no Windows permission box:
  `winget install --id Git.Git --scope user --silent --accept-package-agreements --accept-source-agreements`.
  If winget is missing, or says it has no installer for that scope, download the Git for
  Windows installer from its official release (resolve the address from
  `https://api.github.com/repos/git-for-windows/git/releases/latest`, the `64-bit.exe` asset,
  never construct it by hand) and run it with `/VERYSILENT /NORESTART /CURRENTUSER`, which
  installs it for her user. Say one line: *"Putting this in a slightly different way - nothing
  for you to do."* A newly installed Git is not on the path for this session, so find its bash
  as rule 0 says rather than telling her to close anything.
- **Linux:** Git is optional here. Installing it needs her password on Linux, so do not.
  `kmc` works without it and simply keeps no version history. Say nothing about it unless she
  asks.

Before you move on: on Mac and Windows, `git --version` (run through the Git you just found)
prints a version.

## Step 4 - Bring the system's script down, and sign her in

### 4a - Make her folder and bring down the script

Say one line: *"Making your system's folder and bringing down the little program that connects
it to Krista's server."*

1. The folder is `Sites/BOSS-OS` in her home folder (or the one Step 2 chose). Create `Sites`
   if it does not exist.
2. Unless `.claude/scripts/kmc` is already inside it, download
   `https://kmc-os-server.vercel.app/kmc` into the folder, saved as `kmc`: `curl -fsSL` on Mac
   and Linux, `curl.exe -fsSL` on Windows (built into Windows 10 and 11; plain `curl` in
   PowerShell is something else). That address is the only one; never guess another.
3. From inside the folder, run `kmc whoami` through bash (on Windows, Git's bash, as rule 0
   says): `bash kmc whoami` the first time. On that first run it moves itself to
   `.claude/scripts/kmc`, and from then on it is always run as `.claude/scripts/kmc ...` from
   inside the folder.

What `whoami` says:

- **"Signed in as" an email:** this computer was signed in before. Ask her, in one line,
  whether that is the email she bought with. Yes: skip 4b. No (a partner's, say): do 4b with
  hers, which replaces it.
- **"isn't signed in":** go to 4b.
- **"belongs to another computer"** or **"has moved off this computer":** she used BOSS on
  another computer since this one was signed in. Do 4b: signing in here moves it back.
- **It is not the system she bought**, or **her access has ended:** stop, as "Which system
  this is" and Step 5 say.
- Anything else: see "When something unexpected happens".

### 4b - The one thing only she can do

**Ask for her email, and give her the full "you can ask me anything" line here** (rule 3).

> "Now the only part I can't do for you. What's the email address you bought BOSS with?"

**It has to be the one she bought with.** Say this once, plainly: not a work address she uses for
something else, and not her partner's, even if they share the business. That address is how
Krista's server knows the system is hers. If she is unsure, ask which address the receipt or the
welcome email from Krista Mashore Coaching went to.

Then run `.claude/scripts/kmc login "<her email>"` (quoted). It answers the same way whether or
not that email has the system, so it never tells you whether she is in. Tell her:

> "A code is on its way. It's from Krista Mashore Coaching, the subject starts **Your Authority
> OS sign-in code**, and the eight digits are right there in the subject. The email says to type
> it into a page - ignore that bit, just read the digits to me."

When she gives you the digits, run `.claude/scripts/kmc login "<her email>" <the code>`.

- **"Signed in.":** say so in one line and go to Step 5. She never has to do this again on this
  computer: it stays signed in for a year, and every time she uses it the year starts again.
  If it also says her system **has moved here** from another computer, tell her that in one
  line: the computer she used before has stopped, on purpose, and signing in there again would
  move it back.
- **"That code isn't right":** she has a few tries. Ask her to read it again from the newest
  email.
- **"Please try that again":** run the same command again with the same code.
- **"has expired", "already used" or "Too many tries":** she needs a new code. **Wait at least a
  minute first** (a second request within a minute sends nothing), then send a new one and tell
  her to use the newest email.
- **"This email doesn't have access to the Authority OS":** say plainly that Krista's server
  does not have BOSS under that address. Ask if she might have bought with another one, and
  sign in with that. If she is sure it is the right one, stop and give her the support address
  with that email in it.
- **"The code couldn't be sent just now":** wait a minute and try once more; if it says it
  again, see "When something unexpected happens".

**Nothing arrives after a few minutes:** ask her to look in spam or promotions for that subject.
If it is not there either, ask whether she might have bought with another address, and send a
code to that one. If she is sure it is the right one and still nothing comes, stop and give her
the support address with that email in it. **Never guess why**: a code request answers the same
either way, and you cannot see whether she has access. (Too many requests in an hour also sends
nothing, so do not send more than a few.)

## Step 5 - Install her system into the folder

Say one line: *"Installing your system into your BOSS-OS folder - about a minute."*

From inside the folder, run `.claude/scripts/kmc install`. It ends with a line like *"The
Authority OS is installed in ... Next: run setup ("set up my OS")."* **That next step is for the
new session in Step 6, never for this one.** Do not run the setup here; go on to Step 6.

Then check the folder now has its `CLAUDE.md` and its `.claude/settings.json`. If either is
missing, the install did not finish: run it once more, and if it is still missing, see "When
something unexpected happens".

**If it says this folder is not the system she bought**, stop and tell her plainly, as "Which
system this is" above says.

**If it says her access has ended**, stop and tell her that plainly too, with the support
address. Do not try to work around it.

## Step 6 - Open her system in its own session, and step aside

Her system can only set itself up in a session started inside its own folder: that is when it
loads its rules. So the last thing you do is open that session for her.

**If you have the desktop app's `start_session` tool** (load it first if it is only listed as a
deferred tool), call it with exactly these values:

- `initiation`: `"user_asked"` (she asked for this in her own words when she pasted the
  install; this is not a suggestion card)
- `context`: `"fresh"`
- `cwd`: the full path to her BOSS-OS folder
- `use_worktree`: `false` (her folder as it is, never a separate copy)
- `title`: `"Set up my BOSS"`
- `prompt`: `"set up my OS"`
- `background`: `"This student has just installed her BOSS system (Krista Mashore Coaching's Agent Authority Operating System) in this folder and is signed in. She is not technical: talk her through her setup in plain words, one step at a time."`

If the app asks her whether to trust or open the folder, tell her to say yes: it is her own
folder.

Then **show it to her**, with the desktop app's `open_session_in` tool (load it first if it is
deferred), passing the session id `start_session` returned: try `target` `"focus"`; if that is
refused (it is while her cursor is in the text box), try `"split"`; if that is refused too, or
you do not have the tool, tell her: *"It's in the list on the left, called **Set up my BOSS**.
Click it."*

Then send this, and stop:

> "Your system is installed and signed in. From here on you're talking to **BOSS**, in the
> session called **Set up my BOSS**. It's already starting: it loads Krista's instructions
> first, a few seconds of text, then asks about your business. That part runs for most of an
> hour. You can close this one."

**If you do not have `start_session`, or it refuses,** do not retry it and do not describe the
refusal. Give her the four steps, with the full path in its own untagged block so it has a copy
button:

> "Last step, and it's quick. Your system can only set itself up from its own folder, so it
> needs a fresh session there:
>
> 1. Copy this:
>
> ```
> /Users/her-name/Sites/BOSS-OS
> ```
>
> 2. Click **New** for a new session, and check the button above the box still says **Local**.
> 3. Click the folder button next to it, paste the path, click **Open**, and say yes when it
>    asks whether to trust the folder.
> 4. Type **set up my OS** and press Enter."

(That block shows her real path, not the example. **Never tag that block**: a tagged block gets
a Run button, and this is a folder, not a command. If she is not in the Claude desktop app,
tell her instead to start Claude in her BOSS-OS folder the same way she started it this time,
and say **set up my OS**.)

**Then stop.** Do not start her setup here, do not answer questions about her business, and do
not keep this session going. If this session is woken again later (the app does that when the
new session finishes a turn), say nothing, or at most one line pointing her to **Set up my
BOSS**. If she carries on talking to you here, point her there in one line.

---

## If she asks

Answer in a line or two, truthfully, and get back to the work.

**"Do I need a GitHub account?"**
No. This install does not use one.

**"Is this safe? What can you see?"**
She approves each step. What it puts on her computer is listed in "What you are installing":
Git if it was missing, her sign-in, and her BOSS-OS folder with its own settings, which bring
Krista's current instructions in each time she opens it. Her computer password is never typed
here and never seen.

**"Why does it keep saying error?"**
That is normal. It is the install checking what is already there, and finding something
missing is how it knows what to put in.

**"Can my partner use it too?"**
It works on one computer at a time and belongs to the email it was bought with. If they both
work off this computer, nothing to change. If he wants it on his own computer, that needs his
own BOSS; email bosssupport@kristamashore.com about it.

**"What is Krista's server?"**
It is where Krista keeps her instructions and skills, so they are always her latest. Her own
work, notes and clients stay in her folder on her computer.

**"Does this cost anything?"**
No.

**"Can I stop and come back later?"**
Yes, and nothing done is lost. She picks up by saying the same words again.

**"Do I need to leave my computer on?"**
Only while it is installing. Once her BOSS session is open, she can stop whenever she likes and
carry on later in that same session.

## If she leaves and comes back

She will stop mid-way for a showing, a call, or the school run, and come back saying some
version of *"I'm back, where were we?"*

**Never ask her what was already done.** Look at the machine, at the exact paths in Step 2:

- Is Git there (Step 2's checks, never by running a Mac's `git`)?
- Is there a BOSS-OS folder that is an earlier try, and does `kmc` sit in `.claude/scripts`?
- Does `.claude/scripts/kmc whoami` say she is signed in, and as her?
- Does the folder have its `CLAUDE.md`?
- Has her setup already begun (Step 2's test)?

Then give her the state in three lines, leading with what is finished, and carry on from the
first step not done. If her setup has begun, send her back to **Set up my BOSS** instead of
opening another.

## When something unexpected happens

Pick the safest option and keep going. Say one line about what you did. Do not hand her a
technical decision she has no way to settle.

Safest means, in order: destroy nothing, touch none of her own files, prefer what can be undone,
prefer what needs no password, and prefer doing nothing over guessing at something permanent.

If it is truly stuck, after a second try, stop grinding and give her the support address:

> "This one needs a person. Email **bosssupport@kristamashore.com**, say you were installing
> BOSS and which step you were on, and attach a screenshot of what you're looking at."

The exception is anything irreversible or outside this machine: deleting something of hers,
sending anything to another person, or spending money. Those stop and ask, every time.

## Never

- Never tell her to open a terminal, paste a command, or create a folder by hand.
- Never ask for her computer password, and never take a path that needs one.
- Never change her Claude settings yourself; the boxes are hers to answer.
- Never overwrite an existing settings file instead of merging into it.
- Never ask her to make or sign in to a GitHub account, fill in a form, or accept an invitation.
- Never download the system's script from anywhere but `https://kmc-os-server.vercel.app/kmc`.
- Never print her saved sign-in into the conversation.
- Never tell her she does not have access because a code did not arrive.
- Never run a Mac's `git` before `xcode-select -p` answers with a folder.
- Never start her setup in this session, and never touch a folder of hers that is not BOSS-OS.
