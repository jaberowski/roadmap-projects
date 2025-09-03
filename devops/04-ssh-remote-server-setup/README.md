## SSH Remote Server Setup

### Step 1: Register and Set Up a Remote Linux Server

1. **Choose a Cloud Provider**: Select a cloud provider to host your remote Linux server. Some popular options include:

   - [DigitalOcean](https://www.digitalocean.com/): Offers $200 in free credits for new users.
   - [AWS](https://aws.amazon.com/): Provides a free tier for new accounts.
   - [Google Cloud](https://cloud.google.com/): Includes free credits for new users.

2. **Create a New Server Instance**:

   - Follow the provider's instructions to create a new Linux server instance.
   - Choose a lightweight Linux distribution like Ubuntu or CentOS for simplicity.

3. **Note Down Server Details**:

   - After the server is created, note down the public IP address and default login credentials (username and password or SSH key provided by the provider).

4. **Access the Server**:
   - Use the default credentials to log in to the server for the first time. For example:
     ```bash
     ssh user@server-ip
     ```
   - Replace `user` with the default username (e.g., `root` for DigitalOcean) and `server-ip` with the public IP address of your server.

Once the server is set up and accessible, proceed to the next step of generating SSH key pairs.

### Step 2: Generate Two SSH Key Pairs

SSH key pairs are a secure way to authenticate with a remote server. Each key pair consists of:

- **Private Key**: Kept secret and stored securely on your local machine.
- **Public Key**: Shared with the server to allow authentication.

#### Why Use SSH Key Pairs?

- They provide a more secure alternative to password-based authentication.
- They eliminate the need to repeatedly enter passwords.

#### Generate SSH Key Pairs

To create two SSH key pairs, follow these steps:

1. **Generate the First Key Pair**:
   Run the following command in your terminal:

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

   - `ssh-keygen`: The command to generate SSH key pairs.
   - `-t rsa`: Specifies the type of key to create (RSA in this case).
   - `-b 4096`: Sets the key length to 4096 bits for enhanced security.
   - `-C "your_email@example.com"`: Adds a comment (usually your email) to identify the key.

   When prompted:

   - Enter a file name to save the key (e.g., `~/.ssh/id_rsa_first`).
   - Optionally, set a passphrase for added security.

2. **Generate the Second Key Pair**:
   Repeat the process to create a second key pair:

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

   - Save this key with a different name (e.g., `~/.ssh/id_rsa_second`).

3. **Verify the Keys**:
   After generating the keys, you should have the following files:

   - `~/.ssh/id_rsa_first` (private key) and `~/.ssh/id_rsa_first.pub` (public key).
   - `~/.ssh/id_rsa_second` (private key) and `~/.ssh/id_rsa_second.pub` (public key).

   Use the `ls` command to list the files:

   ```bash
   ls ~/.ssh/
   ```

   You should see the newly created key files in the output.

Once the keys are generated, proceed to the next step to add them to your server.

### Step 3: Add the SSH Keys to the Server

To allow SSH access using the generated keys, you need to add the public keys to the server. Here are two methods to achieve this: the manual way and an easier automated way.

#### Manual Method

1. **Log in to the Server**:
   Use the default credentials provided by your cloud provider to log in to the server:

   ```bash
   ssh user@server-ip
   ```

   Replace `user` with the default username (e.g., `root`) and `server-ip` with the public IP address of your server.

2. **Create the `.ssh` Directory**:
   Ensure the `.ssh` directory exists and has the correct permissions:

   ```bash
   mkdir -p ~/.ssh
   chmod 700 ~/.ssh
   ```

   - `mkdir -p ~/.ssh`: Creates the `.ssh` directory if it doesn’t exist.
   - `chmod 700 ~/.ssh`: Sets the directory permissions to allow only the owner to access it.

3. **Add the Public Keys**:
   Append the public keys to the `authorized_keys` file:

   ```bash
   echo "<contents-of-id_rsa_first.pub>" >> ~/.ssh/authorized_keys
   echo "<contents-of-id_rsa_second.pub>" >> ~/.ssh/authorized_keys
   ```

   - Replace `<contents-of-id_rsa_first.pub>` and `<contents-of-id_rsa_second.pub>` with the actual contents of your public key files.
   - Use a text editor like `nano` or `vim` if you prefer to manually edit the file.

4. **Set Permissions**:
   Ensure the `authorized_keys` file has the correct permissions:
   ```bash
   chmod 600 ~/.ssh/authorized_keys
   ```
   - `chmod 600`: Ensures only the owner can read and write to the file.

#### Easier Method (Using `ssh-copy-id`)

1. **Use the `ssh-copy-id` Command**:
   From your local machine, run the following command to copy the public key to the server:

   ```bash
   ssh-copy-id -i ~/.ssh/id_rsa_first.pub user@server-ip
   ```

   - `-i ~/.ssh/id_rsa_first.pub`: Specifies the public key to copy.
   - `user@server-ip`: Replace with your server’s username and IP address.

2. **Repeat for the Second Key**:
   Run the command again for the second key:
   ```bash
   ssh-copy-id -i ~/.ssh/id_rsa_second.pub user@server-ip
   ```

#### Verify the Keys

After adding the keys, test the connection using each private key:

```bash
ssh -i ~/.ssh/id_rsa_first user@server-ip
ssh -i ~/.ssh/id_rsa_second user@server-ip
```

Both commands should allow you to log in to the server successfully.

Once the keys are added and verified, proceed to the next step to configure `~/.ssh/config` for easier access.

### Step 4: Configure `~/.ssh/config` for Easier Access

To simplify connecting to your server, you can configure the `~/.ssh/config` file on your local machine. This allows you to use an alias instead of typing the full command every time.

#### Steps to Configure `~/.ssh/config`

1. **Open the `~/.ssh/config` File**:
   If the file doesn’t exist, create it:

   ```bash
   nano ~/.ssh/config
   ```

   - Replace `nano` with your preferred text editor (e.g., `vim` or `code`).

2. **Add Configuration for the First Key**:
   Add the following lines to the file:

   ```
   Host server-alias-1
       HostName server-ip
       User user
       IdentityFile ~/.ssh/id_rsa_first
   ```

   - `Host server-alias-1`: The alias you’ll use to connect to the server.
   - `HostName server-ip`: The public IP address of your server.
   - `User user`: The username to log in (e.g., `root`).
   - `IdentityFile ~/.ssh/id_rsa_first`: The path to the private key.

3. **Add Configuration for the Second Key**:
   Similarly, add another block for the second key:

   ```
   Host server-alias-2
       HostName server-ip
       User user
       IdentityFile ~/.ssh/id_rsa_second
   ```

4. **Save and Exit**:
   Save the file and exit the editor.

5. **Set Correct Permissions**:
   Ensure the `~/.ssh/config` file has the correct permissions:
   ```bash
   chmod 600 ~/.ssh/config
   ```
   - `chmod 600`: Ensures only the owner can read and write to the file.

#### Test the Configuration

1. **Connect Using the Alias**:
   Use the alias to connect to your server:

   ```bash
   ssh server-alias-1
   ssh server-alias-2
   ```

2. **Verify the Connection**:
   Both commands should log you into the server using the respective SSH keys.

This configuration simplifies the process of connecting to your server and avoids the need to specify the full command each time.

### Stretch Goal: Install and Configure Fail2Ban

Fail2Ban is a security tool that helps prevent brute force attacks by monitoring log files and banning IPs that show malicious behavior.

#### Steps to Install and Configure Fail2Ban

1. **Update the Package List**:
   Run the following command to ensure your package list is up to date:

   ```bash
   sudo apt update
   ```

2. **Install Fail2Ban**:
   Install Fail2Ban using your package manager:

   ```bash
   sudo apt install fail2ban -y
   ```

   - `-y`: Automatically confirms the installation.

3. **Start and Enable Fail2Ban**:
   Ensure Fail2Ban starts on boot:

   ```bash
   sudo systemctl start fail2ban
   sudo systemctl enable fail2ban
   ```

4. **Configure Fail2Ban**:

   - Copy the default configuration file to create a local configuration:
     ```bash
     sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
     ```
   - Open the `jail.local` file for editing:
     ```bash
     sudo nano /etc/fail2ban/jail.local
     ```
   - Locate the `[sshd]` section and ensure it is enabled:
     ```
     [sshd]
     enabled = true
     port = ssh
     logpath = /var/log/auth.log
     maxretry = 5
     ```
     - `enabled = true`: Activates monitoring for SSH.
     - `maxretry = 5`: Bans an IP after 5 failed login attempts.

5. **Restart Fail2Ban**:
   Apply the changes by restarting the service:

   ```bash
   sudo systemctl restart fail2ban
   ```

6. **Verify Fail2Ban Status**:
   Check the status to ensure it is running:
   ```bash
   sudo fail2ban-client status
   ```
   - To view banned IPs for SSH, use:
     ```bash
     sudo fail2ban-client status sshd
     ```

#### Test Fail2Ban

1. **Simulate Failed Login Attempts**:

   - Use an incorrect password multiple times to trigger a ban.

2. **Check Banned IPs**:
   - Verify that the offending IP is banned using the `fail2ban-client` command.

By completing this stretch goal, you add an extra layer of security to your server, protecting it from brute force attacks.

### Project Reference

For more details about this project, visit the official project page: [SSH Remote Server Setup](https://roadmap.sh/projects/ssh-remote-server-setup)
