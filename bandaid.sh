#!/bin/bash

# reset;
pwd;
# "bandaid_build" is the nano_build with banano changes applied.
# if all the changes are applied correctly, it should be identical to banano_build
# git diff is
# https://github.com/BananoCoin/banano/compare/v25...nanocurrency:V25.0

check_type=BananoCoin_v28_1_vs_nanocurrency_v28_1
# check_type="local"

if [ $check_type = "BananoCoin_v28_1_vs_nanocurrency_v28_1" ]
then
  echo "comparing BananoCoin v28.1 vs nanocurrency releases/V28.1"
  # --depth 1 means clone with no history.
  rm -rf nano_build;
  git clone -c advice.detachedHead=false --depth 1 --branch releases/v28 https://github.com/nanocurrency/nano-node.git nano_build;
elif [ $check_type = "local" ]
then
  echo "comparing local"
  rm -rf banano_build;
  echo "starting copying banano build"
  git clone -c advice.detachedHead=false --branch releases/v28 ../banano banano_build;
  echo "finished copying banano build"
else
  echo "unknown check_type $check_type"
fi

rm -rf bandaid_build;

rm nano_build/nano/nano_wallet/.DS_Store;

cp -r nano_build bandaid_build;

rm -rf banano_build/.git;
rm -rf bandaid_build/.git;
rm -rf banano_build/.github;
rm -rf bandaid_build/.github;
rm -rf banano_build/submodules;
rm -rf bandaid_build/submodules;

###
#### SECURITY.md should not be in banano's repo, as it lists PRs in nano's repo.
rm -f banano_build/SECURITY.md;
rm -f bandaid_build/SECURITY.md;
rm -f banano_build/CODE_OF_CONDUCT.md;
rm -f bandaid_build/CODE_OF_CONDUCT.md;
###

# copy code that doesnt require diffs.
cp banano_build/rep_weights_live.bin bandaid_build/rep_weights_live.bin;
cp banano_build/Info.plist.in bandaid_build/Info.plist.in;
cp banano_build/README.md bandaid_build/README.md;
cp banano_build/Banano.rc bandaid_build/Banano.rc;
cp banano_build/banano.ico bandaid_build/banano.ico;
cp banano_build/banano.png bandaid_build/banano.png;
cp banano_build/docker/node/Dockerfile bandaid_build/docker/node/Dockerfile;
cp banano_build/docker/node/Dockerfile-alpine bandaid_build/docker/node/Dockerfile-alpine;
cp banano_build/docker/node/build.sh bandaid_build/docker/node/build.sh;
cp banano_build/docker/node/entry.sh bandaid_build/docker/node/entry.sh;
cp banano_build/logo.png bandaid_build/logo.png;
cp banano_build/Nano.ico bandaid_build/Nano.ico;
cp banano_build/rep_weights_beta.bin bandaid_build/rep_weights_beta.bin;

#new code from banano
cp banano_build/nano/lib/convert.cpp bandaid_build/nano/lib/convert.cpp;
cp banano_build/nano/lib/convert.hpp bandaid_build/nano/lib/convert.hpp;
cp banano_build/nano/node/bootstrap_weights_live.hpp bandaid_build/nano/node/bootstrap_weights_live.hpp
cp banano_build/record_rep_weights.py bandaid_build/record_rep_weights.py

./banano-specific-code.sh

./banano-renaming.sh

printf 'doing diff\n'

### diff the two directories.
diff -qr bandaid_build banano_build;

diff -r bandaid_build banano_build | head -n 50;

### print line count
echo -n 'diff line count ';diff -r bandaid_build banano_build | wc -l;

### print pass/fail based on empty diff or not.
diff -r bandaid_build banano_build>/dev/null 2>&1;
ret=$?

if [[ $ret -eq 0 ]]; then
    echo "passed.";
    exit 0;
else
    echo "failed.";
    exit 1;
fi
