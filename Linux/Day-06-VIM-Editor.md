## Introduction To VI Editor

VI Editor has two modes insertion mode and command mode. The editor begins in command mode, where the cursor movement and text deletion and pasting occur.

Insertion mode begins upon entering an insertion or change command. return the editor to command mode (where you can quit, for example by typing :q!).

Most commands execute as soon as you type them except for "colon" commands which execute when you press the return key.

### Input Commands (End with Esc)

```a                Append after cursor 
i                Insert Before cursor 
o               Open line below 
O              Open line above 
:r file        Insert file after current line
```

**Note:** All the above commands will make vi in input mode press Esc to come back to command mode. 

## Change Commands (Input Mode)

```
cw               Change word (Esc)
cc                Change line (Esc) - blanks line
c$                Change to end of line
rc                 Replace character with c
R                 Replace (Esc) - typeover
s                  Substitute (Esc) - 1 char with string
S                 Substitute (Esc) - Rest of line with text
.                  Repeat last change
~                Toggle upper and lower case
```

### Deletion Commands

```
dd or ndd         Delete n lines to general buffer       
dw                    Delete word to general buffer 
dnw                 Delete n word
db                    Delete previous word
D                     Delete to end of line
x                      Delete character
```

## File Management Commands  

```
:w name                Write edit buffer to file name
:wq                       Write to file and quit
:q!                        Quite without saving changes
ZZ                        Same as :wq
:sh                        Execute shell commands (<ctrl>d)
```

## Window Motions 

```
<ctrl>d                Scroll down (Half a screen)
<ctrl>u               Scroll up (Half a screen)
<ctrl>f                page forward
<ctrl>b                page backward
/string                 Search forward
?string                Search backward
<ctrl>l                Redraw screen
<ctrl>g                Display current line number and file information
n                          Repeat search
N                         Repeat search reverse    
G                         Go to last line
nG                       Go to last line n
:n                         Go to last line n
z<CR>                Reposition window: curser at top
z .               Reposition window: curser in middle
z -               Reposition window: curser at bottom
```

## Cursor Motions
```
H                Upper left corner (home)
M                Middle line
L                Lower left corner
h                Back a character
j                Down a line
k                Up a line
^               Beginning of line
$                End of line
l               Forward a character
w             One word Forward 
b             back One word
fc            find c 
;                Repeat find (find next c)
```

## Undo Commands
```
u                    Undo last change
U                    Return the last line which was modified to its original state (reverse all changes in last modified line)
:q!                Quite vi without writting
:e!                Re-edit a messed up file
Ctrl-R:                Redo changes which were undone (undo the undos)
```

## Rearrangement commands
```
yy or y               ank (copy) line to general buffer
nyy                    Yank n line to buffer
yw                     Yank word to general buffer
ndd                    Delete n lines to buffer
p                        Put general buffer after cursor
P                        Put general buffer before cursor
J                         Join lines
nJ                       Join the next n lines together; omitting n joins the beginning of the next line to the end of the current line.
```

##  Playing with multiple files
```
:n
:rew
```

## Move text from file old to file new
```
vi oldfile.txt
10yy                yank 10 lines to buffer a
:e newfile.txt
p                put text from a after cursor

#Write it to newfile.txt

:m,nw newfile.txt    Write lines m to n in file newfile.txt

:m,nw>> file             Saves lines m through n to the end of file

```

## Regular Expressions (Search Strings) 
```
^                Matches beginning of line
$                Matches end of line
.                Matches any single character
*               Matches any previous character 
.*              Matches any character
```

## Search and replace commands
```
:[address]s/old_test/new_test/gic

Address components:

.                Current line

n                Line    number    n

.+m                Current line plus m lines

$                Last line

/string/        A line that contains "string"

%                Entire file

[addr1],[addr2]        Specifies a range



Example:

## Remove last character
```
:%s/.$//
^M



## Change some vi Parameters
```
:set list                Show invisible character
:set nolist            Don't show invisible character
:set number        Show line number
:set nonumber    Dont Show line number
:set autoindent    Indent after carriage return
:set noautoindent     Turn off auto indent
:set showmatch    Show matching sets of parentheses as they are typed
:set noshowmatch         Turn off showmatch
:set showmode              Display mode on last line of screen
:set noshowmode          Turn off showmode 
:set ignorecase               Ignore case on searches
:set ic                             Ignore case on searches
:set noignorecase          Turn off ignore case
:set noic                        Turn off ignore case
:set all                          Show values of all passible parameters    
```
