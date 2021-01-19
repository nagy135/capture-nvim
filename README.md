# capture-nvim

plugin to quickly store ideas with exact place in a file

## Dependency
Does not work on current stable build (0.4.4). Needs neovim nightly as of now

## Installation
```
Plug 'nagy135/capture-nvim'
```

## Usage
![demo](demo_todo_list.png)
This plugin is in initial development so all we have now is :

+ leader X - create new todo
+ leader J - jump to file (improved gF that jumps to column as well as line)

## Configuration

Add following variable to your vimrc to alter behavior

To create `todo.md` in root of currently opened project
instead of default location where projects have header
with project name. This separates todo files
```
let g:project_root_todo = 1
```

## TODO
+ check if inside git repository (now vim crashes instead)
+ make higher level headers in combined root todo list
+ option to specify todo location (if not project_root_todo
