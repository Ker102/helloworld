# helloworld

<!-- Badges Section -->
![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Status](https://img.shields.io/badge/status-active-brightgreen.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black)
![Maintenance](https://img.shields.io/badge/Maintained-yes-green.svg)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

> **⚠️ Testing Environment:** This repository is used for testing GitHub features and workflows. It serves as a personal experimentation space for exploring GitHub's capabilities.

A simple blog page project - currently just a Hello World page with potential to grow!

## 🏷️ Understanding the Badges

The colorful badges you see at the top of this README are created using [Shields.io](https://shields.io/), a service that generates dynamic SVG badges for documentation. Here's how they work:

### Badge Anatomy
Each badge is created using a simple URL structure:
```
https://img.shields.io/badge/{label}-{message}-{color}
```

**Components:**
- **Label** (left side): The category or type (e.g., "version", "status")
- **Message** (right side): The actual value or state (e.g., "1.0.0", "active")
- **Color**: The background color of the message section (e.g., "blue", "green", "brightgreen")

### Badge Types in This README

1. **Static Badges** - Simple information display:
   - `![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)` - Shows project version
   - `![Status](https://img.shields.io/badge/status-active-brightgreen.svg)` - Shows development status

2. **Logo Badges** - Include brand icons:
   - `![HTML5](https://img.shields.io/badge/HTML5-E34F26?logo=html5&logoColor=white)` - Tech stack indicator
   - The `logo` parameter adds an icon from [Simple Icons](https://simpleicons.org/)
   - The `logoColor` parameter sets the icon color

3. **Status Badges** - Indicate project health:
   - `![Maintenance](https://img.shields.io/badge/Maintained-yes-green.svg)` - Shows if actively maintained
   - `![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)` - Indicates contribution openness

### How to Update Badges
To modify a badge, simply change the URL parameters:
- Change the version: update the message part from `1.0.0` to your new version
- Change colors: use color names (red, blue, green) or hex codes (#FF0000)
- Add new badges: follow the same URL pattern with your custom label/message

### Advanced Badge Features
Shields.io also supports:
- **Dynamic badges** that pull data from APIs (GitHub stars, downloads, etc.)
- **Custom styles**: `?style=flat`, `?style=flat-square`, `?style=for-the-badge`
- **Links**: Wrap badges in markdown links to make them clickable

For more badge options, visit [shields.io](https://shields.io/).

## About This Project

This project started as a basic "Hello World" demonstration and serves as a foundation for a potential blog platform. The current implementation features a clean, minimalist design that can be extended with various blogging capabilities in the future.

## Getting Started

### Option 1: Direct File Access
To view this project locally without Docker:
1. Clone the repository to your local machine
2. Open `index.html` in your web browser
3. That's it! No build process or dependencies required.

### Option 2: Using Docker 🐳

This project includes Docker support for easy development and deployment.

#### Prerequisites
- [Docker](https://docs.docker.com/get-docker/) installed on your machine
- [Docker Compose](https://docs.docker.com/compose/install/) (included with Docker Desktop)

#### Quick Start with Docker Compose

1. Clone the repository:
   ```bash
   git clone https://github.com/Ker102/helloworld.git
   cd helloworld
   ```

2. Start the blog using Docker Compose:
   ```bash
   docker compose up -d
   ```

3. Open your browser and visit:
   ```
   http://localhost:8080
   ```

4. To stop the blog:
   ```bash
   docker compose down
   ```

#### Using Docker Directly

You can also build and run the Docker container manually:

```bash
# Build the image
docker build -t helloworld-blog .

# Run the container
docker run -d -p 8080:80 --name my-blog helloworld-blog

# Stop the container
docker stop my-blog
docker rm my-blog
```

#### Development Containers

This project supports [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers). If you have VS Code with the Dev Containers extension:

1. Open the project in VS Code
2. When prompted, click "Reopen in Container"
3. VS Code will build and start the development container automatically

This provides a consistent development environment with all necessary tools pre-configured.

## Future Development Ideas

Check out [ISSUES_IDEAS.md](ISSUES_IDEAS.md) for 5 cool feature ideas to transform this into a full-featured blog platform!

## Project Status

![Development Stage](https://img.shields.io/badge/stage-early%20development-yellow.svg)
![Last Updated](https://img.shields.io/badge/updated-November%202025-blue.svg)

**Current Version:** 1.0.0 - Initial Release  
**Status:** Active Development  
**Last Updated:** November 2025

This project is in its early stages and welcomes contributions. Whether you're interested in adding new features, improving the design, or fixing bugs, your input is valuable!

## Contributing

![Contributions](https://img.shields.io/badge/contributions-welcome-brightgreen.svg)
![Issues](https://img.shields.io/badge/issue%20tracking-enabled-blue.svg)

When contributing to this project, please:
- Use our [issue templates](.github/ISSUE_TEMPLATE/) to report bugs or suggest features
- Review our [Security Policy](SECURITY.md) if you discover a security vulnerability
- Check out the [GitHub Configuration Guide](GITHUB_CONFIGURATION.md) to learn about our automated tools

## Security & Maintenance

![Security](https://img.shields.io/badge/security-CodeQL-blue.svg?logo=github)
![Dependabot](https://img.shields.io/badge/dependabot-enabled-brightgreen.svg?logo=dependabot)
![Issues](https://img.shields.io/badge/issue%20templates-available-orange.svg)

This repository uses automated tools to maintain code quality and security:
- 🔒 **CodeQL** - Automated security scanning
- 🤖 **Dependabot** - Automatic dependency updates
- 📋 **Issue Templates** - Structured bug reports and feature requests

For more details, see [GITHUB_CONFIGURATION.md](GITHUB_CONFIGURATION.md).

## Testing Notes

This README has been updated with additional sections to provide more comprehensive documentation and to support testing of documentation changes in the repository workflow.