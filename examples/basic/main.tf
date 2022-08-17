module "cognito_basic" {
  source = "../../"

  name      = "aweasome"
  stage     = "production"
  namespace = "rlw"
}
