# FixCI Installation Guide

## 🚀 Quick Start (30 seconds)

### Step 1: Install the GitHub App

Click the button below to install FixCI on your repositories:

[![Install FixCI](https://img.shields.io/badge/Install-FixCI-00ff88?style=for-the-badge&logo=github)](https://github.com/apps/fixci-ai/installations/new)

**Or visit:** https://github.com/apps/fixci-ai/installations/new

### Step 2: Select Repositories

Choose which repositories you want FixCI to monitor:
- **All repositories** - FixCI will analyze failures in all current and future repos
- **Only select repositories** - Choose specific repos to monitor

### Step 3: Install

Click **"Install"** and you're done! ✅

---

## ✨ What Happens Next?

1. **Push code or create a PR** in your selected repositories
2. **When a workflow fails**, FixCI automatically analyzes the logs
3. **Get instant answers** via a PR comment explaining:
   - What went wrong
   - Root cause analysis
   - Suggested fixes
   - Code examples (when applicable)

---

## 📋 Requirements

- GitHub account (personal or organization)
- Repository with GitHub Actions enabled
- At least one workflow file (`.github/workflows/*.yml`)

---

## 🎯 Example Workflow

Here's a minimal GitHub Actions workflow that works with FixCI:

```yaml
# .github/workflows/test.yml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run tests
        run: npm test
```

When this workflow fails, FixCI will:
1. Detect the failure
2. Fetch the logs
3. Analyze with AI
4. Post a helpful comment on your PR

---

## 🔧 Troubleshooting

### FixCI isn't commenting on my PRs

**Check these:**
1. Is the workflow associated with a PR? (FixCI only analyzes PR-related failures)
2. Did the workflow actually fail? (FixCI skips successful runs)
3. Does the FixCI app have access to the repository?
   - Visit: https://github.com/apps/fixci-ai
   - Click "Configure"
   - Verify the repo is selected

### How do I add more repositories?

1. Visit: https://github.com/apps/fixci-ai
2. Click **"Configure"**
3. Select additional repositories
4. Click **"Save"**

### How do I uninstall?

1. Visit: https://github.com/apps/fixci-ai
2. Click **"Configure"**
3. Scroll to the bottom
4. Click **"Uninstall"**

---

## 🆓 Pricing

FixCI is **100% free** during beta with:
- Unlimited repositories
- Unlimited analyses
- All features included

---

## 📚 Learn More

- **Website:** https://fixci.dev
- **GitHub App:** https://github.com/apps/fixci-ai
- **Support:** Open an issue or contact support@fixci.dev

---

## 🎥 Video Tutorial

*Coming soon*

---

**Questions?** Feel free to open an issue or reach out to support@fixci.dev
