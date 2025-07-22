#!/bin/bash
sudo e4defrag /
dd if=/dev/zero of=wipefile bs=1M; sync; rm wipefile
sudo vmware-toolbox-cmd disk shrinkonly
