
INSTALL_PREFIX=dist-node

rm -rf $INSTALL_PREFIX


# execute the build script
./dev/em-build.sh


# copy the example files
cp examples/node/*.js $INSTALL_PREFIX

# copy test files
cp test/*.js $INSTALL_PREFIX

# run tests
cd $INSTALL_PREFIX
node test_node.js ../example_files/oscli.xml

ls -l .