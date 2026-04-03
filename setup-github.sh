#!/bin/bash

# Claude Skills - GitHub Setup Script
# This script helps you push your skills to GitHub

echo "🚀 Claude Skills - GitHub Setup"
echo "================================"
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "❌ Git not initialized. Run 'git init' first."
    exit 1
fi

# Check if user is configured
if ! git config user.name > /dev/null; then
    echo "📝 Configuring Git user..."
    read -p "Enter your name: " username
    read -p "Enter your email: " useremail
    git config user.name "$username"
    git config user.email "$useremail"
fi

echo ""
echo "📋 Current git status:"
git status --short

echo ""
read -p "Enter your GitHub username: " github_username
read -p "Enter repository name (default: claude-skills): " repo_name
repo_name=${repo_name:-claude-skills}

echo ""
echo "🔗 Setting up remote..."
git remote remove origin 2>/dev/null
git remote add origin "https://github.com/$github_username/$repo_name.git"

echo ""
echo "🌿 Renaming branch to main..."
git branch -M main

echo ""
echo "📤 Pushing to GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Success! Your repository is live at:"
    echo "   https://github.com/$github_username/$repo_name"
    echo ""
    echo "🎯 Next steps:"
    echo "1. Add topics to your repository"
    echo "2. Enable Discussions and Issues"
    echo "3. Upload a social preview image"
    echo "4. Share with the community!"
    echo ""
    echo "📚 See GITHUB_PUSH.md for more details"
else
    echo ""
    echo "❌ Push failed. Please check:"
    echo "1. Repository exists on GitHub"
    echo "2. You have access rights"
    echo "3. Your credentials are correct"
    echo ""
    echo "💡 Try running manually:"
    echo "   git remote add origin https://github.com/$github_username/$repo_name.git"
    echo "   git branch -M main"
    echo "   git push -u origin main"
fi
