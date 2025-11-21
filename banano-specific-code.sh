# load helper function
source ./search-replace-check.sh

# check it worked
if [ $? -ne 0 ]; then
    echo "Error: Could not source 'search-replace-check.sh'. Exiting." >&2
    exit 1
fi

#.gitignore
awk  'NR==33 || NR==34 { sub("nano_node", "bananode") }; { print $0 }' bandaid_build/.gitignore > bandaid_build/.gitignore.awk
mv bandaid_build/.gitignore.awk bandaid_build/.gitignore;

awk  'NR==35 || NR==36 { sub("nano_wallet", "banano_wallet") }; { print $0 }' bandaid_build/.gitignore > bandaid_build/.gitignore.awk
mv bandaid_build/.gitignore.awk bandaid_build/.gitignore;

awk  'NR==39 || NR==40 { sub("nano_rpc", "banano_rpc") }; { print $0 }' bandaid_build/.gitignore > bandaid_build/.gitignore.awk
mv bandaid_build/.gitignore.awk bandaid_build/.gitignore;

#util/changelog.py
awk  'NR==118 { sub("incremental", "BananoCoin/banano") }; { print $0 }' bandaid_build/util/changelog.py > bandaid_build/util/changelog.py.awk
mv bandaid_build/util/changelog.py.awk bandaid_build/util/changelog.py;

awk  'NR==131 { sub("nanocurrency/nano-node", "BananoCoin/banano") }; { print $0 }' bandaid_build/util/changelog.py > bandaid_build/util/changelog.py.awk
mv bandaid_build/util/changelog.py.awk bandaid_build/util/changelog.py;

#ci/actions/linux/docker-impl/docker-common.sh
awk  'NR==36 { sub("\\$\\{GITHUB_REPOSITORY\\}", "bananocoin") }; { print $0 }' bandaid_build/ci/actions/linux/docker-impl/docker-common.sh > bandaid_build/ci/actions/linux/docker-impl/docker-common.sh.awk
mv bandaid_build/ci/actions/linux/docker-impl/docker-common.sh.awk bandaid_build/ci/actions/linux/docker-impl/docker-common.sh;

# ci/build-docker-image.sh
awk  'NR==11 || NR==23 { sub("\\$\\{GITHUB_REPOSITORY\\}", "bananocoin") }; { print $0 }' bandaid_build/ci/build-docker-image.sh > bandaid_build/ci/build-docker-image.sh.awk
mv bandaid_build/ci/build-docker-image.sh.awk bandaid_build/ci/build-docker-image.sh;

#ci/actions/deploy.sh
awk  'NR==17 { sub("nano-node", "bananode") }; { print $0 }' bandaid_build/ci/actions/deploy.sh > bandaid_build/ci/actions/deploy.sh.awk
mv bandaid_build/ci/actions/deploy.sh.awk bandaid_build/ci/actions/deploy.sh;

sed -n '1,24p' bandaid_build/ci/actions/deploy.sh > bandaid_build/ci/actions/deploy.sh.sed;
# echo '// INSERT HERE' >> bandaid_build/ci/actions/deploy.sh.sed
sed -n '25,29p' banano_build/ci/actions/deploy.sh >> bandaid_build/ci/actions/deploy.sh.sed;
sed '1,26d' bandaid_build/ci/actions/deploy.sh >> bandaid_build/ci/actions/deploy.sh.sed;
mv bandaid_build/ci/actions/deploy.sh.sed bandaid_build/ci/actions/deploy.sh;

# # CMakeLists.txt
sed -n '1,158p' bandaid_build/CMakeLists.txt > bandaid_build/CMakeLists.txt.sed;
# echo '// BEGIN INSERT HERE' >> bandaid_build/CMakeLists.txt.sed;
sed -n '159,180p' banano_build/CMakeLists.txt >> bandaid_build/CMakeLists.txt.sed;
# echo '// END INSERT HERE' >> bandaid_build/CMakeLists.txt.sed;
sed '1,161d' bandaid_build/CMakeLists.txt >> bandaid_build/CMakeLists.txt.sed;
mv bandaid_build/CMakeLists.txt.sed bandaid_build/CMakeLists.txt;

#nano/core_test/block.cpp
search_replace_check \
  bandaid_build/nano/core_test/block.cpp \
  "ban_3t6k35gi95xu6tergt6p69ck76ogmitsa8mnijtpxm9fkcm736xtoncuohr3" \
  "ban_1bananobh5rat99qfgt1ptpieie5swmoth87thi74qgbfrij7dcgjiij94xr" \
  2
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

search_replace_check \
  bandaid_build/nano/core_test/block.cpp \
  "E89208DD038FBB269987689621D52292AE9C35941A7484756ECCED92A65093BA" \
  "2514452A978F08D1CF76BB40B6AD064183CF275D3CC5D3E0515DC96E2112AD4E" \
  2
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

search_replace_check \
  bandaid_build/nano/core_test/block.cpp \
  "991CF190094C00F0B68E2E5F75F6BEE95A2E0BD93CEAA4A6734DB9F19B728948" \
  "F61A79F286ABC5CC01D3D09686F0567812B889A5C63ADE0E82DD30F3B2D96463" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

