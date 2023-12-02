# RepoRefresher

## Description

`repo_refresher` is a Bash script designed to streamline the process of updating multiple Git repositories. It's particularly useful for developers or system administrators who work with numerous Git repositories and need an efficient way to ensure all are up-to-date.

The script updates Git repositories in specified directories. If no directories are specified, it updates all repositories in the current directory. Additionally, you can exclude certain directories from being updated. The script also has a special feature: if the current working directory is a Git repository, it updates only this repository and exits.

## Installation

The easiest way to install `repo_refresher` is by using the provided installation script. This script downloads `repo_refresher`, makes it executable, and moves it to `/usr/local/bin` for easy access.

To install, it can be made with `curl` or `wget` so just run one of the following commands in your terminal:

**`curl`**:
```bash
curl -sSL https://raw.githubusercontent.com/VictorRamosLima/repo-refresher/main/install.sh | sudo bash
```

**`wget`**:
```bash
wget -O - https://raw.githubusercontent.com/VictorRamosLima/repo-refresher/main/install.sh | sudo bash
```

## Manual Installation

1. **Download the Script:**
  You can download the script directly from the repository or clone it using Git.
  To clone the repository, use:

  ```bash
  git clone git@github.com:VictorRamosLima/repo-refresher.git
  ```

  Alternatively, download the script directly using `curl` or `wget`:

  Using `curl`:
  ```bash
  curl -o repo_refresher.sh https://raw.githubusercontent.com/VictorRamosLima/repo-refresher/main/script.sh
  ```

  Using `wget`:

  ```bash
  wget https://raw.githubusercontent.com/VictorRamosLima/repo-refresher/main/script.sh -O repo_refresher.sh
  ```


2. **Make the Script Executable:**
  Navigate to the directory containing `repo_refresher.sh` and run:

  ```bash
  chmod +x repo_refresher.sh
  ```

3. **Move the Script to a Directory in Your PATH:**
  If you want to run `repo_refresher.sh` from any directory, move it to a directory in your PATH, like `/usr/local/bin`.

  ```bash
  sudo mv repo_refresher.sh /usr/local/bin/repo_refresher
  ```

## Usage

Run `repo_refresher` in a terminal. Below are some examples of how you can use it:

- **Update All Repositories in the Current Directory:**
  ```bash
  repo_refresher
  ```

- **Update Specific Repositories:**
  ```bash
  repo_refresher repo1 repo2
  ```

- **Exclude Specific Directories:**
  ```bash
  repo_refresher --exclude repo3,repo4
  ```

- **Display Help Information:**
  ```bash
  repo_refresher --help
  ```

## Options
- `-h`, `--help`: Display the help message and exit.
- `--exclude DIRS`: Comma-separated list of directories to exclude from the update.

## Contributing
Contributions to `repo_refresher` are welcome. Please feel free to fork the repository, make changes, and submit pull requests.

## License

This project is licensed under the MIT License.

## Contact

Software Enginner at [Creditas](https://www.creditas.com/)

For any inquiries, suggestions, or contributions, feel free to reach out through the following channels:

- **LinkedIn:** [![Linkedin: VictorRamos](https://img.shields.io/badge/-VictorRamos-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/victor-ramos-de-lima-b7235616b/)](https://www.linkedin.com/in/victor-ramos-de-lima-b7235616b/)
- **Email:**
  - [![Gmail: viictorramosl](https://img.shields.io/badge/-Victor%20via%20Gmail-d14836?style=flat-square&logo=Gmail&logoColor=white&link=mailto:viictorramosl@gmail.com)](mailto:viictorramosl@gmail.com)
  - [![Hotmail: victor_vrl98](https://img.shields.io/badge/-Victor%20via%20Hotmail-0078D4?style=flat-square&logo=MicrosoftOutlook&logoColor=white&link=mailto:victor_vrl98@hotmail.com)](mailto:victor_vrl98@hotmail.com)

Connect with me on LinkedIn or drop an email for a more detailed discussion or collaboration opportunities!
