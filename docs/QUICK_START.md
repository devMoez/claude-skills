# Quick Start Guide

Get up and running with Claude Skills in 5 minutes! 🚀

## 📋 Prerequisites

- Basic understanding of your chosen programming language
- A code editor (VS Code recommended)
- Git (for cloning the repository)
- Claude AI access (Claude.ai, API, or other interface)

## 🎯 Step 1: Get the Skills

### Option A: Clone the Repository
```bash
git clone https://github.com/yourusername/claude-skills.git
cd claude-skills
```

### Option B: Download Specific Skills
Download just the `.skill` files you need from the repository.

## 🔧 Step 2: Choose Your Skill

Pick a skill based on your project needs:

| Project Type | Recommended Skills |
|--------------|-------------------|
| New API | Backend API Master |
| React App | Frontend Framework Master |
| Microservices | Microservices Architect |
| Security Audit | Security Audit Master |
| Database Design | Database Architect |

See [Skills Index](SKILLS_INDEX.md) for complete list.

## 💬 Step 3: Use with Claude

### Method 1: Direct Copy-Paste
```bash
# Copy skill content to clipboard
cat backend-api-master.skill | clip  # Windows
cat backend-api-master.skill | pbcopy  # Mac
cat backend-api-master.skill | xclip  # Linux
```

Then in Claude:
```
I want to build a REST API for a blog platform.
Please use the Backend API Master skill I'm providing below.

[Paste skill content]

Now help me create:
1. User authentication endpoints
2. Blog post CRUD operations
3. Comment system
```

### Method 2: File Reference (Claude Desktop/Pro)
```
Using the backend-api-master.skill file, help me build
a production-ready API with JWT authentication.
```

### Method 3: Context Inclusion
```
@backend-api-master.skill

Create an Express.js API with:
- User registration and login
- JWT token management
- Rate limiting
- Input validation
```

## 📝 Step 4: Example Conversations

### Example 1: Building a Secure API

**You:**
```
Using the Security Audit Master skill, review this login endpoint
and tell me about any security vulnerabilities:

app.post('/login', (req, res) => {
  const user = db.query(`SELECT * FROM users WHERE email = '${req.body.email}'`);
  if (user && user.password === req.body.password) {
    res.json({ token: jwt.sign({ id: user.id }, 'secret') });
  }
});
```

**Claude (with skill):**
```
🚨 CRITICAL SECURITY VULNERABILITIES DETECTED:

1. SQL Injection (CRITICAL)
   - Line: db.query(`SELECT * FROM users WHERE email = '${req.body.email}'`)
   - Risk: Attacker can execute arbitrary SQL
   - Fix: Use parameterized queries

2. Plain Text Password Comparison (CRITICAL)
   - Line: user.password === req.body.password
   - Risk: Passwords stored in plain text
   - Fix: Use bcrypt for password hashing

3. Weak JWT Secret (CRITICAL)
   - Line: jwt.sign({ id: user.id }, 'secret')
   - Risk: Tokens can be forged
   - Fix: Use 256+ bit random secret from environment

4. No Rate Limiting (HIGH)
   - Risk: Brute force attacks
   - Fix: Implement rate limiting

Here's the secure version:
[Provides corrected code]
```

### Example 2: Database Schema Design

**You:**
```
Using the Database Architect skill, design a schema for an
e-commerce platform with users, products, orders, and reviews.
Use Prisma with PostgreSQL.
```

**Claude (with skill):**
```
I'll design a production-ready schema with proper relationships,
indexing, and optimization...

[Provides complete Prisma schema with:
- Optimized indexes
- Proper relations
- Soft deletes
- Audit fields
- Security considerations]
```

### Example 3: Microservices Architecture

**You:**
```
Using the Microservices Architect skill, help me structure
a food delivery app with user service, restaurant service,
order service, and delivery service.
```

**Claude (with skill):**
```
I'll design a microservices architecture with:

1. Service Boundaries
2. Inter-service Communication (Kafka events)
3. API Gateway
4. Service Discovery
5. Circuit Breakers
6. SAGA Pattern for Orders

[Provides complete implementation]
```

## 🎨 Step 5: Combine Skills

For complex projects, combine multiple skills:

```
I'm building a real-time collaborative document editor.

Please use:
1. Frontend Framework Master - for React components
2. Real-time Collaboration - for WebSocket and CRDT
3. Backend API Master - for REST API
4. Security Audit Master - to ensure it's secure

Help me build the architecture and key components.
```

## ⚡ Pro Tips

### 1. Be Specific
```
❌ "Help me build an API"
✅ "Using Backend API Master, create a Node.js Express API with
   JWT auth, rate limiting, and Prisma for PostgreSQL"
```

### 2. Reference Specific Sections
```
"Using the Authentication & Security skill, specifically the
OAuth2 implementation section, help me integrate Google login"
```

### 3. Ask for Explanations
```
"Explain why the Security Audit Master skill recommends bcrypt
with 12 rounds instead of MD5 for passwords"
```

### 4. Request Alternatives
```
"The Microservices Architect skill shows Kafka for events.
Can you show me an alternative using RabbitMQ?"
```

### 5. Validate Against Skills
```
"Here's my authentication code. Using the Security Audit Master
skill, check if I missed any vulnerabilities"
```

## 🔄 Common Workflows

### Workflow 1: New Project Setup
1. Use **Backend API Master** for API structure
2. Use **Database Architect** for schema
3. Use **DevOps & Infrastructure** for deployment
4. Use **Security Audit Master** for final review

### Workflow 2: Security Review
1. Use **Security Audit Master** to scan code
2. Fix critical vulnerabilities
3. Use **Testing & QA Master** to write security tests
4. Re-audit with Security Audit Master

### Workflow 3: Performance Optimization
1. Use **Performance Optimization** to identify bottlenecks
2. Use **Database Architect** to optimize queries
3. Use **DevOps & Infrastructure** to add caching
4. Measure and iterate

## ❓ Troubleshooting

### Issue: Skill context too large
**Solution:** Reference specific sections instead of entire skill
```
"Using just the JWT authentication section from Backend API Master..."
```

### Issue: Generic responses
**Solution:** Explicitly mention you're using the skill
```
"I'm using the Security Audit Master skill. Please apply its
vulnerability detection patterns to my code."
```

### Issue: Need multiple skills
**Solution:** Use them sequentially or mention all upfront
```
"I'll need Frontend Framework Master for UI and Backend API Master
for the API. Let's start with the backend."
```

## 📚 Next Steps

- Read the [Skills Index](SKILLS_INDEX.md) for complete skill list
- Check [Contributing Guidelines](../CONTRIBUTING.md) to add your own
- Join the community (link coming soon)
- Star the repository if you find it helpful! ⭐

## 💡 Examples Repository

Check `/examples` folder (coming soon) for:
- Complete project templates
- Integration examples
- Best practice showcases

---

**Happy coding with Claude Skills!** 🎉

[← Back to Main README](../README.md)