search_replace_check \
  bandaid_build/nano/core_test/block.cpp \
  "bano_1gys8r4crpxhp94n4uho5cshaho81na6454qni5gu9n53gksoyy1wcd4udyb" \
  "ban_1gys8r4crpxhp94n4uho5cshaho81na6454qni5gu9n53gksoyy1wcd4udyb" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

search_replace_check \
  bandaid_build/nano/core_test/block.cpp \
  "nano_1gys8r4crpxhp94n4uho5cshaho81na6454qni5gu9n53gksoyy1wcd4udyb" \
  "ban_1gys8r4crpxhp94n4uho5cshaho81na6454qni5gu9n53gksoyy1wcd4udyb" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

#nano/lib/numbers.cpp
search_replace_check \
  bandaid_build/nano/lib/numbers.cpp \
  "auto error (source_a.size () < 5);" \
  "auto error (source_a.size () < 4);" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

sed -n '1,112p' bandaid_build/nano/lib/numbers.cpp > bandaid_build/nano/lib/numbers.cpp.sed;
# echo '// BEGIN INSERT HERE' >> bandaid_build/nano/lib/numbers.cpp.sed;
sed -n '113,119p' banano_build/nano/lib/numbers.cpp >> bandaid_build/nano/lib/numbers.cpp.sed;
# echo '// END INSERT HERE' >> bandaid_build/nano/lib/numbers.cpp.sed;
sed '1,120d' bandaid_build/nano/lib/numbers.cpp >> bandaid_build/nano/lib/numbers.cpp.sed;
mv bandaid_build/nano/lib/numbers.cpp.sed bandaid_build/nano/lib/numbers.cpp;

search_replace_check \
  bandaid_build/nano/lib/numbers.cpp \
  "debug_assert (difficulty_a > 0);" \
  "debug_assert (difficulty_a >= 0);" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

#nano/node/nodeconfig.hpp
# search_replace_check \
#   bandaid_build/nano/node/nodeconfig.hpp \
#   "8076" \
#   "8076" \
#   1
# EXIT_CODE_1=$?
# if [ $EXIT_CODE_1 -ne 0 ]; then
#     echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
#     exit $EXIT_CODE_1
# fi

search_replace_check \
  bandaid_build/nano/node/nodeconfig.hpp \
  "60000 \* nano::MBAN_ratio" \
  "900 * nano::MBAN_ratio" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

search_replace_check \
  bandaid_build/nano/node/nodeconfig.hpp \
  "60 million nano" \
  "900 million banano" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

search_replace_check \
  bandaid_build/nano/node/nodeconfig.hpp \
  "0.000001 nano" \
  "0.000001 banano" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

search_replace_check \
  bandaid_build/nano/node/nodeconfig.hpp \
  "1000 nano" \
  "1000 banano" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi


#nano/rpc_test/rpc.cpp
search_replace_check \
  bandaid_build/nano/rpc_test/rpc.cpp \
  "ban_to_raw" \
  "nano_to_raw" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi
search_replace_check \
  bandaid_build/nano/rpc_test/rpc.cpp \
  "the nano_ address checksum is wrong" \
  "the ban_ address checksum is wrong" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

#nano/secure/common.cpp
search_replace_check \
  bandaid_build/nano/secure/common.cpp \
  "ban_3t6k35gi95xu6tergt6p69ck76ogmitsa8mnijtpxm9fkcm736xtoncuohr3" \
  "ban_1bananobh5rat99qfgt1ptpieie5swmoth87thi74qgbfrij7dcgjiij94xr" \
  3
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

search_replace_check \
  bandaid_build/nano/secure/common.cpp \
  "E89208DD038FBB269987689621D52292AE9C35941A7484756ECCED92A65093BA" \
  "2514452A978F08D1CF76BB40B6AD064183CF275D3CC5D3E0515DC96E2112AD4E" \
  2
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

search_replace_check \
  bandaid_build/nano/secure/common.cpp \
  "62f05417dd3fb691" \
  "fa055f79fa56abcf" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

search_replace_check \
  bandaid_build/nano/secure/common.cpp \
  "9F0C933C8ADE004D808EA1985FA746A7E95BA2A38F867640F53EC8F180BDFE9E2C1268DEAD7C2664F356E37ABA362BC58E46DBA03E523A7B5A19E4B6EB12BB02" \
  "533DCAB343547B93C4128E779848DEA5877D3278CB5EA948BB3A9AA1AE0DB293DE6D9DA4F69E8D1DDFA385F9B4C5E4F38DFA42C00D7B183560435D07AFA18900" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

sed -i '' 's/[[:space:]]*$//' bandaid_build/nano/secure/common.cpp


#nano/secure/utility.cpp
search_replace_check \
  bandaid_build/nano/secure/utility.cpp \
  "\"Banano\"" \
  "\"BananoData\"" \
  1
EXIT_CODE_1=$?
if [ $EXIT_CODE_1 -ne 0 ]; then
    echo "❌ Call FAILED (Exit Code: $EXIT_CODE_1). Exiting script immediately." >&2
    exit $EXIT_CODE_1
fi

