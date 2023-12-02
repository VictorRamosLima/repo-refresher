#!/bin/bash

# Function to display help message
function display_help() {
  echo "Usage: $(basename $0) [options] [directories...]"
  echo ""
  echo "Options:"
  echo "  -h, --help           Display this help message and exit."
  echo "  --exclude DIRS       Comma-separated list of directories to exclude from update."
  echo ""
  echo "Description:"
  echo "  This script updates Git repositories in the specified directories."
  echo "  If no directories are specified, it updates all repositories in the current directory."
  echo "  If the current directory is a Git repository, it updates only this repository and then exits."
  echo "  Directories to be excluded can be specified with the --exclude option."
  echo ""
  echo "Examples:"
  echo "  $(basename $0)                         # Update the current repository or all repositories in the current directory"
  echo "  $(basename $0) repo1 repo2             # Update repositories in 'repo1' and 'repo2' directories"
  echo "  $(basename $0) --exclude repo3,repo4   # Update all repositories except those in 'repo3' and 'repo4'"
  exit 0
}

# Process command line arguments for help option
for arg in "$@"; do
  case $arg in
    -h | --help)
      display_help
      ;;
  esac
done

# Function to check if Git is installed
function check_git_installed() {
  if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed. Please install Git to use this script."
    exit 1
  fi
}

# Check if Git is installed
check_git_installed

# Store the current directory
current_dir=$(pwd)

# Check if the current directory is a Git repository
if [ -d "$current_dir/.git" ]; then
  echo "Updating the current repository..."
  git pull --all --autostash
  echo "Git pull completed for the current repository."
  exit 0
fi

# Initialize the arrays for include and exclude directories
include_dirs=()
exclude_dirs=()

# Process command line arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
    --exclude)
      IFS=',' read -r -a exclude_dirs <<< "$2"
      shift
      ;;
    *)
      include_dirs+=("$1")
      ;;
  esac
  shift
done

# Function to update Git repositories
function update_git_repo() {
  local dir=$1
  echo "Entering $dir"
  cd "$dir"

  # Check if the directory is a Git repository
  if [ -d .git ]; then
    git pull --all --autostash
  else
    echo "$dir is not a Git repository, skipping."
  fi

  # Go back to the parent directory
  cd "$current_dir"
  echo "--------------------------"
}

# Function to check if a directory is in the exclude list
function is_excluded() {
  local dir=$1
  for excluded_dir in "${exclude_dirs[@]}"; do
    if [[ $dir == $excluded_dir ]]; then
      return 0
    fi
  done
  return 1
}

# Process directories
if [ ${#include_dirs[@]} -eq 0 ]; then
  # No include directories specified, use all directories in current folder
  for dir in */ ; do
    if ! is_excluded "$dir"; then
      update_git_repo "$dir"
    fi
  done
else
  # Process only specified include directories
  for dir in "${include_dirs[@]}"; do
    if ! is_excluded "$dir"; then
      update_git_repo "$dir"
    fi
  done
fi

echo "Git pull completed for all repositories."
