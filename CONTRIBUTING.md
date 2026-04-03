# Contributing to Claude Skills

First off, thank you for considering contributing to Claude Skills! 🎉

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Skill Guidelines](#skill-guidelines)
- [Pull Request Process](#pull-request-process)
- [Skill Template](#skill-template)

## Code of Conduct

This project and everyone participating in it is governed by our commitment to:

- **Be respectful** - Value each other's ideas, styles, and viewpoints
- **Be collaborative** - Help each other learn and improve
- **Be inclusive** - Welcome contributors from all backgrounds
- **Be constructive** - Provide helpful feedback

## How Can I Contribute?

### 🐛 Reporting Bugs

Before creating bug reports, please check the issue list to avoid duplicates. When you create a bug report, include:

- **Clear title** - Summarize the issue in one line
- **Detailed description** - Explain what happened vs what you expected
- **Skill name** - Which skill has the issue
- **Code snippet** - If applicable, show the problematic code
- **Environment** - OS, versions, etc.

### 💡 Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, include:

- **Use case** - Why would this be useful?
- **Detailed description** - How would it work?
- **Examples** - Show what it might look like

### 📝 Creating New Skills

Want to add a new skill? Awesome! Here's how:

1. **Check existing skills** - Make sure it doesn't duplicate existing work
2. **Follow the template** - Use our standard skill format (see below)
3. **Include examples** - Provide production-ready code
4. **Add security** - Consider security implications
5. **Test thoroughly** - Ensure code works as expected

## Skill Guidelines

### Quality Standards

Every skill should:

✅ **Be production-ready** - Include error handling, validation, edge cases  
✅ **Include security** - Address common vulnerabilities  
✅ **Provide examples** - Show both good and bad patterns  
✅ **Be well-documented** - Clear explanations and comments  
✅ **Follow best practices** - Use industry-standard patterns  
✅ **Be self-improving** - Include learning mechanisms  

### File Format

- File extension: `.skill`
- Format: Markdown
- Version: Include version number (semantic versioning)

### Code Standards

- Use **TypeScript** for type safety (when applicable)
- Include **comprehensive comments**
- Show both **anti-patterns** (what NOT to do) and **best practices**
- Add **security warnings** for dangerous patterns

## Pull Request Process

### Before Submitting

1. **Fork the repository**
2. **Create a branch** - Use descriptive names: `feature/api-caching-skill`
3. **Make your changes**
4. **Test everything** - Ensure code examples work
5. **Update documentation** - If you change existing skills

### PR Description

Include:

- **What changed** - Clear summary
- **Why** - Motivation for the change
- **Testing** - How you verified it works
- **Screenshots** - If applicable

### Review Process

1. Maintainers will review your PR
2. They may suggest changes
3. Once approved, your PR will be merged
4. You'll be added to contributors! 🎉

## Skill Template

```markdown
# [Skill Name]
**Version:** 1.0.0  
**Type:** Self-Improving | [Category] | [Specialty]

## Core Purpose
[What this skill does and when to use it]

## Self-Improvement Engine
```yaml
learning_capabilities:
  - [What it tracks]
  - [What it learns]
  - [How it adapts]
```

## [Main Section Title]

### **[Subsection]**
```typescript
// ❌ BAD: [What's wrong]
[Anti-pattern code]

// ✅ GOOD: [What's right]
[Best practice code]
```

[Explanation]

## Best Practices

- [Practice 1]
- [Practice 2]
- [Practice 3]

## Learning & Adaptation

The skill tracks and learns from:
- [Metric 1]
- [Metric 2]
- [Metric 3]

And automatically suggests:
- [Suggestion 1]
- [Suggestion 2]
- [Suggestion 3]

---
**Status:** [Production Ready | Beta | Experimental]
```

## Examples of Good Contributions

### ✅ Good Examples

- Adding missing security patterns to existing skills
- Creating new skills for emerging technologies
- Improving code examples with better error handling
- Adding comprehensive documentation
- Fixing bugs in example code

### ❌ Things to Avoid

- Duplicate skills without significant improvement
- Incomplete skills without examples
- Skills without security considerations
- Code with obvious bugs
- Poorly documented contributions

## Getting Help

Need help? Here's how:

- **Discord** - Join our community (coming soon)
- **GitHub Discussions** - Ask questions
- **Issues** - For bugs and feature requests
- **Email** - For private concerns

## Recognition

All contributors will be:

- 🌟 Listed in the README
- 🏆 Credited in release notes
- 💝 Given our eternal gratitude

## Questions?

Don't hesitate to ask! Open an issue or reach out to the maintainers.

---

**Thank you for making Claude Skills better!** ❤️
