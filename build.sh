#!/usr/bin/env bash
cd "$(dirname "$0")"

proj="src/TestApp/TestApp.csproj"
rid="osx-x64"
cfg="Release"

run() {
    echo "$(pwd)> $*"
    "$@"
}

run dotnet restore $proj --configuration $cfg --runtime $rid
run dotnet build $proj --configuration $cfg --no-restore --runtime $rid
run dotnet publish $proj --configuration $cfg --no-restore --runtime $rid --self-contained true --output publish/$rid