# awk  'NR==34 || NR==37 || NR==40 || NR==43 { sub(":nano", ":banano") }; { print $0 }' bandaid_build/nano/secure/utility.cpp > bandaid_build/nano/secure/utility.cpp.awk
# mv bandaid_build/nano/secure/utility.cpp.awk bandaid_build/nano/secure/utility.cpp;

# awk  'NR==41 { sub("Nano", "BananoData") }; { print $0 }' bandaid_build/nano/secure/utility.cpp > bandaid_build/nano/secure/utility.cpp.awk
# mv bandaid_build/nano/secure/utility.cpp.awk bandaid_build/nano/secure/utility.cpp;


#nano/core_test/difficulty.cpp
awk  'NR==59 { sub("0xffffffc000000000", "0xfffffe0000000000") }; { print $0 }' bandaid_build/nano/core_test/difficulty.cpp > bandaid_build/nano/core_test/difficulty.cpp.awk
mv bandaid_build/nano/core_test/difficulty.cpp.awk bandaid_build/nano/core_test/difficulty.cpp;

awk  'NR==116 { sub("8.", "32") }; { print $0 }' bandaid_build/nano/core_test/difficulty.cpp > bandaid_build/nano/core_test/difficulty.cpp.awk
mv bandaid_build/nano/core_test/difficulty.cpp.awk bandaid_build/nano/core_test/difficulty.cpp;

#nano/core_test/message.cpp
awk  'NR==75 { sub("0x52", "0x42") }; { print $0 }' bandaid_build/nano/core_test/message.cpp > bandaid_build/nano/core_test/message.cpp.awk
mv bandaid_build/nano/core_test/message.cpp.awk bandaid_build/nano/core_test/message.cpp;

#nano/core_test/toml.cpp
awk  'NR==380 || NR=384 { sub("7075", "7071") }; { print $0 }' bandaid_build/nano/core_test/toml.cpp > bandaid_build/nano/core_test/toml.cpp.awk
mv bandaid_build/nano/core_test/toml.cpp.awk bandaid_build/nano/core_test/toml.cpp;

awk  'NR==474 { sub("nano_3arg3asgtigae3xckabaaewkx3bzsh7nwz7jkmjos79ihyaxwphhm6qgjps4", "bano_3arg3asgtigae3xckabaaewkx3bzsh7nwz7jkmjos79ihyaxwphhm6qgjps4") }; { print $0 }' bandaid_build/nano/core_test/toml.cpp > bandaid_build/nano/core_test/toml.cpp.awk
mv bandaid_build/nano/core_test/toml.cpp.awk bandaid_build/nano/core_test/toml.cpp;

#nano/core_test/wallet.cpp
awk  'NR==346 { sub("65", "64") }; { print $0 }' bandaid_build/nano/core_test/wallet.cpp > bandaid_build/nano/core_test/wallet.cpp.awk
mv bandaid_build/nano/core_test/wallet.cpp.awk bandaid_build/nano/core_test/wallet.cpp;

awk  'NR==345 || NR==362 { sub("\047x\047", "\047b\047") }; { print $0 }' bandaid_build/nano/core_test/wallet.cpp > bandaid_build/nano/core_test/wallet.cpp.awk
mv bandaid_build/nano/core_test/wallet.cpp.awk bandaid_build/nano/core_test/wallet.cpp;

#nano/lib/CMakeLists.txt
awk 'NR==35 { print "  convert.cpp\n  convert.hpp" }; { print $0 }' bandaid_build/nano/lib/CMakeLists.txt > bandaid_build/nano/lib/CMakeLists.txt.awk
mv bandaid_build/nano/lib/CMakeLists.txt.awk bandaid_build/nano/lib/CMakeLists.txt;

awk 'NR==134 { print "include_directories(" }; { print $0 }' bandaid_build/nano/lib/CMakeLists.txt > bandaid_build/nano/lib/CMakeLists.txt.awk
mv bandaid_build/nano/lib/CMakeLists.txt.awk bandaid_build/nano/lib/CMakeLists.txt;

awk 'NR==135 { print "  ${CMAKE_SOURCE_DIR}/submodules/magic_enum/include/magic_enum)" }; { print $0 }' bandaid_build/nano/lib/CMakeLists.txt > bandaid_build/nano/lib/CMakeLists.txt.awk
mv bandaid_build/nano/lib/CMakeLists.txt.awk bandaid_build/nano/lib/CMakeLists.txt;

awk 'NR==136 { print "include_directories(${CMAKE_SOURCE_DIR}/submodules/magic_enum/include)" }; { print $0 }' bandaid_build/nano/lib/CMakeLists.txt > bandaid_build/nano/lib/CMakeLists.txt.awk
mv bandaid_build/nano/lib/CMakeLists.txt.awk bandaid_build/nano/lib/CMakeLists.txt;

#nano/lib/blocks.cpp
awk 'NR==5 { print "#include <nano/lib/convert.hpp>" }; { print $0 }' bandaid_build/nano/lib/blocks.cpp > bandaid_build/nano/lib/blocks.cpp.awk
mv bandaid_build/nano/lib/blocks.cpp.awk bandaid_build/nano/lib/blocks.cpp;

