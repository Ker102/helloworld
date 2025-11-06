# Security Policy

## Supported Versions

We take security seriously and aim to keep this project secure. Currently, we support the following versions with security updates:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

If you discover a security vulnerability in this project, please follow these steps:

### 1. **Do Not** Open a Public Issue

Please do not create a public GitHub issue for security vulnerabilities. This helps protect users who haven't updated yet.

### 2. Report Privately

Report security vulnerabilities by emailing the repository owner or using GitHub's private security advisory feature:

- Navigate to the **Security** tab of this repository
- Click on **Report a vulnerability**
- Fill out the form with details about the vulnerability

### 3. What to Include

When reporting a vulnerability, please include:

- A description of the vulnerability
- Steps to reproduce the issue
- Potential impact of the vulnerability
- Any suggested fixes (if you have them)
- Your contact information (optional, but helpful for follow-up)

### 4. Response Timeline

- We will acknowledge receipt of your vulnerability report within **3 business days**
- We will provide a more detailed response within **7 business days**, including our evaluation and planned next steps
- We will keep you informed of our progress toward fixing the vulnerability
- Once fixed, we will publicly disclose the vulnerability (with credit to you, if desired)

## Security Monitoring

This repository uses several security monitoring tools:

- **CodeQL**: Automated code scanning runs on every push and pull request, and weekly scheduled scans
- **Dependabot**: Automatically checks for vulnerable dependencies and creates pull requests to update them
- **Security Advisories**: GitHub's security advisory database is monitored for known vulnerabilities

## Best Practices

When contributing to this project, please:

- Keep dependencies up to date
- Follow secure coding practices
- Never commit sensitive information (API keys, passwords, tokens, etc.)
- Review Dependabot alerts and security scanning results

## Security Updates

Security updates will be released as soon as possible after a vulnerability is confirmed and fixed. We will:

1. Create a security advisory
2. Release a patched version
3. Update this document with details (after users have had time to update)

Thank you for helping keep this project and its users safe!
