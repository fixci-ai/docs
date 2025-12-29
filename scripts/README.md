# FixCI Setup Scripts

## Quick Demo Setup

Automatically create a demo repository with FixCI:

```bash
# Download and run
curl -fsSL https://raw.githubusercontent.com/fixci-ai/docs/master/scripts/setup-demo.sh | bash
```

Or manually:

```bash
# Download
wget https://raw.githubusercontent.com/fixci-ai/docs/master/scripts/setup-demo.sh

# Make executable
chmod +x setup-demo.sh

# Run
./setup-demo.sh
```

## What it does

The script will:
1. Create a new GitHub repository with your chosen name
2. Add a sample GitHub Actions workflow that intentionally fails
3. Include test files that demonstrate FixCI's capabilities
4. Provide next steps for installing FixCI and creating a test PR

## Requirements

- GitHub CLI (`gh`) installed
- Authenticated with GitHub (`gh auth login`)

---

**Questions?** Visit https://fixci.dev or email support@fixci.dev
