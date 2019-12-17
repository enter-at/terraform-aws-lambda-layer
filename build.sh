#!/usr/bin/env bash

set -e
set -o pipefail
set -o xtrace

parse_environment_variables() {
  DIST_DIR="${DIST_DIR:?'DIST_DIR variable missing.'}"
}

clean() {
  rm -rf "$DIST_DIR"
}

install_dependencies() {
  case $PACKAGE_FILE in

  *package.json)
    install_npm_dependencies
    ;;

  *requirements.txt)
    install_pip_dependencies
    ;;

  *Pipfile)
    install_pipenv_dependencies
    ;;

  *)
    build_from_source_dir
    ;;
  esac
}

install_npm_dependencies() {
  local dist_dir="$DIST_DIR/nodejs"
  local dist_package_file="$dist_dir/package.json"
  mkdir -p "$dist_dir"

  cp "$PACKAGE_FILE" "$dist_package_file"
  npm install --production --no-optional --no-package-lock --prefix "$dist_dir/"
}

install_pipenv_dependencies() {
  local dist_dir="$DIST_DIR/python"
  local dist_requirements_file="$dist_dir/requirement.txt"
  mkdir -p "$dist_dir"

  pipenv lock --requirements >"$dist_requirements_file"
  pip install --target "$dist_dir" --requirement="$dist_requirements_file"
}

install_pip_dependencies() {
  local dist_dir="$DIST_DIR/python"
  mkdir -p "$dist_dir"

  pip install --target "$dist_dir" --requirement="$PACKAGE_FILE"
}

build_from_source_dir() {
  SOURCE_DIR="${SOURCE_DIR:?'SOURCE_DIR variable missing.'}"
  SOURCE_TYPE="${SOURCE_TYPE:?'SOURCE_TYPE variable missing.'}"

  local dist_dir="$DIST_DIR/${SOURCE_TYPE}"
  mkdir -p "$dist_dir"

  pushd "${SOURCE_DIR}" >/dev/null || exit
  # shellcheck disable=SC2046
  rsync -Ravz $(eval echo "$RSYNC_PATTERN") --exclude="*.*" "." "$dist_dir"
  popd >/dev/null || exit
}

parse_environment_variables
clean
install_dependencies
