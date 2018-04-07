#!/usr/bin/env bash

# shellcheck shell=bash

# ``````````````````````````````````````````````````````````````````````````````
# Function name: smb()
#
# Description:
#   SMB Protocol Module.
#
# Usage:
#   smb
#
# Examples:
#   smb
#

function smb() {

  # shellcheck disable=SC2034
  local _FUNCTION_ID="smb"
  local _STATE=0

  # User variables:
  # - module_name: store module name
  # - module_args: store module arguments

  export _module_show=
  export _module_help=
  export _module_opts=
  export _module_commands=

  # shellcheck disable=SC2034
  _module_variables=()

  # shellcheck disable=SC2034
  author="trimstray"
  contact="trimstray@gmail.com"
  version="1.0"
  description="SMB Protocol Module"

  # shellcheck disable=SC2034,SC2154
  _module_cfg="${_modules}/${module_name}.cfg"

  touch "$_module_cfg"

  # shellcheck disable=SC2034,SC2154
  _module_help=$(printf "%s" "
  Module: ${module_name}

    Description
    -----------

      SMB Protocol Module.

    Commands
    --------

      help                            display module help
      show    <key>                   display module or profile info
      config  <key>                   show module configuration
      set     <key>                   set module variable value
      use     <module>                reuse module (changed env)
      pushd   <key>|init|show|flush   command line commands stack
      search  <key>                   search key in all commands
      init    <alias|id>              run profile

      Options:

        <key>                         key value
        <value>                       profile alias or id

")

  # shellcheck disable=SC2154
  if [[ "$_mstate" -eq 0 ]] ; then

    if [[ -e "$_module_cfg" ]] && [[ -s "$_module_cfg" ]] ; then

      # shellcheck disable=SC1090
      source "$_module_cfg"

    else

      # shellcheck disable=SC2034
      _module_variables=()

      if [[ "${#_module_variables[@]}" -ne 0 ]] ; then

        printf "_module_variables=(\"%s\")\n" "${_module_variables[@]}" > "$_module_cfg"

      fi

      _mstate=1

    fi

  else

    # shellcheck disable=SC1090
    source "$_module_cfg"

  fi

  # In the given commands you can use variables from the CLI config
  # command or the etc/main.cfg file.

  # shellcheck disable=SC2034
  _module_commands=(\
  #
  "https://nmap.org/nsedoc/scripts/smb-brute.html;\
  ;smb-brute;--script smb-brute $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-double-pulsar-backdoor.html;\
  ;smb-double-pulsar-backdoor;--script smb-double-pulsar-backdoor $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-enum-domains.html;\
  ;smb-enum-domains;--script smb-enum-domains $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-enum-groups.html;\
  ;smb-enum-groups;--script smb-enum-groups $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-enum-processes.html;\
  ;smb-enum-processes;--script smb-enum-processes $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-enum-services.html;\
  ;smb-enum-services;--script smb-enum-services $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-enum-sessions.html;\
  ;smb-enum-sessions;--script smb-enum-sessions $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-enum-shares.html;\
  ;smb-enum-shares;--script smb-enum-shares $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-enum-users.html;\
  ;smb-enum-users;--script smb-enum-users $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-flood.html;\
  ;smb-flood;--script smb-flood $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-ls.html;\
  ;smb-ls;--script smb-ls $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-mbenum.html;\
  ;smb-mbenum;--script smb-mbenum $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-os-discovery.html;\
  ;smb-os-discovery;--script smb-os-discovery $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-print-text.html;\
  ;smb-print-text;--script smb-print-text $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-protocols.html;\
  ;smb-protocols;--script smb-protocols $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-psexec.html;\
  ;smb-psexec;--script smb-psexec $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-security-mode.html;\
  ;smb-security-mode;--script smb-security-mode $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-server-stats.html;\
  ;smb-server-stats;--script smb-server-stats $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb-system-info.html;\
  ;smb-system-info;--script smb-system-info $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb2-capabilities.html;\
  ;smb2-capabilities;--script smb2-capabilities $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb2-security-mode.html;\
  ;smb2-security-mode;--script smb2-security-mode $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb2-time.html;\
  ;smb2-time;--script smb2-time $params" \
  #
  "https://nmap.org/nsedoc/scripts/smb2-vuln-uptime.html;\
  ;smb2-vuln-uptime;--script smb2-vuln-uptime $params" \
  )

  # shellcheck disable=SC2034,SC2154
  _module_show=(\
      "${module_name}" \
      "${version}" \
      "${#_module_commands[@]}" \
      "${author}" \
      "${contact}" \
      "${description}" \
      )

  # shellcheck disable=SC2034
  export _module_opts=(\
  "$_module_help")

  return $_STATE

}
