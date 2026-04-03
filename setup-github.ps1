# Claude Skills - GitHub Setup Script (Windows)
# Run this in PowerShell

Write-Host "🚀 Claude Skills - GitHub Setup" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is initialized
if (-not (Test-Path .git)) {
    Write-Host "❌ Git not initialized. Run 'git init' first." -ForegroundColor Red
    exit 1
}

# Check if user is configured
$gitUserName = git config user.name
if (-not $gitUserName) {
    Write-Host "📝 Configuring Git user..." -ForegroundColor Yellow
    $username = Read-Host "Enter your name"
    $useremail = Read-Host "Enter your email"
    git config user.name $username
    git config user.email $useremail
}

Write-Host ""
Write-Host "📋 Current git status:" -ForegroundColor Cyan
git status --short

Write-Host ""
$github_username = Read-Host "Enter your GitHub username"
$repo_name = Read-Host "Enter repository name (default: claude-skills)"
if ([string]::IsNullOrWhiteSpace($repo_name)) {
    $repo_name = "claude-skills"
}

Write-Host ""
Write-Host "🔗 Setting up remote..." -ForegroundColor Yellow
git remote remove origin 2>$null
git remote add origin "https://github.com/$github_username/$repo_name.git"

Write-Host ""
Write-Host "🌿 Renaming branch to main..." -ForegroundColor Yellow
git branch -M main

Write-Host ""
Write-Host "📤 Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Success! Your repository is live at:" -ForegroundColor Green
    Write-Host "   https://github.com/$github_username/$repo_name" -ForegroundColor Green
    Write-Host ""
    Write-Host "🎯 Next steps:" -ForegroundColor Cyan
    Write-Host "1. Add topics to your repository"
    Write-Host "2. Enable Discussions and Issues"
    Write-Host "3. Upload a social preview image"
    Write-Host "4. Share with the community!"
    Write-Host ""
    Write-Host "📚 See GITHUB_PUSH.md for more details" -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "❌ Push failed. Please check:" -ForegroundColor Red
    Write-Host "1. Repository exists on GitHub"
    Write-Host "2. You have access rights"
    Write-Host "3. Your credentials are correct"
    Write-Host ""
    Write-Host "💡 Try running manually:" -ForegroundColor Yellow
    Write-Host "   git remote add origin https://github.com/$github_username/$repo_name.git"
    Write-Host "   git branch -M main"
    Write-Host "   git push -u origin main"
}

Write-Host ""
Read-Host "Press Enter to exit"
