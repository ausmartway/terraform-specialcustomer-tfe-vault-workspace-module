#TFE workspace and variable
resource "tfe_workspace" "project-workspace" {
  name         = var.tfe-workspace-name
  organization = var.tfe-organization
  vcs_repo  {
   identifier = var.github-repo-fullname
    oauth_token_id = var.oauth-token-id
  }
}

resource "tfe_variable" "project1-workspace-namespace-vault-namespace" {
  workspace_id=tfe_workspace.project-workspace.id
  description="namespace this workspace is bind to"
  category="env"
  key="VAULT_NAMESPACE"
  value=var.vault-namespace
}

resource "tfe_variable" "project-workspace-namespace-vault-token" {
  workspace_id=tfe_workspace.project-workspace.id
  description="The admin VAULT_TOKEN for this namespace"
  category="env"
  key="VAULT_TOKEN"
  value=var.vault-token
  sensitive=true
}

