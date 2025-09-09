# GitHub Pages Deployment Workflow

This project demonstrates how to use GitHub Actions to deploy a static website to GitHub Pages. It is part of the [roadmap.sh](https://roadmap.sh/projects/github-actions-deployment-workflow) exercise projects to learn Continuous Integration (CI) and Continuous Deployment (CD).

## Project Overview

The goal of this project is to create a GitHub Actions workflow that automatically deploys changes made to the `index.html` file to GitHub Pages. This ensures that the website is always up-to-date with the latest changes pushed to the repository.

## Features

- **Continuous Deployment**: Automatically deploys the website whenever changes are made to the `index.html` file.
- **GitHub Pages Integration**: The website is hosted on GitHub Pages and accessible via the repository's GitHub Pages URL.
- **Simple Static Website**: Includes a basic `index.html` file with a "Hello, GitHub Actions!" message.

## Repository Structure

```
.github/workflows/
  deploy.yml       # GitHub Actions workflow file for deployment
index.html         # Static website file
README.md          # Project documentation
```

### Note on Workflow File Location

The `deploy.yml` file is located in the `.github/workflows/` directory at the root of the repository, not in this folder. This is because GitHub looks for workflow files specifically in the `.github/workflows/` directory to execute them as part of GitHub Actions. Placing the file elsewhere will prevent the workflow from being recognized or executed.

## Workflow Details

The GitHub Actions workflow is defined in the `deploy.yml` file located in the `.github/workflows/` directory. Here are the key steps in the workflow:

1. **Trigger**: The workflow is triggered on every push to the `main` branch, but only if the `index.html` file is modified.
2. **Checkout Code**: The repository code is checked out using the `actions/checkout` action.
3. **Validation**: Ensures that the `index.html` file exists before proceeding.
4. **Configure Pages**: Sets up the GitHub Pages environment.
5. **Upload Artifact**: Uploads the `index.html` file as an artifact for deployment.
6. **Deploy**: Deploys the artifact to GitHub Pages using the `actions/deploy-pages` action.

## How to Use

1. Clone this repository or create a similar one.
2. Ensure the `index.html` file contains your desired content.
3. Push changes to the `main` branch.
4. The workflow will automatically deploy the changes to GitHub Pages.

## Accessing the Website

Once deployed, the website will be accessible at:

```
https://<username>.github.io/gh-deployment-workflow/
```

Replace `<username>` with your GitHub username.

## Stretch Goals

To make this project more practical, consider using a static site generator like Hugo, Jekyll, or Astro to create a more complex website, such as a personal portfolio.

## Concepts Learned

By completing this project, you will gain a solid understanding of:

- GitHub Actions
- GitHub Pages
- Continuous Integration and Continuous Deployment (CI/CD)
- Writing GitHub Actions workflows

## Feedback

Feel free to submit your solution and get feedback from the community on [roadmap.sh](https://roadmap.sh/projects/github-actions-deployment-workflow).
