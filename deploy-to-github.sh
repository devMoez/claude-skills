#!/bin/bash

# Automated GitHub deployment script for Claude Skills
# This script commits and pushes 4 skills individually for separate contributions

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}======================================${NC}"
echo -e "${BLUE}Claude Skills GitHub Deployment${NC}"
echo -e "${BLUE}======================================${NC}\n"

# Configuration
REPO_URL="https://github.com/devMoez/claude-skills.git"
REPO_DIR="$HOME/claude-skills"

# Skill files to commit
declare -a SKILLS=(
    "scientific-research-accelerator.skill"
    "creative-content-production.skill"
    "personal-health-wellness.skill"
    "intelligent-legal-compliance.skill"
)

# Commit messages
declare -a MESSAGES=(
    "Add scientific research accelerator skill|Automated literature reviews, hypothesis generation, and experimental design. Includes multi-source paper mining (PubMed, ArXiv, Semantic Scholar), AI-powered research synthesis, and statistical analysis tools."
    "Add creative content production skill|Comprehensive content strategy engine for all media formats - social media, blogs, video scripts, podcasts, email campaigns. Features platform-specific optimization, SEO tools, and A/B testing frameworks."
    "Add personal health & wellness optimization skill|Evidence-based health optimization system combining nutrition science, exercise physiology, sleep protocols, and mental health support. Includes personalized macro calculations, workout programs, and longevity frameworks."
    "Add intelligent legal & compliance assistant skill|AI-powered contract analysis and compliance framework builder. Features automated risk assessment, red flag detection, negotiation strategies, and support for GDPR, SOC2, HIPAA, and other regulatory frameworks."
)

# Step 1: Check if repo exists, clone or pull
if [ -d "$REPO_DIR" ]; then
    echo -e "${GREEN}✓ Repository exists, pulling latest changes...${NC}"
    cd "$REPO_DIR"
    git pull origin main
else
    echo -e "${GREEN}✓ Cloning repository...${NC}"
    git clone "$REPO_URL" "$REPO_DIR"
    cd "$REPO_DIR"
fi

echo ""

# Step 2: Copy skill files from Windows to Ubuntu (assuming mounted or shared)
# You'll need to update this path to where your Windows files are accessible
WINDOWS_PATH="/mnt/c/Users/moezf/Desktop/Claude-Skills"

# Check if Windows path is accessible
if [ ! -d "$WINDOWS_PATH" ]; then
    echo -e "${RED}✗ Windows path not accessible at: $WINDOWS_PATH${NC}"
    echo -e "${RED}  Please update WINDOWS_PATH in the script or manually copy files${NC}"
    echo -e "${RED}  Files needed: ${SKILLS[@]}${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Windows path accessible${NC}\n"

# Step 3: Commit each skill individually
for i in "${!SKILLS[@]}"; do
    SKILL="${SKILLS[$i]}"
    IFS='|' read -r TITLE DESCRIPTION <<< "${MESSAGES[$i]}"
    
    echo -e "${BLUE}[$((i+1))/4] Processing: $SKILL${NC}"
    
    # Copy file
    if [ -f "$WINDOWS_PATH/$SKILL" ]; then
        cp "$WINDOWS_PATH/$SKILL" "$REPO_DIR/"
        echo -e "  ${GREEN}✓ Copied file${NC}"
    else
        echo -e "  ${RED}✗ File not found: $WINDOWS_PATH/$SKILL${NC}"
        continue
    fi
    
    # Add to git
    git add "$SKILL"
    echo -e "  ${GREEN}✓ Added to git${NC}"
    
    # Commit with message
    git commit -m "$TITLE" -m "$DESCRIPTION"
    echo -e "  ${GREEN}✓ Committed${NC}"
    
    # Wait a few seconds between commits for natural spacing
    if [ $i -lt $((${#SKILLS[@]} - 1)) ]; then
        echo -e "  ${BLUE}⏳ Waiting 3 seconds...${NC}\n"
        sleep 3
    fi
done

echo ""
echo -e "${BLUE}======================================${NC}"
echo -e "${GREEN}All skills committed successfully!${NC}"
echo -e "${BLUE}======================================${NC}\n"

# Step 4: Push to GitHub
echo -e "${BLUE}Pushing to GitHub...${NC}"
git push origin main

echo ""
echo -e "${GREEN}✓✓✓ DEPLOYMENT COMPLETE! ✓✓✓${NC}"
echo -e "${GREEN}Your 4 contributions should now appear on GitHub${NC}"
echo ""
echo -e "${BLUE}Recent commits:${NC}"
git log --oneline -4

echo ""
echo -e "${BLUE}Check your contributions at:${NC}"
echo -e "${BLUE}https://github.com/devMoez${NC}"
