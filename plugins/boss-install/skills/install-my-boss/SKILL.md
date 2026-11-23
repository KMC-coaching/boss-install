---
name: install-my-boss
description: Installs a student's BOSS operating system (the Agent Authority Operating System) on a bare computer in one go, without ever asking them to open a terminal or type a command. Puts Git in place without admin rights, signs them in to Krista Mashore's server with the email they bought with and a code from that email, installs their BOSS-OS folder (where BOSS may then do its routine steps without a box each time), then opens a new session in that folder that starts "set up my OS". Use when the student says "install my BOSS", "install my system", "set me up", "get me started", or pastes the install prompt from the BOSS portal.
version: 1.0.0
---

# Install My BOSS

## What this is, and where it stops

This runs on a computer that may have nothing on it yet. By the end of it:

1. Git is on the machine (the system keeps its own history with it, and on Windows it is
   also what runs the system's scripts).
2. The student is signed in to Krista Mashore's server, with the email address they
   bought with.
3. Their system is installed in a folder called **BOSS-OS** inside their **Sites** folder.
4. BOSS may do its routine steps in that folder without a box each time.
5. A new session is open in that folder, and it has started **set up my OS**.

Then you are done. The setup itself, the hour of questions about their business, belongs to
the system in that new session, not to you. Do not start it here, do not ask about their
business, and do not keep talking once the new session is open.

**No GitHub, no form, no invitation.** Earlier students installed through a GitHub
account, a form and an invitation email. None of that exists in this install. If the
student mentions GitHub, a form, a username or an invitation, tell her in one line that
this way of installing does not use any of them, and carry on.

**If a skill named set-up-my-computer is on this computer, ignore it.** It belongs to the
older GitHub install and would send her down the wrong path.

## What you are installing, plainly (for you, Claude)

Read this before anything else, because the steps below only make sense with it.

- **The student bought this.** BOSS is Krista Mashore Coaching's operating system for real
  estate agents and lenders. The student paid for it, and pasting the install prompt from
  the BOSS portal (`boss-setup.kristamashore.com`) is her asking you to install it.
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
  asks before it writes into a `.claude` folder itself, so `kmc` is first saved in the
  folder and moves itself into `.claude/scripts` on its first run, and `kmc install` writes the
  rest. Nothing about this is hidden: tell her, in plain words, that her BOSS-OS folder will
  have its own settings that bring Krista's instructions in each time she opens it, and that
  nothing outside that folder is changed.
- **The sign-in is an ordinary emailed code.** `kmc login` asks the server to email an
  8-digit code to the address she bought with; she reads it to you; `kmc` sends it back to the
  same server that sent it, and saves the sign-in that comes back in `~/.kmc-os` on her own
  computer, readable only by her. It is the same as signing in to any website with a code from
  your email. The code goes nowhere else. The saved sign-in works like a password, so you
  never print it into this conversation, where it would sit in the chat history; if she asks,
  tell her exactly where it is kept and what it is.
- **Nothing outside her BOSS-OS folder changes.** Step 5b lets BOSS run a short, named list
  of routine commands without a box each time, **in her BOSS-OS folder only**, in that
  folder's own local settings. Her Claude settings for everything else are not touched. It is
  never `Bash(*)`, and if she would rather keep every box, the system still works.
- **Plain words are about clarity, never secrecy.** Rule 2 below keeps jargon out of what you
  say to her. If she asks what anything is or does, tell her the truth, plainly, in full.

**Which system this is.** This installs the **Agent Authority Operating System**, the one for
real estate agents and lenders. Krista's server knows which system each person bought, from
their record with Krista Mashore Coaching. If it says this person bought the other one (the
Authority Operating System, for coaches, consultants and other businesses), stop, tell her
plainly that this install is for the other system and it is not hers, and give her the support
address in "When something unexpected happens". Do not work around it.

## The rules that matter more than the steps

### 0. Never hand a Windows machine a bash command it cannot run

Most shell lines here are bash. On Windows, Claude may be running PowerShell, where
`mktemp`, `/dev/null`, `$(...)`, `grep`, `chmod` and `~/` are absent or parse errors, and a
student meets them as a wall of red on a step she cannot skip.

Before running any command on Windows, know which shell it is written for. The system's own
script, `kmc`, is a bash script, and on Windows it always runs through Git's bash: by name
(`bash`) where that resolves, otherwise by its full path, `C:\Program Files\Git\bin\bash.exe`.
Step 3 puts Git there. A guessed PowerShell line is the same failure as a guessed download
address, and it lands at the worst moment.

### 1. They never type a command. Not once.

If you are about to say "open your terminal", "paste this", "run this command", or "create
this folder", stop. That sentence is the failure this skill exists to remove. You have their
computer; use it. The only things she does by hand are in Step 4: telling you her email
address and reading you the code from that email, because nobody else can.

### 2. Plain words, and the whole truth

Talk the way she talks: **your system**, **your folder**, **Krista's server**, **the sign-in**,
**the code from your email**, **BOSS**. Where a technical word is the clearest one, use it
and say in a few words what it means. Do not pile up jargon she has to decode on top of a
step she is already nervous about.

Plain is never the same as partial. If she asks what something is or what it does, tell her
the whole truth in plain words, and never leave out what a step does to keep a message short.

### 3. She is nervous, alone, and nobody is sitting next to her

Assume a 60-year-old agent who has never installed anything, is already a little
overwhelmed, and has no one in the room to ask. She will not tell you she is lost. She will
go quiet, or say "ok", or guess. Everything below exists because of that.

**Say what is about to happen before it happens. Every time.** Never run something that takes
more than a few seconds without first saying, in one or two lines: what you are about to do,
what she will see on her screen, roughly how long, and what "normal" looks like while it
happens. A wait she was warned about is a wait. A wait she was not warned about is a crash.

The shape, every time:

> "Next I'm going to [plain-English thing]. You'll see [what appears]. It takes about
> [time]. You don't need to do anything while it runs."

**Silence is the enemy.** If something takes longer than about thirty seconds, say something
while it runs. "Still going, this is the slow one" is worth more to her than a correct but
silent install.

**Tell her she can stop you, twice: once at the start, and again the moment she sounds
unsure.** At the start, one line is enough: *"If anything I say doesn't make sense, just
tell me and I'll say it another way."* The moment she hesitates, goes quiet, or apologises
for asking, give her the full version, and this one is not optional:

> "I won't think less of you for asking and there's no limit on how many times you can.
> And if you're ever unsure which option to pick, just ask me - I'll tell you which one and
> why."

**But do not wait only for a signal.** A lost person does not say "I'm lost", she says "ok".
Give her the full version once regardless, at the first moment she has to do something
herself: when you ask for her email in Step 4.

**Never make her feel behind.** No "as you probably know", no "simply", no "just". If she
asks something basic, answer it like it is a good question, because for her it is. If she
apologises for asking, tell her plainly that she has nothing to apologise for.

### 4. Decide for her. Only ask when it is genuinely hers to answer.

Most of what comes up in this install is not a real choice. It is a technical fork with one
right answer, and handing it to her is how a person who was doing fine starts to feel stupid.

- **If you know the right answer, do it.** Do not narrate the fork, do not ask permission, do
  not explain what you considered. Say what you did in one line afterwards if it matters.
- **If you must ask, never present a menu.** One recommended answer, stated plainly, with the
  reason in a half-sentence. A yes is the expected answer.
- **Always give her a way out of deciding.** "Just do whatever you think is best" is always an
  available answer, and when she says it, that is full permission.

The only things that are genuinely hers: her email address, the code from it, and anything
irreversible. Everything else is yours.

### 5. The things that confuse people here, and what to say

Say the explanation **before** the moment, not after she has been staring at it.

**A password box is not part of this, and here is the one place it could appear.** Nothing
in this install needs her computer password. Everything goes into her own home folder. If a
box asking for her computer password ever appears, it is Apple's own installer on a
locked-down or work-managed machine, not something you did. Say so plainly, tell her it is
safe to enter it there because it is Apple's own window, and if she does not know it or does
not want to, say the install can continue without it and route around.

**Apple's installer window looks frozen.** It shows almost no progress for five to ten
minutes. Warn her first, tell her it is the longest wait of the whole install, and check in
while it runs.

**"error" on screen is you working, not her failing.** Say this at the start and again the
first time one appears.

**The code from her email is not a password.** It is eight digits that prove the email is
hers. It works once, for ten minutes, and is useless to anyone else. She reads it to you;
she never types it into a web page.

**A rejected code is not her fault.** It ran out, or an older email was opened. A fresh one
costs nothing. Never let her sit with the idea that she typed it wrong and broke something.

**Nothing here costs money.** If money comes up, answer it flatly: the tools are free, you
will not ask for a card, and you will not sign her up for anything.

**A pause is not a failure.** If she has to stop, everything done so far stays done, and she
picks up by saying the same words again.

---

## Step 0 - Say what is about to happen

> "Hi. I'm installing your BOSS system - fifteen to twenty minutes, and I do nearly all of
> it.
>
> Two things so nothing surprises you. You'll see a lot scroll past, sometimes the word
> **error** - that's normal, that's me finding something and fixing it. And a box will pop
> up asking whether to allow something; that's expected, and it's not a warning.
>
> The only things I'll need from you are the email address you bought BOSS with, and a code
> I'll send to it. Keep that inbox open in another window.
>
> If anything I say doesn't make sense, just tell me and I'll say it another way. Ready?"

Wait for a yes.

**Keep it to that. Roughly ninety words.** Everything else gets said at the moment it
matters. **This applies to every message:** say the next thing, not the next five things.

**Never name an exact button.** What an approval box says depends on her version. Describe
what the option means and let her find it.

## Step 1 - The approval boxes

Claude asks before it runs each new kind of command, so she will see a handful of boxes during
the install. **When the first one appears, tell her what to pick, then, not in the opening.**
One line: pick the option that allows it **and says something like don't ask again** for that
kind of command. Go by what it means rather than exact wording.

**If she refuses a box, that is a correct answer and you say so.** Nothing ran. Tell her what
the command was for in one plain sentence and let her decide again. Never re-run the same
thing hoping for a different answer.

**Your own side of this.** Every separate command is another box. Group work into as few
commands as you can, and never re-run something to confirm what the first command already
printed.

## Step 1.5 - The machines that genuinely cannot do this

**Never tell her this machine cannot run Claude.** She is talking to you on it.

- **Mac, Windows and Linux all work.** Do not single anyone out for the computer they own. A
  Chromebook only counts as Linux once its Linux feature is switched on; without it, it
  belongs with the tablets below.
- **An iPad, a phone, or any tablet.** These cannot do this. Stop here.
- **A work laptop so locked down that nothing can be installed.** This shows up as repeated
  refusals in Step 3. If Git cannot be put in place at all, stop rather than grinding.

When one of those is the case, say it plainly and never let her feel she bought the wrong
thing:

> "This part needs a Mac or a Windows computer. That's not something you've done wrong. If
> you have another computer, we can do this there. If you don't, email
> bosssupport@kristamashore.com and someone will sort out the best way forward with you."

Then stop. Do not half-install anything.

## Step 2 - Read the machine, once

One script. Not a series of questions to the computer.

Find out: the operating system, whether Git is present **and actually runs**, where her home
folder is, and whether any of these already exist in her home folder:

- `Sites/BOSS-OS` (or `Sites/BOSS-OS-2`, `-3`) with `.claude/scripts/kmc` inside it: an
  earlier try of this install. Carry on from wherever it got to; never start again beside it.
- `Sites/BOSS-OS` with other things in it and **no** `.claude/scripts/kmc`: something else of
  hers has that name. Leave it exactly as it is and use `Sites/BOSS-OS-2` instead.
- A folder from the older GitHub install, such as `Sites/Agent-Authority-Operating-System`:
  she already has her system the older way. Say so in one line, tell her this install is not
  needed for her, give her bosssupport@kristamashore.com if she was told to move to the new
  one, and stop. Never touch that folder.

Print what you found as a short block for yourself and move on. Do not show her the raw
output. **On a Mac, `command -v git` is not enough:** a bare Mac has a stand-in at
`/usr/bin/git` that only opens Apple's installer when it is run. Git is present when
`xcode-select -p` answers with a folder and `git --version` prints a version without opening
a window.

**Do not check for Python and do not install it.** On a Mac it arrives with the Apple tools
Step 3 installs for Git; elsewhere the things that use it later work without it.

Everything downstream branches off this. Nothing downstream may assume Mac.

## Step 3 - Put Git in place, without admin rights

Only if Step 2 said it is missing. Say one plain line first (*"Putting in the one tool your
system keeps its history with - a few minutes."*).

**Nothing here may need her computer password.** If a path you are considering needs one, it
is the wrong path.

- **Mac:** `xcode-select --install`. This opens Apple's own installer window, the one dialog
  here that is not Claude's, so tell her first: *"A window from Apple is about to open asking
  to install some tools. Click Install and let it finish - five to ten minutes, and it's the
  longest wait in this whole install."* Poll until `git --version` answers, then continue.
- **Windows:** `winget install --id Git.Git --silent --accept-package-agreements
  --accept-source-agreements`.

  **Check `winget` actually exists first.** An older or tightly managed machine may not have
  it. If it is missing, do not install it and do not send her to the Microsoft Store.
  Download Git for Windows directly from its official release page instead (resolve the
  installer's address from `https://api.github.com/repos/git-for-windows/git/releases/latest`,
  never construct it by hand), run it silently for her user, and say one plain line: *"Your
  Windows is a slightly older one, so I'm putting this in a different way. Nothing for you to
  do."*

  After installing, the environment is not re-read until a new session starts. Call Git's bash
  by its full path for the rest of this install rather than telling her to close anything.
- **Linux:** whichever of `apt-get`, `dnf` is present, user-scope where possible.

**Homebrew is never the answer to this, on any machine.** Installing it needs her computer
password, and a password prompt inside a tool call has nowhere to appear.

Verify by running `git --version` and seeing a version come back before you move on.

## Step 4 - Bring the system's script down, and sign her in

### 4a - Make her folder and bring down the script

Say one line: *"Making your system's folder and bringing down the little program that
connects it to Krista's server."*

1. The folder is `Sites/BOSS-OS` in her home folder (or the one Step 2 chose). Create `Sites`
   if it does not exist.
2. Unless `.claude/scripts/kmc` is already inside it, download
   `https://kmc-os-server.vercel.app/kmc` into the folder, saved as `kmc`. On Mac and Linux use
   `curl -fsSL`; on Windows use `curl.exe -fsSL` (built into Windows 10 and 11). That address
   is the only one; never guess another.
3. From inside the folder, run `bash kmc whoami` (on Windows through Git's bash, as rule 0
   says). On that first run it moves itself to `.claude/scripts/kmc`, and from then on it is
   always run as `bash .claude/scripts/kmc ...` from inside the folder.

`whoami` answers in one of two ways. **Signed in** (it names an email): this computer was
signed in before, so skip 4b. **Not signed in**: go to 4b. Anything else, see "When
something unexpected happens".

### 4b - The one thing only she can do

**Ask for her email, and give her the full "you can ask me anything" line here** (rule 3).

> "Now the only part I can't do for you. What's the email address you bought BOSS with?"

**It has to be the one she bought with.** Say this once, plainly: not a work address she uses
for something else, and not her partner's, even if they share the business. That address is
how Krista's server knows the system is hers. If she is unsure which one, ask which email the
receipt or the welcome email from Krista Mashore Coaching went to.

Then, from inside the folder, run `bash .claude/scripts/kmc login <her email>`. It always
answers the same way whether or not that email has the system, so it never tells you whether
she is in. Tell her:

> "A code is on its way to that inbox. It comes from Krista Mashore Coaching, and the subject
> is **Your Authority OS sign-in code**. It's eight digits. Read it to me when it arrives."

When she gives you the digits, run `bash .claude/scripts/kmc login <her email> <the code>`.

- **Signed in:** say so in one line and go straight to Step 5. She never has to do this again
  on this computer: it stays signed in for a year, and every time she uses it the year starts
  again.
- **The code is wrong or has run out:** it works once, for ten minutes. Say a fresh one costs
  nothing, ask for a new one with the first command again, and tell her to use the newest
  email.
- **Too many tries:** same, a new code.
- **Nothing arrives after a few minutes:** ask her to look in spam or promotions for the
  subject above. If it is not there either, the email is almost always not the one she bought
  with: ask if there is another address she might have used, and send a code to that one. If
  she is sure it is the right one and still nothing comes, stop and give her the support
  address with that email in it. **Never guess why**, and never tell her she does not have
  access: you cannot see that, and saying it would be a guess.

**Never print the saved sign-in into the conversation.** It works like a password and would
sit in the chat history. It lives in `.kmc-os` in her home folder; if she asks, tell her that,
and what it is.

**Signing in on this computer moves her system here.** BOSS works on one computer at a time.
If she used it on another computer before, that one stops now. If she asks, tell her plainly
that this is on purpose, and that signing in again on the other computer moves it back.

## Step 5 - Install her system into the folder

Say one line: *"Installing your system into your BOSS-OS folder - about a minute."*

From inside the folder, run `bash .claude/scripts/kmc install`. It answers with how many of
the folder's own files it installed. Then check the folder now has its `CLAUDE.md` and its
`.claude/settings.json`; if either is missing, the install did not finish: run it once more,
and if it is still missing, see "When something unexpected happens".

**If it says this folder is not the system she bought**, stop and tell her plainly, as "Which
system this is" above says.

**If it says her access has ended**, stop and tell her that plainly too, with the support
address. Do not try to work around it.

## Step 5b - Fewer boxes in her BOSS-OS folder, and only there

Many of the system's skills run the same few routine commands. Write them into the BOSS-OS
folder's **own local settings**, `.claude/settings.local.json` inside the folder, so BOSS can
run them there without a box each time. Nothing outside that folder changes, and the
system's own updates leave this file alone.

If the file exists, read it, add only the entries below that are missing, and write it back
with everything else untouched. If it does not, create it with just a `permissions.allow`
block. The entries:

```
"Bash(mkdir:*)", "Bash(ls:*)", "Bash(cat:*)", "Bash(cp:*)", "Bash(mv:*)",
"Bash(find:*)", "Bash(curl:*)", "Bash(unzip:*)", "Bash(tar:*)",
"Bash(git:*)", "Bash(python3:*)"
```

`Bash(python3:*)` matters most: many of the system's skills run `python3`, and without it she
gets a box on nearly every one of them. The list is deliberately not `Bash(*)`.

Say it in one line: *"I've let BOSS do its routine steps in your BOSS-OS folder without asking
you each time. Nothing outside that folder changed."* If the write is refused, say *"You'll
see a few more of those boxes than I'd like. Same answer each time."* and carry on.

## Step 6 - Open her system in its own session, and step aside

Her system can only set itself up in a session that was started inside its own folder: that
is when it loads its rules. So the last thing you do is open that session for her.

**If you have a tool for starting a new Claude Code session in another folder,** use it. In
the Claude desktop app it is called `start_session` (if it is only listed as a deferred tool,
load it first). Start it like this:

- the folder (`cwd`): the full path to her BOSS-OS folder;
- **not** a separate copy of the folder (`use_worktree: false`), and a fresh session, not a
  copy of this conversation;
- a title she will recognise: **Set up my BOSS**;
- its task, exactly: `set up my OS`;
- why: this student has just installed her BOSS system in this folder and is signed in; she
  is not technical and should be talked through her setup in plain words.

She asked for this in her own words when she pasted the install, so start it now; this is not
a suggestion card. If the app asks her to trust the folder, tell her to say yes: it is her own
folder.

Then **show it to her**. If you have a tool that shows a session you started in the main
window (in the desktop app, `open_session_in` with `focus`), use it. If it is refused because
her cursor is in the text box, or you do not have it, tell her where it is: *"It's in the list
on the left, called **Set up my BOSS**. Click it."*

Then send this, and stop:

> "Your system is installed and signed in. From here on you're talking to **BOSS**, in the
> session called **Set up my BOSS**. It's already starting: it loads Krista's instructions
> first, a few seconds of text, then asks about your business. That part runs for most of an
> hour. You can close this one."

**If you have no such tool, or it refuses,** do not retry it and do not describe the refusal.
Give her the four steps, plainly, with the full path in its own untagged block so it has a
copy button:

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

(That block shows her real path, not the example. **Never tag that block**: a tagged block
gets a Run button, and this is a folder, not a command.)

**Then stop.** Do not start her setup here, do not answer questions about her business, and do
not keep this session going. If she carries on talking to you here, point her to the other
session in one line.

---

## If she asks

Answer in a line or two and get back to the work. Never volunteer these unprompted.

**"Do I need a GitHub account?"**
No. This install does not use GitHub at all.

**"Is this safe? What can you see?"**
Everything goes into her own home folder, nothing touches her system settings, and she
approves each step. Her computer password is never typed here and never seen.

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
Only while it is installing. Once her BOSS session is open, she can stop whenever she likes
and carry on later in that same session.

## If she leaves and comes back

She will stop mid-way for a showing, a call, or the school run, and come back saying some
version of *"I'm back, where were we?"*

**Never ask her what was already done.** Look at the machine:

- Is Git there and does it run?
- Is there a BOSS-OS folder with `.claude/scripts/kmc` in it?
- Does `bash .claude/scripts/kmc whoami` say she is signed in?
- Does the folder have its `CLAUDE.md`?

Then give her the state in three lines, leading with what is finished, and carry on from the
first step not done. If everything is done, go straight to Step 6.

## When something unexpected happens

Pick the safest option and keep going. Say one line about what you did. Do not hand her a
technical decision she has no way to settle.

Safest means, in order: destroy nothing, touch none of her own files, prefer what can be
undone, prefer what needs no password, and prefer doing nothing over guessing at something
permanent.

If it is truly stuck, after a second try, stop grinding and give her the support address:

> "This one needs a person. Email **bosssupport@kristamashore.com**, say you were installing
> BOSS and which step you were on, and attach a screenshot of what you're looking at."

The exception is anything irreversible or outside this machine: deleting something of hers,
sending anything to another person, or spending money. Those stop and ask, every time.

## Never

- Never tell her to open a terminal, paste a command, or create a folder by hand.
- Never ask for her computer password, and never take a path that needs one.
- Never name an exact button in the approval box.
- Never write `Bash(*)` into any settings, and never change her Claude settings outside BOSS-OS.
- Never overwrite an existing settings file instead of merging into it.
- Never use GitHub, a GitHub account, a form or an invitation in this install.
- Never download the system's script from anywhere but `https://kmc-os-server.vercel.app/kmc`.
- Never print her saved sign-in into the conversation.
- Never tell her she does not have access because a code did not arrive.
- Never start her setup in this session, and never touch a folder of hers that is not BOSS-OS.
