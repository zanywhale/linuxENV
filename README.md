# linuxENV
For Linux Environment Set Up!

## alias
alias dockerExit=docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm
