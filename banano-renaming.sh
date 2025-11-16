#Knano_ratio-to-MBAN_ratio.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'Knano_ratio-to-MBAN_ratio %s\n' "$p"
  awk  '{ gsub("Knano_ratio", "MBAN_ratio") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/Knano_ratio-to-MBAN_ratio.txt

# git checkpoint
cd bandaid_build;
git add .;
git commit -m "Knano_ratio-to-MBAN_ratio";
cd ..;
# git checkpoint

#xrb_ratio-to-RAW_ratio.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'raw_ratio-to-RAW_ratio %s\n' "$p"
  awk  '{ gsub("raw_ratio", "RAW_ratio") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/raw_ratio-to-RAW_ratio.txt

# git checkpoint
cd bandaid_build;
git add .;
git commit -m "raw_ratio-to-RAW_ratio";
cd ..;
# git checkpoint

#nano/core_test/
truncate -s -1 bandaid_build/nano/core_test/backlog.cpp;
truncate -s -1 bandaid_build/nano/core_test/numbers.cpp;

# git checkpoint
cd bandaid_build;
git add .;
git commit -m "buggy end of lines";
cd ..;
# git checkpoint
