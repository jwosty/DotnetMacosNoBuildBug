#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

proj="src/TestApp/TestApp.csproj"
rid="osx-x64"
cfg="Release"

run() {
    echo "$(pwd)> $*"
    "$@"
}

run dotnet restore $proj --runtime $rid
run dotnet build $proj --configuration $cfg --no-restore --runtime $rid --self-contained true
run dotnet publish $proj --configuration $cfg --no-restore --no-build --runtime $rid --self-contained true --output publish/$rid
