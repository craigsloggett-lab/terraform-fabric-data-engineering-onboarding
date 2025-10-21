locals {
  github_connection_ids = {
    for connection in data.fabric_connections.all.values : connection.id => connection
    if connection.connection_details.type == "GitHubSourceControl"
  }
}