awk 'NR== 479 || NR== 1416 { print "\ttree.put (\"balance_decimal\", convert_raw_to_dec (hashables.balance.to_string_dec ()));" }; { print $0 }' bandaid_build/nano/lib/blocks.cpp > bandaid_build/nano/lib/blocks.cpp.awk
mv bandaid_build/nano/lib/blocks.cpp.awk bandaid_build/nano/lib/blocks.cpp;

#nano/lib/config.hpp
awk  'NR==199 { sub("1000), // 0.1%", "2000), // 0.2%") }; { print $0 }' bandaid_build/nano/lib/config.hpp > bandaid_build/nano/lib/config.hpp.awk
mv bandaid_build/nano/lib/config.hpp.awk bandaid_build/nano/lib/config.hpp;

#nano/lib/constants.cpp
awk  'NR==39 { sub("0xffffffc000000000", "0xfffffe0000000000") }; { print $0 }' bandaid_build/nano/lib/constants.cpp > bandaid_build/nano/lib/constants.cpp.awk
mv bandaid_build/nano/lib/constants.cpp.awk bandaid_build/nano/lib/constants.cpp;

awk  'NR==40 { sub("0xfffffff800000000, // 8x higher than epoch_1", "0xfffffff000000000, // 32x higher than originally") }; { print $0 }' bandaid_build/nano/lib/constants.cpp > bandaid_build/nano/lib/constants.cpp.awk
mv bandaid_build/nano/lib/constants.cpp.awk bandaid_build/nano/lib/constants.cpp;

awk  'NR==41 { sub("0xfffffe0000000000 // 8x lower than epoch_1", "0x0000000000000000 // remove receive work requirements") }; { print $0 }' bandaid_build/nano/lib/constants.cpp > bandaid_build/nano/lib/constants.cpp.awk
mv bandaid_build/nano/lib/constants.cpp.awk bandaid_build/nano/lib/constants.cpp;

#nano/lib/constants.hpp
awk  'NR==18 { sub("0x5241", "0x4241") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

awk  'NR==20 { sub("0x5242", "0x4242") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

awk  'NR==22 { sub("0x5243", "0x4258") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

awk  'NR==24 { sub("0x5258", "0x4243") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

awk  'NR==18 || NR==20 || NR==22 || NR==24 { sub("R", "B") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

awk  'NR==22 { sub("C", "X") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

awk  'NR==24 { sub("X", "C") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

awk  'NR==102 { sub("7075", "7071") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

awk  'NR==103 { sub("7076", "7072") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

awk  'NR==104 { sub("7077", "7073") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

awk  'NR==105 { sub("7078", "7074") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

awk  'NR==285 || NR==288 { sub("14", "12") }; { print $0 }' bandaid_build/nano/lib/constants.hpp > bandaid_build/nano/lib/constants.hpp.awk
mv bandaid_build/nano/lib/constants.hpp.awk bandaid_build/nano/lib/constants.hpp;

#nano/lib/numbers.hpp
sed -n '1,22p' bandaid_build/nano/lib/numbers.hpp > bandaid_build/nano/lib/numbers.hpp.sed;
# echo '// INSERT HERE' >> bandaid_build/nano/lib/numbers.hpp.sed;
sed -n '23,26p' banano_build/nano/lib/numbers.hpp >> bandaid_build/nano/lib/numbers.hpp.sed;
sed '1,25d' bandaid_build/nano/lib/numbers.hpp >> bandaid_build/nano/lib/numbers.hpp.sed;
mv bandaid_build/nano/lib/numbers.hpp.sed bandaid_build/nano/lib/numbers.hpp;

#nano/nano_node/CMakeLists.txt
awk  'NR==9 { sub(" -DGIT_COMMIT_HASH", "-DGIT_COMMIT_HASH") }; { print $0 }' bandaid_build/nano/nano_node/CMakeLists.txt > bandaid_build/nano/nano_node/CMakeLists.txt.awk
mv bandaid_build/nano/nano_node/CMakeLists.txt.awk bandaid_build/nano/nano_node/CMakeLists.txt;

awk  'NR==13 { sub(" \"-DQT_NO_KEYWORDS", "\"-DQT_NO_KEYWORDS") }; { print $0 }' bandaid_build/nano/nano_node/CMakeLists.txt > bandaid_build/nano/nano_node/CMakeLists.txt.awk
mv bandaid_build/nano/nano_node/CMakeLists.txt.awk bandaid_build/nano/nano_node/CMakeLists.txt;

#nano/node/network.cpp
awk  'NR==1006 || NR==1008 || NR==1010 || NR==1012 { sub(":nano", ":banano") }; { print $0 }' bandaid_build/nano/node/network.cpp > bandaid_build/nano/node/network.cpp.awk
mv bandaid_build/nano/node/network.cpp.awk bandaid_build/nano/node/network.cpp;

#nano/node/node.cpp
awk  'NR==399 { sub("XRB", "BAN") }; { print $0 }' bandaid_build/nano/node/node.cpp > bandaid_build/nano/node/node.cpp.awk
mv bandaid_build/nano/node/node.cpp.awk bandaid_build/nano/node/node.cpp;


