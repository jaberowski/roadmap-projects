# Static Site Server

This project will guide you through setting up a basic Linux server and configuring it to serve a static site using Nginx. You will also learn how to use `rsync` to deploy your changes to the server.

## Goal

The goal of this project is to help you:

- Understand the basics of setting up a web server.
- Serve a static site using Nginx.
- Use `rsync` to deploy changes to the server.

---

## Requirements

1. **Register and Setup a Remote Linux Server**

   - Use any cloud provider (e.g., DigitalOcean, AWS, or others).
   - DigitalOcean offers $200 in free credits for new users.
   - Ensure you can connect to your server using SSH.

2. **Install and Configure Nginx**

   - Install Nginx on your server.
   - Configure it to serve a static site.

3. **Create a Simple Webpage**

   - Build a basic webpage using HTML, CSS, and images.
   - Ensure the files are ready to be deployed.

4. **Deploy Using Rsync**

   - Use `rsync` to sync your local static site files to the server.
   - Automate this process using the provided `deploy.sh` script.

5. **Optional: Use a Domain Name**
   - If you have a domain name, point it to your server.
   - Alternatively, serve the static site using the server's IP address.

---

## Step-by-Step Instructions

### 1. Setup the Server

- Register for a cloud provider account (e.g., DigitalOcean, AWS).
- Create a new Linux server instance.
- Connect to the server using SSH:
  ```bash
  ssh username@your-server-ip
  ```

### 2. Install Nginx

- Update the package list:
  ```bash
  sudo apt update
  ```
- Install Nginx:
  ```bash
  sudo apt install nginx
  ```
- Start and enable Nginx:
  ```bash
  sudo systemctl start nginx
  sudo systemctl enable nginx
  ```

### 3. Configure Nginx

Nginx is a powerful and widely-used web server that can serve static files efficiently. In this step, you will configure Nginx to serve your static site.

- **Create a configuration file for your static site:**  
  Configuration files in Nginx define how the server should handle requests. You will create a new configuration file for your static site:

  ```bash
  sudo nano /etc/nginx/sites-available/static-site
  ```

- **Add the following configuration:**  
  This configuration tells Nginx to listen on port 80 (default HTTP port) and serve files from the `/var/www/static-site` directory. Replace `your-domain.com` with your domain name or server IP address.

  ```nginx
  server {
      listen 80;
      server_name your-domain.com; # Replace with your domain or server IP

      root /var/www/static-site;
      index index.html;

      location / {
          try_files $uri $uri/ =404; # Ensures only valid files are served
      }
  }
  ```

  - **Explanation:**
    - `listen 80;` specifies the port Nginx will listen on.
    - `server_name` defines the domain or IP address for the server.
    - `root` specifies the directory containing your static site files.
    - `try_files` ensures that only existing files are served, and invalid requests return a 404 error.

- **Enable the configuration:**  
  To activate the configuration, create a symbolic link to the `sites-enabled` directory and test the configuration for errors:
  ```bash
  sudo ln -s /etc/nginx/sites-available/static-site /etc/nginx/sites-enabled/
  sudo nginx -t # Test the configuration for syntax errors
  sudo systemctl reload nginx # Reload Nginx to apply changes
  ```

### 4. Create Your Static Site

A static site consists of HTML, CSS, and optionally JavaScript files that do not require server-side processing. In this step, you will create a simple static site on your local machine.

- **Create a directory for your static site:**  
  This directory will contain all the files for your website:

  ```bash
  mkdir static-site
  cd static-site
  ```

- **Add your `index.html` file:**  
  The `index.html` file is the entry point for your website. Create a basic HTML file:

  ```html
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>My Static Site</title>
      <link rel="stylesheet" href="styles.css" />
    </head>
    <body>
      <h1>Welcome to My Static Site</h1>
      <p>This is a simple static site served using Nginx.</p>
      <img src="image.jpg" alt="Sample Image" />
    </body>
  </html>
  ```

- **Add a CSS file:**  
  Create a `styles.css` file to style your webpage:

  ```css
  body {
    font-family: Arial, sans-serif;
    text-align: center;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
  }

  h1 {
    color: #333;
  }
  ```

- **Add an image (optional):**  
  Place an image file (e.g., `image.jpg`) in the same directory to use in your webpage.

- **Test your site locally:**  
  Open the `index.html` file in your browser to ensure everything looks correct before deploying it to the server.

### 5. Deploy Using Rsync

- Use the `deploy.sh` script to sync your local files to the server:
  ```bash
  ./deploy.sh
  ```

### 6. Test Your Site

- Open your browser and navigate to your domain or server IP.
- Verify that your static site is being served.

---

## Additional Notes

- If you have a domain name, update your DNS records to point to your server's IP.
- Use `sudo certbot` to set up HTTPS for your site (optional but recommended).

---

## Project Source

For more details about this project, visit the source: [Static Site Server Project](https://roadmap.sh/projects/static-site-server)

---

This guide should help you complete the project and gain a solid understanding of setting up a static site server with Nginx.
