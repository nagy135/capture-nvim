# capture-nvim

plugin to quickly store ideas with exact place in a file

## Installation
```
Plug 'nagy135/capture-nvim'
```

## Usage
![demo](demo_todo_list.png)
This plugin is in initial development so all we have now is :

+ leader X - create new todo
+ leader J - jump to file (improved gF that jumps to column as well as line)

both binds have "shift modifier" ... so, leader, shift+x

## Configuration

Add following variable to your vimrc to alter behavior

To create `todo.md` in root of currently opened project
instead of default location where projects have header
with project name. This separates todo files
```
let g:project_root_todo = 1
```

To change location of todo file, define following variable.
Variable project_root_todo overrides this
```
let g:todo_file_location = "/absolute/path/to/file"
let g:todo_file_location = "~/file"
```

## TODO
+ check if inside git repository (now nvim crashes instead)
+ make higher level headers in combined root todo list
