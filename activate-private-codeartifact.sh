CODEARTIFACT_DOMAIN=your-domain
CODEARTIFACT_DOMAIN_OWNER=123456789012
CODEARTIFACT_REGION=us-east-1
CODEARTIFACT_REPO=your-repo-name

export CODEARTIFACT_AUTH_TOKEN=$(aws codeartifact get-authorization-token \
  --domain "${CODEARTIFACT_DOMAIN}" \
  --domain-owner "${CODEARTIFACT_DOMAIN_OWNER}" \
  --region "${CODEARTIFACT_REGION}" \
  --query authorizationToken \
  --output text)

export PIP_INDEX_URL="https://aws:${CODEARTIFACT_AUTH_TOKEN}@${CODEARTIFACT_DOMAIN}-${CODEARTIFACT_DOMAIN_OWNER}.d.codeartifact.${CODEARTIFACT_REGION}.amazonaws.com/pypi/${CODEARTIFACT_REPO}/simple/"