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

#kRAW-to-banoshi.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'kRAW-to-banoshi %s\n' "$p"
  awk  '{ gsub("kRAW", "banoshi") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/kRAW-to-banoshi.txt

#nanocurrency-to-bananocoin.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'nanocurrency-to-bananocoin %s\n' "$p"
  awk  '{ gsub("nanocurrency", "bananocoin") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/nanocurrency-to-bananocoin.txt

#Nanocurrency-to-Bananocurrency.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'Nanocurrency-to-Bananocurrency %s\n' "$p"
  awk  '{ gsub("Nanocurrency", "Bananocurrency") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/Nanocurrency-to-Bananocurrency.txt

# #Nano-to-Banano.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'Nano-to-Banano %s\n' "$p"
  awk  '{ gsub("Nano", "Banano") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/Nano-to-Banano.txt

#Nano_Currency-to-Bananocoin.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'Nano_Currency-to-Bananocoin %s\n' "$p"
  awk  '{ gsub("Nano Currency", "Bananocoin") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/Nano_Currency-to-Bananocoin.txt

#nano_live_network-to-banano_live_network.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'nano_live_network-to-banano_live_network %s\n' "$p"
  awk  '{ gsub("nano_live_network", "banano_live_network") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/nano_live_network-to-banano_live_network.txt

#nano_test_network-to-banano_test_network.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'nano_test_network-to-banano_test_network %s\n' "$p"
  awk  '{ gsub("nano_test_network", "banano_test_network") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/nano_test_network-to-banano_test_network.txt

#nano_dev_network-to-banano_dev_network.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'nano_dev_network-to-banano_dev_network %s\n' "$p"
  awk  '{ gsub(" nano_dev_network", " banano_dev_network") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/nano_dev_network-to-banano_dev_network.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'nano_dev_network-to-banano_dev_network %s\n' "$p"
  awk  '{ gsub("=nano_dev_network", "=banano_dev_network") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/nano_dev_network-to-banano_dev_network.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'nano_dev_network-to-banano_dev_network %s\n' "$p"
  awk  '{ gsub(":nano_dev_network", ":banano_dev_network") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/nano_dev_network-to-banano_dev_network.txt

#nano_beta_network-to-banano_beta_network.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'nano_beta_network-to-banano_beta_network %s\n' "$p"
  awk  '{ gsub("nano_beta_network", "banano_beta_network") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/nano_beta_network-to-banano_beta_network.txt

#nano_wallet-to-banano_wallet.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'nano_wallet-to-banano_wallet.txt %s\n' "$p"
  awk  '{ gsub("nano_wallet", "banano_wallet") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/nano_wallet-to-banano_wallet.txt

#nano_-to-banano_.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf 'nano_-to-banano_ %s\n' "$p"
  awk  '{ gsub("nano_", "banano_") }; { print $0 }' bandaid_build/$p > bandaid_build/$p.awk
  mv bandaid_build/$p.awk bandaid_build/$p;
done < input/nano_-to-banano_.txt

# buggy conversions
printf 'undoing buggy conversions\n'

#./CMakeLists.txt
awk  'NR==42 { gsub("Banano Currency", "Bananocoin") }; { print $0 }' bandaid_build/CMakeLists.txt > bandaid_build/CMakeLists.txt.awk
mv bandaid_build/CMakeLists.txt.awk bandaid_build/CMakeLists.txt;
awk  'NR==723 { gsub("bananode", "nano_node") }; { print $0 }' bandaid_build/CMakeLists.txt > bandaid_build/CMakeLists.txt.awk
mv bandaid_build/CMakeLists.txt.awk bandaid_build/CMakeLists.txt;
awk  'NR==725 { gsub("banano_rpc", "nano_rpc") }; { print $0 }' bandaid_build/CMakeLists.txt > bandaid_build/CMakeLists.txt.awk
mv bandaid_build/CMakeLists.txt.awk bandaid_build/CMakeLists.txt;
awk  'NR==830 { gsub("Banano.rc", "Nano.rc") }; { print $0 }' bandaid_build/CMakeLists.txt > bandaid_build/CMakeLists.txt.awk
mv bandaid_build/CMakeLists.txt.awk bandaid_build/CMakeLists.txt;
awk  'NR==901 { gsub("Banano.icns", "Nano.icns") }; { print $0 }' bandaid_build/CMakeLists.txt > bandaid_build/CMakeLists.txt.awk
mv bandaid_build/CMakeLists.txt.awk bandaid_build/CMakeLists.txt;
awk  'NR==911 || NR==912 || NR==915 || NR==917 || NR==918 || NR==921 || NR==922 { gsub("Banano", "Nano") }; { print $0 }' bandaid_build/CMakeLists.txt > bandaid_build/CMakeLists.txt.awk
mv bandaid_build/CMakeLists.txt.awk bandaid_build/CMakeLists.txt;