#nano/node/nodeconfig.cpp
awk  'NR==20 { sub("peering.nano.org", "livenet.banano.cc") }; { print $0 }' bandaid_build/nano/node/nodeconfig.cpp > bandaid_build/nano/node/nodeconfig.cpp.awk
mv bandaid_build/nano/node/nodeconfig.cpp.awk bandaid_build/nano/node/nodeconfig.cpp;

awk  'NR==21 { sub("peering-beta.nano.org", "livenet-beta.banano.cc") }; { print $0 }' bandaid_build/nano/node/nodeconfig.cpp > bandaid_build/nano/node/nodeconfig.cpp.awk
mv bandaid_build/nano/node/nodeconfig.cpp.awk bandaid_build/nano/node/nodeconfig.cpp;

awk  'NR==58 || NR==62 || NR==70 { sub(":nano", ":banano") }; { print $0 }' bandaid_build/nano/node/nodeconfig.cpp > bandaid_build/nano/node/nodeconfig.cpp.awk
mv bandaid_build/nano/node/nodeconfig.cpp.awk bandaid_build/nano/node/nodeconfig.cpp;

awk  'NR==66 { sub("nano", "bano") }; { print $0 }' bandaid_build/nano/node/nodeconfig.cpp > bandaid_build/nano/node/nodeconfig.cpp.awk
mv bandaid_build/nano/node/nodeconfig.cpp.awk bandaid_build/nano/node/nodeconfig.cpp;

# put preconfigured_representatives in banana into bandaid
sed -n '1,71p' bandaid_build/nano/node/nodeconfig.cpp > bandaid_build/nano/node/nodeconfig.cpp.sed;
  # echo '// INSERT HERE' >> bandaid_build/nano/node/nodeconfig.cpp.sed;
sed -n '72,80p' banano_build/nano/node/nodeconfig.cpp >> bandaid_build/nano/node/nodeconfig.cpp.sed;
sed '1,79d' bandaid_build/nano/node/nodeconfig.cpp >> bandaid_build/nano/node/nodeconfig.cpp.sed;
mv bandaid_build/nano/node/nodeconfig.cpp.sed bandaid_build/nano/node/nodeconfig.cpp;

awk  'NR==82 { sub(":nano", ":banano") }; { print $0 }' bandaid_build/nano/node/nodeconfig.cpp > bandaid_build/nano/node/nodeconfig.cpp.awk
mv bandaid_build/nano/node/nodeconfig.cpp.awk bandaid_build/nano/node/nodeconfig.cpp;

#nano/node/websocket.cpp
awk  'NR==6 { print "#include <nano/lib/convert.hpp>" }; { print $0 }' bandaid_build/nano/node/websocket.cpp > bandaid_build/nano/node/websocket.cpp.awk
mv bandaid_build/nano/node/websocket.cpp.awk bandaid_build/nano/node/websocket.cpp;

awk  'NR==753 { print "\tmessage_node_l.add (\"amount_decimal\", convert_raw_to_dec (amount.to_string_dec ()));" }; { print $0 }' bandaid_build/nano/node/websocket.cpp > bandaid_build/nano/node/websocket.cpp.awk
mv bandaid_build/nano/node/websocket.cpp.awk bandaid_build/nano/node/websocket.cpp;

awk  'NR==779 { print "\t\telection_node_l.add (\"tally_decimal\", convert_raw_to_dec (election_status.tally.to_string_dec ()));" }; { print $0 }' bandaid_build/nano/node/websocket.cpp > bandaid_build/nano/node/websocket.cpp.awk
mv bandaid_build/nano/node/websocket.cpp.awk bandaid_build/nano/node/websocket.cpp;

awk  'NR==794 { print "\t\t\t\tentry.put (\"weight_decimal\", convert_raw_to_dec (vote_l.weight.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/websocket.cpp > bandaid_build/nano/node/websocket.cpp.awk
mv bandaid_build/nano/node/websocket.cpp.awk bandaid_build/nano/node/websocket.cpp;

#nano/slow_test/flamegraph.cpp
awk  'NR==46 || NR==86 { sub("xrb_ratio", "raw_ratio") }; { print $0 }' bandaid_build/nano/slow_test/flamegraph.cpp > bandaid_build/nano/slow_test/flamegraph.cpp.awk
mv bandaid_build/nano/slow_test/flamegraph.cpp.awk bandaid_build/nano/slow_test/flamegraph.cpp;

#nano/node/cli.cpp
sed -n '1,7p' bandaid_build/nano/node/cli.cpp > bandaid_build/nano/node/cli.cpp.sed;
# echo '// INSERT HERE' >> bandaid_build/nano/node/cli.cpp.sed
sed -n '8,8p' banano_build/nano/node/cli.cpp >> bandaid_build/nano/node/cli.cpp.sed;
sed '1,8d' bandaid_build/nano/node/cli.cpp >> bandaid_build/nano/node/cli.cpp.sed;
mv bandaid_build/nano/node/cli.cpp.sed bandaid_build/nano/node/cli.cpp;

