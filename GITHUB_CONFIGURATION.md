# GitHub Repository Configuration Guide

This document explains the GitHub repository configurations that have been set up for this project, including issue templates, Dependabot, and security monitoring.

## 📋 Issue Templates

Issue templates help contributors provide consistent, structured information when reporting bugs or requesting features.

### What Was Configured

Three files were created in `.github/ISSUE_TEMPLATE/`:

1. **bug_report.yml** - Template for reporting bugs
2. **feature_request.yml** - Template for suggesting new features
3. **config.yml** - Configuration for issue template behavior

### How to Use Issue Templates

**Creating a Bug Report:**

1. Go to the **Issues** tab in your GitHub repository
2. Click **New Issue**
3. Select **Bug Report** from the available templates
4. Fill out the form with:
   - Bug description
   - Steps to reproduce
   - Expected vs. actual behavior
   - Browser information (optional)
   - Additional context like screenshots

**Creating a Feature Request:**

1. Go to the **Issues** tab
2. Click **New Issue**
3. Select **Feature Request**
4. Fill out the form with:
   - Problem statement (optional)
   - Proposed solution
   - Alternative solutions
   - Priority level
   - Additional context

**Benefits:**
- Ensures all necessary information is collected
- Makes it easier for maintainers to understand and address issues
- Provides a consistent format for all issues
- Reduces back-and-forth communication

---

## 🏷️ Repository Labels

Repository labels help categorize and organize issues and pull requests.

### What Was Configured

A GitHub Actions workflow (`.github/workflows/create-labels.yml`) was created to set up the required labels for Dependabot:

