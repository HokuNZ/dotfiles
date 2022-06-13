# Runs all install scripts in /app directory

for file in $(find $APPS -name "install.zsh")
do
  echo "› \033[00;34m${file}\033[0m"
  source $file
done