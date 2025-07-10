# Hugo Framework

Hugo is a popular open-source static site generator known for its speed and flexibility. It allows you to build websites quickly and efficiently, often in seconds. Hugo is a general-purpose website framework written in Go. Unlike dynamic site generators that build a page every time a user requests it, Hugo generates pages when you create or update content. This results in faster websites and a better user experience.

## Key Features of Hugo

*   **High Speed:** Hugo is renowned for its fast build times, capable of rendering most websites in seconds (<1 ms per page).
*   **Content Management:** It takes content written in Markdown, HTML, or other formats and uses templates to create a static website. Hugo's directory structure helps organize your content and templates.
*   **Flexibility:** Hugo is versatile and can be used for various types of websites, including blogs, portfolios, documentation sites, and corporate websites.
*   **Templating:** It uses Go's templating system, which is both simple and powerful.
*   **Shortcodes:** Hugo has a feature called "shortcodes," which are reusable content snippets that can be added to Markdown files.
*   **Themes:** A wide variety of themes are available, created and maintained by the Hugo community.
*   **Asset Pipeline:** Hugo has a fast asset pipeline that can process images, bundle JavaScript, and transpile Sass to CSS.
*   **Security:** Hugo has a security model that protects against code injection and limits access to your system.

# Installation Guide

Here's a general guide to installing Hugo. For more detailed instructions, refer to the official Hugo documentation.

## Prerequisites

Before installing Hugo, you may need a package manager depending on your operating system.

## Installation Steps

*   **Windows:**
    *   You can use the Chocolatey package manager to install Hugo by running the command: `choco install hugo -confirm`.
    *   Alternatively, you can download the latest Hugo release from their official GitHub page.
    *   After downloading, you'll need to set up an environment variable to run Hugo from any location.
*   **macOS:**
    *   If you use the Homebrew package manager, you can install Hugo with the command: `brew install hugo`.
*   **Linux:**
    *   For Debian-based systems, you can use the command: `sudo apt install hugo`.
    *   You can also use Snap to install Hugo with the command: `sudo snap install hugo`.

## Updating Hugo on Linux (Debian/Ubuntu)

When you need to upgrade to a specific version of Hugo, especially one that is not yet available in your system's default repositories, the recommended method is to download the official pre-compiled binary.

Here are the steps to update Hugo to a specific version:

