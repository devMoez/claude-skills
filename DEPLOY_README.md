# Deploy Skills to GitHub from Ubuntu

This script automates the deployment of skills to GitHub with individual commits.

## Prerequisites

1. **Git configured on Ubuntu** with your verified GitHub email:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your-verified-email@example.com"
   ```

2. **Access to Windows files** from Ubuntu (if using WSL):
   - Windows drives are usually mounted at `/mnt/c/`
   - Path: `/mnt/c/Users/moezf/Desktop/Claude-Skills`

## Quick Start

### Option 1: Using WSL (Windows Subsystem for Linux)

1. **Copy script to Ubuntu:**
   ```bash
   cp /mnt/c/Users/moezf/Desktop/Claude-Skills/deploy-to-github.sh ~/
   cd ~
   chmod +x deploy-to-github.sh
   ```

2. **Run the script:**
   ```bash
   ./deploy-to-github.sh
   ```

### Option 2: Using Remote Ubuntu Server

1. **Copy script and skill files to server:**
   ```bash
   scp deploy-to-github.sh your-server:/home/youruser/
   scp *.skill your-server:/home/youruser/skills/
   ```

2. **SSH into server and run:**
   ```bash
   ssh your-server
   chmod +x deploy-to-github.sh
   
   # Edit the script to update WINDOWS_PATH
   nano deploy-to-github.sh
   # Change: WINDOWS_PATH="/home/youruser/skills"
   
   ./deploy-to-github.sh
   ```

### Option 3: Manual Approach (No Script)

If the script doesn't work, run these commands manually:

```bash
# Clone or update repo
cd ~
git clone https://github.com/devMoez/claude-skills.git
cd claude-skills

# Add each skill individually
git add scientific-research-accelerator.skill
git commit -m "Add scientific research accelerator skill" -m "Automated literature reviews, hypothesis generation, and experimental design"

sleep 3

git add creative-content-production.skill
git commit -m "Add creative content production skill" -m "Content strategy engine for all media formats with SEO and A/B testing"

sleep 3

git add personal-health-wellness.skill
git commit -m "Add personal health & wellness optimization skill" -m "Evidence-based health optimization with nutrition, exercise, and sleep protocols"

sleep 3

git add intelligent-legal-compliance.skill
git commit -m "Add intelligent legal & compliance assistant skill" -m "Contract analysis and compliance framework builder with risk assessment"

# Push all commits
git push origin main
```

## Troubleshooting

### Problem: "Windows path not accessible"
**Solution:** Update `WINDOWS_PATH` in the script to match where your files are:
- WSL: `/mnt/c/Users/moezf/Desktop/Claude-Skills`
- Remote server: Copy files first, then update path

### Problem: "Permission denied"
**Solution:** Make script executable:
```bash
chmod +x deploy-to-github.sh
```

### Problem: "Authentication failed"
**Solution:** Set up Git credentials:
```bash
# Option 1: Personal Access Token
git config --global credential.helper store
# Then push once and enter your PAT

# Option 2: SSH
ssh-keygen -t ed25519 -C "your_email@example.com"
# Add the public key to GitHub
```

### Problem: Contributions still not showing
**Solution:** Ensure your Git email matches GitHub:
```bash
# Check current email
git config user.email

# Update if needed
git config --global user.email "your-verified-github-email@example.com"

# Verify on GitHub: https://github.com/settings/emails
```

## What This Script Does

1. ✅ Clones or updates the repository
2. ✅ Copies skill files from Windows to Linux
3. ✅ Creates 4 separate commits (one per skill)
4. ✅ Adds natural delays between commits
5. ✅ Pushes all commits to GitHub
6. ✅ Shows confirmation and recent commits

## Expected Output

```
======================================
Claude Skills GitHub Deployment
======================================

✓ Repository exists, pulling latest changes...
✓ Windows path accessible

[1/4] Processing: scientific-research-accelerator.skill
  ✓ Copied file
  ✓ Added to git
  ✓ Committed
  ⏳ Waiting 3 seconds...

[2/4] Processing: creative-content-production.skill
  ✓ Copied file
  ✓ Added to git
  ✓ Committed
  ⏳ Waiting 3 seconds...

[3/4] Processing: personal-health-wellness.skill
  ✓ Copied file
  ✓ Added to git
  ✓ Committed
  ⏳ Waiting 3 seconds...

[4/4] Processing: intelligent-legal-compliance.skill
  ✓ Copied file
  ✓ Added to git
  ✓ Committed

======================================
All skills committed successfully!
======================================

Pushing to GitHub...

✓✓✓ DEPLOYMENT COMPLETE! ✓✓✓
Your 4 contributions should now appear on GitHub
```

## Need Help?

If you encounter issues, you can:
1. Check that your GitHub email is verified: https://github.com/settings/emails
2. Manually copy and commit files using the Manual Approach above
3. Contact support or check GitHub's contribution documentation
