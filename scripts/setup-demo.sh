#!/bin/bash
# FixCI Quick Setup Script
# This script creates a demo repository with FixCI-ready workflows

set -e

echo "🔧 FixCI Quick Setup"
echo "===================="
echo ""

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed."
    echo "Install it from: https://cli.github.com/"
    exit 1
fi

# Check if user is authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub CLI."
    echo "Run: gh auth login"
    exit 1
fi

# Get repository name
read -p "📦 Repository name (e.g., my-app): " REPO_NAME

if [ -z "$REPO_NAME" ]; then
    echo "❌ Repository name is required"
    exit 1
fi

# Get GitHub username/org
GITHUB_USER=$(gh api user --jq .login)

echo ""
echo "Creating repository: $GITHUB_USER/$REPO_NAME"
echo ""

# Create repository
echo "1️⃣ Creating GitHub repository..."
gh repo create "$REPO_NAME" --public --description "Demo repository with FixCI" --clone || {
    echo "⚠️ Repository might already exist, continuing..."
}

# Navigate to repository
cd "$REPO_NAME" 2>/dev/null || {
    echo "❌ Failed to enter repository directory"
    exit 1
}

# Create a simple workflow that fails
echo "2️⃣ Creating test workflows..."
mkdir -p .github/workflows

cat > .github/workflows/test.yml << 'EOF'
name: Tests

on:
  push:
    branches: [ main, master ]
  pull_request:
    branches: [ main, master ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'

      - name: Install dependencies
        run: npm install

      - name: Run tests
        run: npm test
EOF

# Create package.json with a failing test
cat > package.json << 'EOF'
{
  "name": "fixci-demo",
  "version": "1.0.0",
  "scripts": {
    "test": "node test.js"
  }
}
EOF

# Create a simple test that fails
cat > test.js << 'EOF'
// This test intentionally fails to demonstrate FixCI
console.log('Running tests...');

function divide(a, b) {
  return a / b;
}

// This will cause an error
const result = divide(10, 0);

if (!isFinite(result)) {
  throw new Error('Division by zero detected!');
}

console.log('All tests passed!');
EOF

# Create README
cat > README.md << 'EOF'
# FixCI Demo Repository

This repository demonstrates FixCI's AI-powered CI/CD failure analysis.

## What is FixCI?

FixCI automatically analyzes failed GitHub Actions workflows and posts helpful comments on your pull requests explaining what went wrong and how to fix it.

## Try it yourself

1. Install FixCI: https://github.com/apps/fixci-ai/installations/new
2. Create a pull request in this repository
3. Watch FixCI analyze any failures and post a comment!

## Example Workflow

This repo includes a test workflow that intentionally fails to demonstrate FixCI's capabilities.

When the workflow fails, FixCI will:
- Analyze the error logs
- Identify the root cause
- Suggest fixes
- Post a detailed comment on your PR

---

Powered by [FixCI](https://fixci.dev)
EOF

# Commit and push
echo "3️⃣ Committing files..."
git add .
git commit -m "Initial commit: Setup FixCI demo"

echo "4️⃣ Pushing to GitHub..."
git push -u origin main 2>/dev/null || git push -u origin master

echo ""
echo "✅ Repository created successfully!"
echo ""
echo "📋 Next steps:"
echo ""
echo "1. Install FixCI on this repository:"
echo "   https://github.com/apps/fixci-ai/installations/new"
echo ""
echo "2. Create a pull request:"
echo "   cd $REPO_NAME"
echo "   git checkout -b test-fixci"
echo "   echo '# Test' >> README.md"
echo "   git add README.md"
echo "   git commit -m 'Test FixCI'"
echo "   git push -u origin test-fixci"
echo "   gh pr create --title 'Test FixCI' --body 'Testing FixCI analysis'"
echo ""
echo "3. Watch FixCI analyze the failure and post a comment!"
echo ""
echo "🎉 Happy debugging with FixCI!"
