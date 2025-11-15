#Knano_ratio-to-MBAN_ratio.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'Knano_ratio-to-MBAN_ratio %s\n' "$p"
  awk  '{ gsub("Knano_ratio", "MBAN_ratio") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/Knano_ratio-to-MBAN_ratio.txt

#xrb_ratio-to-RAW_ratio.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'raw_ratio-to-RAW_ratio %s\n' "$p"
  awk  '{ gsub("raw_ratio", "RAW_ratio") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/raw_ratio-to-RAW_ratio.txt

#nano/core_test/
truncate -s -1 bandaid_build/nano/core_test/backlog.cpp;
truncate -s -1 bandaid_build/nano/core_test/numbers.cpp;
truncate -s -1 banano_build/nano/node/monitor.cpp;
