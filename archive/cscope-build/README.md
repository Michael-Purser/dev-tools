# CSCOPE Database Building

## Purpose
[CSCOPE](http://cscope.sourceforge.net/) is a nice tool for navigating C-based projects that is also integrated into Vim.
However, the process of building/updating the database is cumbersome (see section 11 of http://cscope.sourceforge.net/cscope_vim_tutorial.html).

The script in this repository automates this building process for C++ projects.

## Note
Only works for bash shells.

## Usage
1. Clone the project.
1. Get the submodule:
   ```
   $ git submodule update --init --recursive
   ```
1. Make `cscope_build_db` executable:
   ```
   $ sudo chmod +x cscope_build_db
   ```
1. Run `cscope_build_db -h` to see the script usage.
1. Run the script with the correct arguments to generate the CSCOPE database for your C++ project.

## Tips
- If you work mostly with the same project, consider creating an alias to run the script (this will prevent you from having to type the arguments every time).
- If you have a fixed location for the `cscope.out` database file, consider automating the export of the `CSCOPE_DB` environment variable by adding this to your `.bashrc` file:
  ```
  if [ -f <DB_FILE_LOCATION> ]; then
      CSCOPE_DB="<DB_FILE_LOCATION>"
  fi
  ```