awk 'NR==74 { print "\t(\"timestamps_import\", \"Imports a CSV file, overwriting the timestamps recorded in the database (warning: high resource usage).\")" }; { print $0 }' bandaid_build/nano/node/cli.cpp > bandaid_build/nano/node/cli.cpp.awk
mv bandaid_build/nano/node/cli.cpp.awk bandaid_build/nano/node/cli.cpp;

awk 'NR==75 { print "\t(\"timestamps_export\", \"Writes a CSV file with the local timestamp recorded for each hash with timestamp in the database.\")" }; { print $0 }' bandaid_build/nano/node/cli.cpp > bandaid_build/nano/node/cli.cpp.awk;
mv bandaid_build/nano/node/cli.cpp.awk bandaid_build/nano/node/cli.cpp;

awk 'NR==76 { print "\t(\"timestamps_update_frontiers\", \"Updates the \047modified\047 timestamp of each account chain with the stamps of each frontier\")" }; { print $0 }' bandaid_build/nano/node/cli.cpp > bandaid_build/nano/node/cli.cpp.awk;
mv bandaid_build/nano/node/cli.cpp.awk bandaid_build/nano/node/cli.cpp;

  ## start_timestamp and end_timestamp
  # copy lines from bandaid_build, (nano with edits)
sed -n '1,85p' bandaid_build/nano/node/cli.cpp > bandaid_build/nano/node/cli.cpp.sed;
  # copy lines from banano_build, (banano with no edits)
sed -n '86,89p' banano_build/nano/node/cli.cpp >> bandaid_build/nano/node/cli.cpp.sed;

  # copy lines from bandaid_build, (nano with edits)
sed -n '87,103p' bandaid_build/nano/node/cli.cpp >> bandaid_build/nano/node/cli.cpp.sed;

  # copy lines from banano_build, (banano with no edits)
# sed -n '107,109p' banano_build/nano/node/cli.cpp >> bandaid_build/nano/node/cli.cpp.sed;

  # copy lines from bandaid_build, (nano with edits)
sed -n '104,1297p' bandaid_build/nano/node/cli.cpp >> bandaid_build/nano/node/cli.cpp.sed;

  # copy lines from banano_build, (banano with no edits)
sed -n '1301,1558p' banano_build/nano/node/cli.cpp >> bandaid_build/nano/node/cli.cpp.sed;

sed -n '1559,1599p' banano_build/nano/node/cli.cpp >> bandaid_build/nano/node/cli.cpp.sed;

mv bandaid_build/nano/node/cli.cpp.sed bandaid_build/nano/node/cli.cpp;

  #copy to the end, delete the top lines.
cp banano_build/nano/node/cli.cpp bandaid_build/nano/node/cli.cpp.sed;
sed '1,1599d' bandaid_build/nano/node/cli.cpp >> bandaid_build/nano/node/cli.cpp.sed;
mv bandaid_build/nano/node/cli.cpp.sed bandaid_build/nano/node/cli.cpp;

#nano/node/election.cpp
awk 'NR==196 { sub("node.network_params.network.is_dev_network \\(\\) \\? 500 : ","") }; { print $0 }' bandaid_build/nano/node/election.cpp > bandaid_build/nano/node/election.cpp.awk
mv bandaid_build/nano/node/election.cpp.awk bandaid_build/nano/node/election.cpp;

#nano/node/json_handler.hpp
awk  'NR==70 { print "\tvoid delegators_decimal ();" }; { print $0 }' bandaid_build/nano/node/json_handler.hpp > bandaid_build/nano/node/json_handler.hpp.awk
mv bandaid_build/nano/node/json_handler.hpp.awk bandaid_build/nano/node/json_handler.hpp;

awk  'NR==77 || NR==78 { sub("Mxrb_ratio", "BAN_ratio") }; { print $0 }' bandaid_build/nano/node/json_handler.hpp > bandaid_build/nano/node/json_handler.hpp.awk
mv bandaid_build/nano/node/json_handler.hpp.awk bandaid_build/nano/node/json_handler.hpp;

awk  'NR==86 { print "\tvoid mnano_to_raw (nano::uint128_t = nano::BAN_ratio);" }; { print $0 }' bandaid_build/nano/node/json_handler.hpp > bandaid_build/nano/node/json_handler.hpp.awk
mv bandaid_build/nano/node/json_handler.hpp.awk bandaid_build/nano/node/json_handler.hpp;

awk  'NR==87 { print "\tvoid mnano_from_raw (nano::uint128_t = nano::BAN_ratio);" }; { print $0 }' bandaid_build/nano/node/json_handler.hpp > bandaid_build/nano/node/json_handler.hpp.awk
mv bandaid_build/nano/node/json_handler.hpp.awk bandaid_build/nano/node/json_handler.hpp;

awk  'NR==99 { print "\tvoid raw_to_dec ();" }; { print $0 }' bandaid_build/nano/node/json_handler.hpp > bandaid_build/nano/node/json_handler.hpp.awk
mv bandaid_build/nano/node/json_handler.hpp.awk bandaid_build/nano/node/json_handler.hpp;

