In this script we will clone repo if not exist otherwise will checkout to the specif branches
The following command will clone the repo 
```bash
reset=true branch=feature ./clone
```
```bash
#!/bin/sh

if [ -z "$branch" ]
then
  branch="master"
fi

if [ -z "$reset" ]
then
  reset="false"
fi

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
apps=(repo1 repo2 repo3 repo4)

for app in ${apps[@]}; do
  echo "\n\n\n************************"
  echo "********* APP = ${app}"
  echo "********* Branch = ${branch}"
  echo "************************"
  folder="${dir}/../${app}"
  if [ ! -d ${folder} ]
  then
    echo "Cloning ${app}"
    git clone https://github.com/${app}.git ${folder}
  fi
  echo "${app}: Switching branch to ${branch}"
  {
    cd ${folder}
    if [ $reset == "true" ]; then
      echo "Resetting Git"
      git reset --hard
    fi
    git checkout master
    if [ $reset == "true" ]; then
      git fetch --all -p; git branch -vv | grep ": gone]" | awk '{ print $1 }' | xargs -n 1 git branch -D
    fi
    git checkout ${branch} && git pull origin ${branch} --no-edit
  } || {
    echo "***** branch ${app}/${branch} does not exist. Staying in master"
  }
done
```