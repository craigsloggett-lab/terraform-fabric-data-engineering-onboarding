#!/bin/sh

main() {
  set -euf

  # Ensure required environment variables have been set.
  : "${GITHUB_TOKEN:?"<-- this required environment variable is not set."}"
  : "${GITHUB_REPOSITORY_OWNER:?"<-- this required environment variable is not set."}"
  : "${GITHUB_REPOSITORY_NAME:?"<-- this required environment variable is not set."}"
  : "${FABRIC_WORKSPACE_DISPLAY_NAME:?"<-- this required environment variable is not set."}"

  accept_header="Accept: application/vnd.github+json"
  authorization_header="Authorization: Bearer ${GITHUB_TOKEN}"
  api_version_header="X-GitHub-Api-Version: 2022-11-28"

  # Set the default curl options for all GitHub REST API calls.
  set -- --silent --location
  # Set valid header values for GitHub REST API requests.
  set -- "${@}" -H "${accept_header}" -H "${authorization_header}" -H "${api_version_header}"
  # Set the curl parameters to create or update file contents.
  set -- "${@}" -X PUT
  # Set the body parameters for the API request.
  set -- "${@}" -d '{"message":"Add a Fabric workspace directory","content":""}'

  # GitHub "Contents" API endpoint.
  contents_endpoint="https://api.github.com/repos/${GITHUB_REPOSITORY_OWNER}/${GITHUB_REPOSITORY_NAME}/contents"
  # Path in the GitHub repository to create for a new Fabric workspace.
  repository_path="${FABRIC_WORKSPACE_DISPLAY_NAME}/.platform"

  # Create a new directory in the GitHub repository that will be used by the new Fabric workspace.
  status="$(curl "$@" "${contents_endpoint}/${repository_path}")"

  case "${status}" in
    200 | 201 | 204 | 409)
      return 0
      ;;
    *)
      exit 1
      ;;
  esac
}

main "$@"