1.  **Find the Release:** Go to the official [Hugo Releases page](https://github.com/gohugoio/hugo/releases) on GitHub. Find the version you want to install.

2.  **Download the Correct Package:** From the release page, find the "Assets" section. Look for the Debian package (`.deb`) that matches your system's architecture. For most modern Linux systems, this will be `hugo_extended_..._linux-amd64.deb`. The "extended" version is recommended as it includes features like Sass/SCSS support. Copy the link to this file.

3.  **Download the File:** Use the `wget` command to download the package. For example:
    ```bash
    wget https://github.com/gohugoio/hugo/releases/download/v0.148.0/hugo_extended_0.148.0_linux-amd64.deb
    ```

4.  **Install the Package:** Use the `dpkg` (Debian Package Manager) to install the downloaded file. This command requires administrator privileges.
    ```bash
    sudo dpkg -i hugo_extended_0.148.0_linux-amd64.deb
    ```

5.  **Verify the Update:** After the installation is complete, you can confirm the new version by running:
    ```bash
    hugo version
    ```
    This should display the version you just installed.

6.  **Clean Up:** You can now safely delete the downloaded `.deb` file.
    ```bash
    rm hugo_extended_0.128.0_linux-amd64.deb
    ```

## Getting Started with Hugo

This guide provides step-by-step instructions to create a new Hugo project named `blog`, integrate the `LoveIt` theme, and create your first post.

1.  **Create a New Hugo Site:**
    Open your terminal and run the following command to create a new Hugo site in a folder named `blog`.
    ```bash
    hugo new site blog
    ```

2.  **Navigate to the Project Directory:**
    Change your current directory to the newly created `blog` folder.
    ```bash
    cd blog
    ```

3.  **Initialize a Git Repository:**
    A Hugo theme is best added as a Git submodule. Initialize a new Git repository in your project folder.
    ```bash
    git init
    ```

4.  **Add the LoveIt Theme:**
    Add the LoveIt theme as a submodule to your project's `themes` directory.
    ```bash
    git submodule add https://github.com/dillonzq/LoveIt.git themes/LoveIt
    ```

5.  **Configure Your Site:**
    You need to tell Hugo to use the LoveIt theme. Open the `hugo.toml` file in the root of your `blog` project and replace its content with the following basic configuration:

    ```toml
    baseURL = "http://example.org/"
    languageCode = "en-us"
    title = "My New Hugo Site"
    theme = "LoveIt"

    [params]
      # LoveIt theme parameters can be configured here.
      # For more details, check the theme's documentation.
      defaultTheme = "auto"
      description = "My new blog"

    [menu]
      [[menu.main]]
        identifier = "posts"
        name = "Posts"
        url = "/posts/"
        weight = 1
      [[menu.main]]
        identifier = "tags"
        name = "Tags"
        url = "/tags/"
        weight = 2
      [[menu.main]]
        identifier = "categories"
        name = "Categories"
        url = "/categories/"
        weight = 3
    ```

6.  **Create Your First Post:**
    Use the `hugo new` command to create a new content file. This will create a new Markdown file in the `content/posts/` directory.
    ```bash
    hugo new posts/my-first-post.md
    ```
    Now, open `content/posts/my-first-post.md` with a text editor. You will see some front matter (like `title`, `date`, `draft: true`). You can add your content below the front matter. To make the post visible, change `draft: true` to `draft: false`.

7.  **Start the Hugo Server:**
    Launch the local development server to see your website in action.
    ```bash
    hugo server -D
    ```
    The `-D` flag builds and serves drafts, which is useful for previewing your `my-first-post` before setting `draft: false`.

    Open your web browser and navigate to `http://localhost:1313/` to see your new blog.

## Automating Deployment with GitHub Actions

This guide explains how to automate the deployment of your Hugo site from a GitHub repository to a remote server. When you push new Markdown files (`.md`) to your repository, GitHub Actions will automatically build your site and deploy it.

### Prerequisites

*   Your Hugo project (e.g., the `blog` you created) is pushed to a GitHub repository.
*   You have a remote server (e.g., a VPS) with SSH access.
*   A web server (like Nginx or Apache) is installed and configured on your remote server to serve files from a specific directory (e.g., `/var/www/blog`).

### Step-by-Step Guide

#### Step 1: Push Your Hugo Project to GitHub

If you haven't already, push your local `blog` project to a new repository on GitHub.

1.  Go to [GitHub](https://github.com) and create a new repository (e.g., `my-hugo-blog`).
2.  In your local `blog` directory, link it to the GitHub repository and push your code.
    ```bash
    # Make sure you are in your project directory
    cd blog

    # If you haven't already, commit your files
    git add .
    git commit -m "Initial commit"

    # Link to your new GitHub repository and push
    git remote add origin https://github.com/YOUR_USERNAME/my-hugo-blog.git
    git branch -M main
    git push -u origin main
    ```

#### Step 2: Generate and Configure SSH Keys for Deployment

To allow GitHub Actions to securely connect to your remote server, you'll use an SSH key pair.

1.  **Generate a new SSH key pair:**
    Run the following command on your local machine. Do not add a passphrase when prompted, as this key will be used in an automated script.
    ```bash
    ssh-keygen -t rsa -b 4096 -C "github-actions-deploy" -f github-deploy-key
    ```
    This creates two files: `github-deploy-key` (the private key) and `github-deploy-key.pub` (the public key).

2.  **Add the Public Key to Your Server:**
    Copy the content of the public key (`github-deploy-key.pub`) and add it to the `~/.ssh/authorized_keys` file on your remote server.
    ```bash
    # On your local machine, display the public key
    cat github-deploy-key.pub

    # On your remote server, open the authorized_keys file
    # nano ~/.ssh/authorized_keys

    # Paste the public key content into the file and save it.
    ```

3.  **Add Secrets to Your GitHub Repository:**
    You need to securely store your private key and server details in your GitHub repository's secrets. Go to your repository on GitHub, then navigate to `Settings` > `Secrets and variables` > `Actions`.

    Create the following repository secrets:
    *   `SSH_PRIVATE_KEY`: Paste the entire content of your **private key** file (`github-deploy-key`).
    *   `SSH_HOST`: Enter the IP address or domain name of your remote server.
    *   `SSH_USER`: Enter the username you use to log in to your remote server (e.g., `root`, `ubuntu`).
    *   `DEPLOY_PATH`: Enter the absolute path on your server where the website files should be deployed (e.g., `/var/www/blog`).

#### Step 3: Create the GitHub Actions Workflow File

This workflow will build your Hugo site and use `rsync` to deploy it.

1.  In your local `blog` project, create a new directory structure: `.github/workflows/`.
2.  Inside the `workflows` directory, create a new file named `deploy.yml`.
3.  Paste the following content into `deploy.yml`:

    ```yaml
    name: Build and Deploy Hugo Site

    # Trigger the workflow on push events to the main branch
    on:
      push:
        branches:
          - main

    jobs:
      deploy:
        runs-on: ubuntu-latest
        steps:
          - name: Checkout Repository
            uses: actions/checkout@v4
            with:
              submodules: true  # Fetch Hugo themes (if they are submodules)
              fetch-depth: 0    # Fetch all history for .GitInfo and .Lastmod

          - name: Setup Hugo
            uses: peaceiris/actions-hugo@v3
            with:
              hugo-version: 'latest' # or a specific version like '0.128.0'
              extended: true

          - name: Build Site
            run: hugo --minify

          - name: Deploy to Server
            uses: appleboy/ssh-action@master
            with:
              host: ${{ secrets.SSH_HOST }}
              username: ${{ secrets.SSH_USER }}
              key: ${{ secrets.SSH_PRIVATE_KEY }}
              script: |
                # Use rsync to sync the public directory to the server
                # The --delete flag removes files on the server that are not in the source
                rsync -avz --delete public/ ${{ secrets.DEPLOY_PATH }}
    ```

#### Step 4: Commit and Push the Workflow

Commit the new workflow file and push it to your GitHub repository.

```bash
git add .github/workflows/deploy.yml
git commit -m "Add GitHub Actions workflow for deployment"
git push
```

### How It Works

Now, every time you push a change to your `main` branch (like adding a new post with `hugo new posts/my-new-awesome-post.md`, editing it, and pushing the commit), the following happens automatically:

1.  GitHub detects the push and triggers the `Build and Deploy Hugo Site` workflow.
2.  The workflow checks out your code, including the theme submodule.
3.  It builds your Hugo site into the `public` directory.
4.  It securely connects to your remote server using the SSH secrets you provided.
5.  It uses `rsync` to copy the contents of the `public` directory to the `DEPLOY_PATH` on your server, updating your live website.

You can monitor the progress and see the logs of each deployment in the "Actions" tab of your GitHub repository.