awk  'NR==104 { print "\tvoid representatives_decimal_millions ();" }; { print $0 }' bandaid_build/nano/node/json_handler.hpp > bandaid_build/nano/node/json_handler.hpp.awk
mv bandaid_build/nano/node/json_handler.hpp.awk bandaid_build/nano/node/json_handler.hpp;

# nano/node/json_handler.cpp
awk  'NR==4 { print "#include <nano/lib/convert.hpp>" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

sed -n '1,114p' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.sed;
sed -n '115,139p' banano_build/nano/node/json_handler.cpp >> bandaid_build/nano/node/json_handler.cpp.sed;
sed '1,115d' bandaid_build/nano/node/json_handler.cpp >> bandaid_build/nano/node/json_handler.cpp.sed;
mv bandaid_build/nano/node/json_handler.cpp.sed bandaid_build/nano/node/json_handler.cpp;


sed -n '1,146p' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.sed;
sed -n '147,159p' banano_build/nano/node/json_handler.cpp >> bandaid_build/nano/node/json_handler.cpp.sed;
sed '1,147d' bandaid_build/nano/node/json_handler.cpp >> bandaid_build/nano/node/json_handler.cpp.sed;
mv bandaid_build/nano/node/json_handler.cpp.sed bandaid_build/nano/node/json_handler.cpp;

awk  'NR==560 { print "\t\tresponse_l.put (\"balance_decimal\", convert_raw_to_dec (balance.first.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==562 { print "\t\tresponse_l.put (\"pending_decimal\", convert_raw_to_dec (balance.second.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==564 { print "\t\tresponse_l.put (\"receivable_decimal\", convert_raw_to_dec (balance.second.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==664 { print "\t\t\tresponse_l.put (\"balance_decimal\", convert_raw_to_dec (balance));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==680 { print "\t\t\t\tresponse_l.put (\"confirmed_balance_decimal\", convert_raw_to_dec (confirmed_balance));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==727 { print "\t\t\t\tresponse_l.put (\"weight_decimal\", convert_raw_to_dec (account_weight.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==728 { print "\t\t\t\tresponse_l.put (\"weight_decimal_millions\", convert_raw_to_dec (account_weight.convert_to<std::string> (), nano::MBAN_ratio));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==734 { print "\t\t\t\tresponse_l.put (\"pending_decimal\", convert_raw_to_dec (account_receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==736 { print "\t\t\t\tresponse_l.put (\"receivable_decimal\", convert_raw_to_dec (account_receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==743 { print "\t\t\t\t\tresponse_l.put (\"confirmed_pending_decimal\", convert_raw_to_dec (account_receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==926 { print "\t\tresponse_l.put (\"weight_decimal\", convert_raw_to_dec (balance.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==945 { print "\t\t\tentry.put (\"balance_decimal\", convert_raw_to_dec (balance.first.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==947 { print "\t\t\tentry.put (\"balance_decimal\", convert_raw_to_dec (balance.second.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==949 { print "\t\t\tentry.put (\"receivable_decimal\", convert_raw_to_dec (balance.second.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==1104 { print "\t\t\t\t\t\t\t\tpending_tree.put (\"amount_decimal\", convert_raw_to_dec (info.amount.number ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==1207 { print "\t\t\t\tresponse_l.put (\"amount_decimal\", convert_raw_to_dec (amount.value ().number ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==1211 { print "\t\t\tresponse_l.put (\"balance_decimal\", convert_raw_to_dec (balance.number ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==1379 { print "\t\t\t\t\t\tentry.put (\"amount_decimal\", convert_raw_to_dec (amount.value ().number ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==1383 { print "\t\t\t\t\tentry.put (\"balance_decimal\", convert_raw_to_dec (balance.number ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2130 { print "\t\t\t\telection.put (\"tally_decimal\", convert_raw_to_dec (status.tally.to_string_dec ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2172 { print "\t\t\t\tentry.put (\"tally_decimal\", convert_raw_to_dec (tally.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2223 { print "\t\t\tresponse_l.put (\"total_tally_decimal\", convert_raw_to_dec (total.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2225 { print "\t\t\t// response_l.put (\"final_tally_decimal\", info.status.final_tally.to_string_dec ());" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2243 { print "\tresponse_l.put (\"quorum_delta_decimal\", convert_raw_to_dec (node.online_reps.delta ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2246 { print "\tresponse_l.put (\"online_weight_minimum_decimal\", convert_raw_to_dec (node.config.online_weight_minimum.to_string_dec ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2248 { print "\tresponse_l.put (\"online_stake_total_decimal\", convert_raw_to_dec (node.online_reps.online ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2250 { print "\tresponse_l.put (\"trended_stake_total_decimal\", convert_raw_to_dec (node.online_reps.trended ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2252 { print "\tresponse_l.put (\"peers_stake_total_decimal\", convert_raw_to_dec (node.rep_crawler.total_weight ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

  # copy delegators_decimal function, by snipping it out of the banana code and putting it into he bandaid code
  # since it's created only for banano.
sed -n '1,2348p' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.sed;
  # echo '// INSERT HERE' >> bandaid_build/nano/node/json_handler.cpp.sed;
