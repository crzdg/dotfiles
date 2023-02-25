SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="🏃 " 
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_VENV_SYMBOL="🐍 "
SPACESHIP_EXIT_CODE_SHOW=false
SPACESHIP_USER_SUFFIX="[💫🐶] "
SPACESHIP_ASYNC_SHOW=false
SPACESHIP_PROMPT_PREFIXES_SHOW=false

# Right prompt order
SPACESHIP_RPROMPT_ORDER=(
    # exit_code
    # exec_time
    )
SPACESHIP_PROMPT_ORDER=(
  # time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  # gradle        # Gradle section
  # maven         # Maven section
  node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  golang        # Go section
  # php           # PHP section
  rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  # conda         # conda virtualenv section
  # python         # Python section
  # dotnet        # .NET section
  # kubectl       # Kubectl context section
  # terraform     # Terraform workspace section
  # ibmcloud      # IBM Cloud section
  # exec_time     # Execution time
  line_sep      # Line break
  # battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  host          # Hostname section
  char          # Prompt character
  async       # Async indicators
)