#nano/nano_node/entry.cpp
awk  'NR==134 || NR==135 || NR==136 { sub("banano_dev_network", "nano_dev_network") }; { print $0 }' bandaid_build/nano/nano_node/entry.cpp > bandaid_build/nano/nano_node/entry.cpp.awk
mv bandaid_build/nano/nano_node/entry.cpp.awk bandaid_build/nano/nano_node/entry.cpp;

#nano/nano_wallet/entry.cpp
awk  'NR==39 { sub("Banano", "Nano") }; { print $0 }' bandaid_build/nano/nano_wallet/entry.cpp > bandaid_build/nano/nano_wallet/entry.cpp.awk
mv bandaid_build/nano/nano_wallet/entry.cpp.awk bandaid_build/nano/nano_wallet/entry.cpp;

#nano/node/portmapping.cpp
awk  'NR==184 { sub("Banano", "Nano") }; { print $0 }' bandaid_build/nano/node/portmapping.cpp > bandaid_build/nano/node/portmapping.cpp.awk
mv bandaid_build/nano/node/portmapping.cpp.awk bandaid_build/nano/node/portmapping.cpp;

#nanocurrency-beta.spec.in
awk  'NR==41 || NR==42 { gsub("bananocoin", "nanocurrency") }; { print $0 }' bandaid_build/nanocurrency-beta.spec.in > bandaid_build/nanocurrency-beta.spec.in.awk
mv bandaid_build/nanocurrency-beta.spec.in.awk bandaid_build/nanocurrency-beta.spec.in;

awk  'NR==42 { gsub("bananode", "nano_node") }; { print $0 }' bandaid_build/nanocurrency-beta.spec.in > bandaid_build/nanocurrency-beta.spec.in.awk
mv bandaid_build/nanocurrency-beta.spec.in.awk bandaid_build/nanocurrency-beta.spec.in;

#nano/node/cli.cpp
awk  'NR==786 { gsub("Banano", "Nano") }; { print $0 }' bandaid_build/nano/node/cli.cpp > bandaid_build/nano/node/cli.cpp.awk
mv bandaid_build/nano/node/cli.cpp.awk bandaid_build/nano/node/cli.cpp;

#nano/core_test/websocket.cpp
awk  'NR==247 || NR==928 { gsub("ban", "xrb") }; { print $0 }' bandaid_build/nano/core_test/websocket.cpp > bandaid_build/nano/core_test/websocket.cpp.awk
mv bandaid_build/nano/core_test/websocket.cpp.awk bandaid_build/nano/core_test/websocket.cpp;

#nano/secure/common.cpp
awk  'NR==30{ gsub("ban", "xrb") }; { print $0 }' bandaid_build/nano/secure/common.cpp > bandaid_build/nano/secure/common.cpp.awk
mv bandaid_build/nano/secure/common.cpp.awk bandaid_build/nano/secure/common.cpp;

#nano/core_test/block.cpp
awk  'NR==742{ gsub("ban", "bano") }; { print $0 }' bandaid_build/nano/core_test/block.cpp > bandaid_build/nano/core_test/block.cpp.awk
mv bandaid_build/nano/core_test/block.cpp.awk bandaid_build/nano/core_test/block.cpp;

#nano/core_test/
truncate -s -1 bandaid_build/nano/core_test/backlog.cpp;
truncate -s -1 bandaid_build/nano/core_test/numbers.cpp;
truncate -s -1 banano_build/nano/node/monitor.cpp;