sed -n '2349,2385p' banano_build/nano/node/json_handler.cpp >> bandaid_build/nano/node/json_handler.cpp.sed;
sed '1,2347d' bandaid_build/nano/node/json_handler.cpp >> bandaid_build/nano/node/json_handler.cpp.sed;
mv bandaid_build/nano/node/json_handler.cpp.sed bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2549 { print "\t\t\ttree.put (\"amount_decimal\", convert_raw_to_dec (amount.value ().number ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2555 { print "\t\t\ttree.put (\"balance_decimal\", convert_raw_to_dec (block_a.hashables.balance.to_string_dec ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2571 { print "\t\t\ttree.put (\"amount_decimal\", convert_raw_to_dec (amount.value ().number ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2605 { print "\t\t\t\ttree.put (\"amount_decimal\", convert_raw_to_dec (amount.value ().number ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2612 { print "\t\t\ttree.put (\"amount_decimal\", convert_raw_to_dec (nano::dev::constants.genesis_amount.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2632 { print "\t\t\ttree.put (\"balance_decimal\", convert_raw_to_dec (block_a.hashables.balance.to_string_dec ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2667 { print "\t\t\ttree.put (\"amount_decimal\", convert_raw_to_dec ((previous_balance.number () - balance).convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2707 { print "\t\t\t\ttree.put (\"amount_decimal\", convert_raw_to_dec ((balance - previous_balance.number ()).convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2944 { print "\t\t\t\t\t\tresponse_a.put (\"pending_decimal\", convert_raw_to_dec (account_receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2946 { print "\t\t\t\t\t\tresponse_a.put (\"receivable_decimal\", convert_raw_to_dec (account_receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2953 { print "\t\t\t\t\tresponse_a.put (\"balance_decimal\", convert_raw_to_dec (balance));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==2964 { print "\t\t\t\t\t\tresponse_a.put (\"weight_decimal\", convert_raw_to_dec (account_weight.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==3000 { print "\t\t\t\t\t\tresponse_a.put (\"pending_decimal\", convert_raw_to_dec (account_receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==3002 { print "\t\t\t\t\t\tresponse_a.put (\"receivable_decimal\", convert_raw_to_dec (account_receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==3009 { print "\t\t\t\t\tresponse_a.put (\"balance_decimal\", convert_raw_to_dec (balance));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==3020 { print "\t\t\t\t\t\tresponse_a.put (\"weight_decimal\", convert_raw_to_dec (account_weight.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==3236 { print "\t\t\t\t\t\t\tpending_tree.put (\"amount_decimal\", convert_raw_to_dec (info.amount.number ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==3746 { print "\t\t\t\tweight_node.put (\"weight_decimal\", convert_raw_to_dec (account_weight.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==4454 { sub("Nano", "Banano") }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==4583 { print "\t\tresponse_l.put (\"balance_decimal\", convert_raw_to_dec (balance.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==4585 { print "\t\tresponse_l.put (\"pending_decimal\", convert_raw_to_dec (receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==4587 { print "\t\tresponse_l.put (\"receivable_decimal\", convert_raw_to_dec (receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==4617 { print "\t\t\t\tentry.put (\"balance_decimal\", convert_raw_to_dec (balance.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==4619 { print "\t\t\t\tentry.put (\"pending_decimal\", convert_raw_to_dec (receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  ' NR==4621 { print "\t\t\t\tentry.put (\"receivable_decimal\", convert_raw_to_dec (receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==4881 { print "\t\t\t\t\tentry.put (\"balance_decimal\", convert_raw_to_dec (balance));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==4892 { print "\t\t\t\t\t\tentry.put (\"weight_decimal\", convert_raw_to_dec (account_weight.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==4898 { print "\t\t\t\t\t\tentry.put (\"pending_decimal\", convert_raw_to_dec (account_receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==4900 { print "\t\t\t\t\t\tentry.put (\"receivable_decimal\", convert_raw_to_dec (account_receivable.convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==4970 { print "\t\t\t\t\t\t\t\tpending_tree.put (\"amount_decimal\", convert_raw_to_dec (info.amount.number ().convert_to<std::string> ()));" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

awk  'NR==5504 { print "\tno_arg_funcs.emplace (\"raw_to_dec\", &nano::json_handler::raw_to_dec);" }; { print $0 }' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.awk
mv bandaid_build/nano/node/json_handler.cpp.awk bandaid_build/nano/node/json_handler.cpp;

# copy representatives_decimal_millions from banano to bandaid
sed -n '1,5409p' bandaid_build/nano/node/json_handler.cpp > bandaid_build/nano/node/json_handler.cpp.sed;
  # echo '// INSERT HERE' >> bandaid_build/nano/node/json_handler.cpp.sed;
sed -n '5410,5495p' banano_build/nano/node/json_handler.cpp >> bandaid_build/nano/node/json_handler.cpp.sed;
sed '1,5409d' bandaid_build/nano/node/json_handler.cpp >> bandaid_build/nano/node/json_handler.cpp.sed;
mv bandaid_build/nano/node/json_handler.cpp.sed bandaid_build/nano/node/json_handler.cpp;

# git checkpoint
cd bandaid_build;
git add .;
git commit -m "essential changes";
cd ..;
# git checkpoint