- **dependencies** - Blue (#0366d6) - Pull requests that update a dependency file
- **github-actions** - Black (#000000) - Pull requests that update GitHub Actions code

### How to Create the Labels

The labels are created using a manual workflow:

1. Go to the **Actions** tab in your repository
2. Select **Create Missing Labels** from the workflows list
3. Click **Run workflow**
4. Click the green **Run workflow** button to confirm

The workflow uses the GitHub CLI (`gh label create`) with the `--force` flag, so it's safe to run multiple times - it will update existing labels rather than fail.

### Benefits:
- Required for Dependabot to properly label its pull requests
- Helps organize and filter dependency-related PRs
- Standardized across GitHub repositories

---

## 🤖 Dependabot

Dependabot automatically checks for outdated or vulnerable dependencies and creates pull requests to update them.

### What Was Configured

A `.github/dependabot.yml` file was created with the following configuration:

- **Package Ecosystem**: GitHub Actions
- **Update Schedule**: Weekly on Mondays at 6:00 AM UTC
- **Pull Request Limit**: Maximum of 5 open PRs at a time
- **Auto-assigned Reviewer**: Ker102
- **Labels**: Automatically tags PRs with "dependencies" and "github-actions" (these labels must exist in the repository)
- **Commit Message Prefix**: "chore" with scope included

### How Dependabot Works

1. **Automatic Scanning**: Dependabot scans your repository weekly for outdated GitHub Actions
2. **Pull Request Creation**: When updates are available, Dependabot automatically creates a PR
3. **Security Updates**: If a security vulnerability is detected, Dependabot may create an immediate PR (regardless of schedule)
4. **Review & Merge**: You review the PR, check the changelog, and merge if everything looks good

### How to Use Dependabot

**Viewing Dependabot PRs:**

1. Go to the **Pull Requests** tab
2. Look for PRs labeled with "dependencies"
3. Review the changes and release notes
4. Run any tests (if applicable)
5. Merge the PR if everything looks good

**Viewing Dependabot Alerts:**

1. Go to the **Security** tab
2. Click on **Dependabot alerts** in the sidebar
3. Review any vulnerabilities detected
4. Dependabot will automatically create PRs for these

**Managing Dependabot:**

- **Enable/Disable**: Go to Settings → Security & analysis → Dependabot
- **Configure**: Edit `.github/dependabot.yml` to change schedule, reviewers, or labels
- **Ignore Updates**: Add comments in the dependabot.yml or close PRs with "dependabot ignore" commands

**Benefits:**
- Keeps dependencies up to date automatically
- Reduces security vulnerabilities
- Saves time on manual dependency management
- Provides clear changelogs for updates

---

## 🔒 Security Monitoring

Security monitoring helps identify and fix vulnerabilities in your code automatically.

### What Was Configured

Two components were set up:

1. **CodeQL Workflow** (`.github/workflows/codeql.yml`)
   - Automated code scanning for security vulnerabilities
   - Scans JavaScript code in the repository
   - Runs on every push and pull request to main/master
   - Scheduled weekly scans every Monday at 6:00 AM UTC

2. **Security Policy** (`SECURITY.md`)
   - Documents how to report security vulnerabilities
   - Explains supported versions
   - Outlines the vulnerability response process

### How CodeQL Works

1. **Automatic Scanning**: CodeQL analyzes your code for security vulnerabilities and coding errors
2. **When It Runs**:
   - On every push to main/master branch
   - On every pull request to main/master
   - Weekly scheduled scans (Mondays at 6 AM UTC)
3. **Alert Creation**: If issues are found, CodeQL creates security alerts
4. **Remediation**: You review and fix the issues

### How to Use Security Monitoring

**Viewing Security Alerts:**

1. Go to the **Security** tab in your repository
2. Click on **Code scanning** in the sidebar
3. Review any alerts that appear
4. Click on an alert to see:
   - Description of the vulnerability
   - Affected code location
   - Severity level
   - Recommended fixes
   - Code flow visualization

**Responding to Alerts:**

1. Review the alert details
2. Click **Show paths** to see how the vulnerability could be exploited
3. Fix the issue in your code
4. Commit and push the fix
5. The alert will automatically close once fixed

**Configuring CodeQL:**

- **Add More Languages**: Edit `.github/workflows/codeql.yml` and add to the language matrix
- **Custom Queries**: Uncomment the `queries` line in codeql.yml
- **Change Schedule**: Modify the `cron` expression in the workflow file

**Reporting Vulnerabilities (for external users):**

1. Go to the **Security** tab
2. Click **Report a vulnerability** (if enabled)
3. Fill out the security advisory form privately
4. Maintainers will respond according to the policy in SECURITY.md

**Benefits:**
- Automated detection of security vulnerabilities
- Regular scanning keeps code secure over time
- Integrated into the development workflow
- Provides detailed remediation guidance
- Private disclosure process for external researchers

---

## 📦 GitHub Packages Publishing

This repository automatically publishes Docker container images to GitHub Container Registry (ghcr.io) with proper versioning.

### What Was Configured

1. **Publish Package Workflow** (`.github/workflows/publish-package.yml`)
   - Publishes Docker container images to GitHub Container Registry
   - Triggers automatically when version tags are pushed (e.g., `v1.0.0`)
   - Can also be triggered manually from the Actions tab
   - Creates multiple semantic version tags for flexibility

### How It Works

1. **Tag-Based Publishing**: When you create and push a version tag, the workflow automatically:
   - Builds a Docker image from the Dockerfile
   - Tags it with multiple version formats
   - Pushes it to GitHub Container Registry
   - Generates a summary with pull instructions

2. **Automatic Tagging**: For a tag like `v1.2.3`, it creates:
   - `1.2.3` - Full semantic version
   - `1.2` - Major.minor version
   - `1` - Major version only
   - `latest` - Always points to the newest version

### How to Publish a New Version

**Step 1: Create a version tag**
```bash
git tag v1.0.0
git push origin v1.0.0
```

**Step 2: Monitor the workflow**
1. Go to the **Actions** tab in your repository
2. Watch the **Publish Package to GitHub Packages** workflow run
3. Check the summary for pull instructions

**Step 3: Use the published image**
```bash
docker pull ghcr.io/ker102/helloworld:latest
docker run -d -p 8080:80 ghcr.io/ker102/helloworld:latest
```

### Using Published Images

**Pull the latest version:**
```bash
docker pull ghcr.io/ker102/helloworld:latest
```

**Pull a specific version:**
```bash
docker pull ghcr.io/ker102/helloworld:1.0.0
```

**Pull by major version (always gets latest minor/patch):**
```bash
docker pull ghcr.io/ker102/helloworld:1
```

### Managing Package Visibility

By default, packages are public. To manage visibility:

1. Go to your GitHub profile
2. Click **Packages** tab
3. Select the `helloworld` package
4. Click **Package settings**
5. Configure visibility (public or private)

### Benefits

- **Automated publishing**: No manual Docker builds needed
- **Version management**: Multiple tags for different use cases
- **Consistent releases**: Every tag creates a release automatically
- **Easy distribution**: Users can pull images without cloning the repo
- **Layer caching**: Faster builds using GitHub Actions cache
## 📝 Automated Release Notes

Automated release notes generation helps maintain a clear changelog and create professional releases automatically.

### What Was Configured

Two components were set up:

1. **Release Drafter Workflow** (`.github/workflows/release-drafter.yml`)
   - Automatically generates release notes from merged PRs
   - Creates and updates draft releases
   - Runs on pushes to main and on pull request events
   - Includes autolabeler for automatic PR categorization

2. **Release Drafter Configuration** (`.github/release-drafter.yml`)
   - Defines categories for organizing changes
   - Configures automatic version resolution
   - Sets up autolabeling rules based on files, branches, and titles
   - Customizes release note templates

### How Release Drafter Works

1. **On Pull Request**: Automatically applies labels based on:
   - Changed files (e.g., `*.md` → documentation label)
   - Branch names (e.g., `feature/*` → feature label)
   - PR titles (e.g., "fix bug" → bug label)

2. **When PR is Merged**: Updates or creates a draft release with:
   - Categorized list of changes
   - Contributor acknowledgments
   - Automatically determined version number

3. **Release Categories**:
   - 🚀 **Features** - New features and enhancements
   - 🐛 **Bug Fixes** - Bug fixes and corrections
   - 📚 **Documentation** - Documentation updates
   - 🧰 **Maintenance** - Chores, dependencies, CI updates
   - 🎨 **Design** - Design and frontend changes

### How to Use Release Drafter

**Viewing Draft Releases:**

1. Go to the **Releases** section in your repository (on the right sidebar or under Code tab)
2. You'll see a draft release automatically created/updated
3. Review the generated release notes
4. Edit the release notes if needed
5. When ready, click **Publish release** to make it public

**Creating Releases:**

1. Merge pull requests to the main branch as normal
2. Release Drafter automatically updates the draft release
3. When you're ready to release:
   - Go to the draft release
   - Review and edit if needed
   - Add any additional notes
   - Optionally attach binary files
   - Click **Publish release**

**Version Management:**

Release Drafter automatically determines version numbers based on PR labels:
- **Major version** (1.0.0 → 2.0.0): PRs labeled with `major` or `breaking`
- **Minor version** (1.0.0 → 1.1.0): PRs labeled with `feature` or `enhancement`
- **Patch version** (1.0.0 → 1.0.1): PRs labeled with `bug`, `fix`, `documentation`, or `chore`

**Autolabeler Rules:**

The autolabeler helps categorize PRs automatically:

| Label | Applied When |
|-------|--------------|
| `documentation` | Markdown files changed, or files in docs/ |
| `bug` | Branch name contains "fix/" or "bugfix/", or title contains "fix" or "bug" |
| `feature` | Branch name contains "feature/" or "feat/", or title contains "feature" or "feat" |
| `enhancement` | Title contains "enhance" or "improve" |
| `chore` | Title contains "chore" |
| `ci` | Workflow files in `.github/workflows/` changed |
| `frontend` | HTML, CSS, or JS files changed |
| `dependencies` | Package files or Docker files changed |

**Benefits:**
- Automated changelog generation from PR titles
- Consistent release note formatting
- Automatic version number suggestions
- Time saved on manual release note writing
- Professional-looking release pages
- Clear categorization of changes
- Contributor recognition

**Tips:**
- Write clear, descriptive PR titles as they appear in release notes
- Use appropriate labels or follow branch naming conventions
- Review draft releases before publishing
- Add any additional context manually before publishing
## 📝 Pull Request Templates

Pull request templates help contributors provide consistent information when submitting code changes.

### What Was Configured

A `.github/pull_request_template.md` file was created with:
- Description section for explaining changes
- Type of change checklist (bug fix, feature, breaking change, etc.)
- Testing steps and results checklist
- Screenshots section for UI changes
- Code quality and review checklist
- Related issues linking
- Additional notes section

### How to Use Pull Request Templates

**Creating a Pull Request:**

1. When you create a new pull request on GitHub, the template automatically populates the PR description
2. Fill in the description of your changes
3. Check the boxes that apply to your PR type
4. Document testing steps you performed
5. Add screenshots if you made UI changes
6. Complete the checklist before requesting review
7. Link any related issues

**Benefits:**
- Ensures all PRs contain necessary information for reviewers
- Standardizes the review process
- Helps contributors think about testing and documentation
- Makes it easier for maintainers to understand changes
- Reduces back-and-forth during code review

---

## 👥 Code Owners

CODEOWNERS automatically requests reviews from designated people when PRs modify certain files.

### What Was Configured

A `.github/CODEOWNERS` file was created with:
- Default owner (@Ker102) for all repository files
- Specific patterns for documentation, frontend code, GitHub config, and Docker files
- Automatic review requests based on file patterns

### How CODEOWNERS Works

1. **Automatic Review Requests**: When a PR is created that modifies files matching CODEOWNERS patterns, GitHub automatically requests a review from the specified owners
2. **Required Reviews**: Repository settings can require approval from code owners before merging
3. **Pattern Matching**: Uses gitignore-style patterns to match files

**Example Patterns:**
- `*` - Matches all files in the repository
- `*.md` - Matches all Markdown files
- `/.github/` - Matches files in the .github directory
- `Dockerfile` - Matches the specific Dockerfile

### How to Use CODEOWNERS

**For Contributors:**
- When you create a PR, code owners are automatically notified
- You'll see their review status on the PR
- Wait for their approval before merging

**For Maintainers:**
- Edit `.github/CODEOWNERS` to add more owners or patterns
- You can assign teams using `@org/team-name` format
- Multiple owners can be specified for the same pattern

**Benefits:**
- Ensures the right people review changes
- Distributes review workload based on expertise
- Provides accountability for different parts of the codebase
- Works seamlessly with GitHub's review system

---

## 🏷️ Automated Pull Request Labeling

Automatic labeling helps organize and categorize pull requests based on the files they change.

### What Was Configured

The `.github/labeler.yml` file was enhanced with patterns for:
- **documentation** - Markdown files and docs directory
- **frontend** - HTML, CSS, JavaScript files
- **docker** - Docker configuration files
- **github-config** - GitHub configuration files
- **security** - Security-related files
- **ci** - GitHub Actions workflows
- **tests** - Test files (when added to the repository)

### How Automated Labeling Works

1. **Workflow Trigger**: The `.github/workflows/label.yml` workflow runs on every pull request
2. **Pattern Matching**: Checks which files were modified in the PR
3. **Label Application**: Automatically adds labels based on matching patterns
4. **Multiple Labels**: A PR can receive multiple labels if it modifies files in different categories

### How to Use Automated Labeling

**For Contributors:**
- Labels are added automatically when you create a PR
- No action needed from you
- Labels help maintainers quickly understand what areas your PR affects

**For Maintainers:**
- Edit `.github/labeler.yml` to add or modify label patterns
- Create corresponding labels in the repository (Issues → Labels)
- Use labels to filter and search PRs

**Benefits:**
- Consistent labeling across all PRs
- Easier to filter and find relevant PRs
- Helps identify areas of the codebase being actively developed
- Provides quick visual context about PR scope

---

## 🎯 Summary

### What You Now Have:

✅ **Repository Labels** - Required labels for Dependabot (dependencies, github-actions)  
✅ **Issue Templates** - Structured bug reports and feature requests  
✅ **Pull Request Templates** - Standardized PR descriptions with testing checklists  
✅ **CODEOWNERS** - Automatic review requests from code owners  
✅ **Automated PR Labeling** - Automatic labels based on modified files  
✅ **Dependabot** - Automatic dependency updates for GitHub Actions  
✅ **CodeQL Security Scanning** - Automated vulnerability detection  
✅ **Security Policy** - Clear process for reporting vulnerabilities  
✅ **GitHub Packages Publishing** - Automated Docker image publishing with versioning  
✅ **Automated Release Notes** - Draft releases with categorized changelogs  

### Getting Started Checklist:

- [ ] Run the "Create Missing Labels" workflow to create required labels
- [ ] Create labels for automated PR labeling (documentation, frontend, docker, github-config, security, ci)
- [ ] Enable branch protection rules to require code owner reviews (Settings → Branches)
- [ ] Enable Dependabot alerts in Settings → Security & analysis
- [ ] Enable Dependabot security updates
- [ ] Enable CodeQL code scanning (should auto-enable when workflow runs)
- [ ] Review and customize the security policy in SECURITY.md
- [ ] Review and customize CODEOWNERS file if you have multiple maintainers
- [ ] Test creating an issue using the new templates
- [ ] Test creating a pull request to see the PR template
- [ ] Wait for the first Dependabot scan (or trigger manually)
- [ ] Check the Security tab after the first CodeQL scan runs
- [ ] Merge a PR to see Release Drafter create your first draft release

### Repository Settings to Verify:

Go to **Settings → Security & analysis** and ensure these are enabled:

- ✅ Dependency graph
- ✅ Dependabot alerts  
- ✅ Dependabot security updates
- ✅ Code scanning (CodeQL)
- ✅ Secret scanning (if available for your repository type)

### Next Steps:

1. **Monitor the Security Tab**: Regularly check for new alerts
2. **Review Dependabot PRs**: When they appear, review and merge them
3. **Use Issue Templates**: When creating issues, use the templates
4. **Keep Security Policy Updated**: Update SECURITY.md as your project evolves
5. **Respond to Alerts Promptly**: Address security issues quickly
6. **Publish Releases**: Review and publish draft releases when ready

---

## 📚 Additional Resources

- [GitHub Issue Templates Documentation](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/about-issue-and-pull-request-templates)
- [Dependabot Documentation](https://docs.github.com/en/code-security/dependabot)
- [CodeQL Documentation](https://docs.github.com/en/code-security/code-scanning/introduction-to-code-scanning/about-code-scanning-with-codeql)
- [Security Advisories Documentation](https://docs.github.com/en/code-security/security-advisories)
- [Release Drafter Documentation](https://github.com/release-drafter/release-drafter)

---

## 🔧 Maintenance

### Managing Labels

To add more labels or modify existing ones:
- **Manual Method**: Go to Issues → Labels → New label
- **Automated Method**: Edit `.github/workflows/create-labels.yml` to add more label creation steps
- **Label Colors**: Follow [GitHub's label color conventions](https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/managing-labels)

### Updating Issue Templates

Edit the YAML files in `.github/ISSUE_TEMPLATE/` to:
- Add new fields
- Change required fields
- Modify labels or titles
- Add new templates

### Updating Dependabot

Edit `.github/dependabot.yml` to:
- Change update schedule
- Add more package ecosystems (if you add npm, pip, etc.)
- Modify PR limits
- Change reviewers or labels

### Updating Security Scanning

Edit `.github/workflows/codeql.yml` to:
- Add more programming languages
- Change scan schedule
- Add custom queries
- Modify scan scope

### Updating Release Drafter

Edit `.github/release-drafter.yml` to:
- Add or modify categories
- Change version resolution rules
- Update autolabeler patterns
- Customize release note templates
- Change emoji icons for categories

Edit `.github/workflows/release-drafter.yml` to:
- Change trigger branches (currently main)
- Disable autolabeler if needed
- Use a different configuration file

Remember: All these configurations are version controlled, so changes will be reviewed through pull requests!
