#!/bin/bash

# download data sets with the merged FK layout

set -eu
set -o pipefail

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ../data

echo "Downloading scale factor ${SF}"
curl -k --silent --fail https://repository.surfsara.nl/datasets/cwi/lsqb/files/lsqb-merged/social-network-sf${SF}-merged-fk.tar.zst | tar -x --use-compress-program=unzstd

