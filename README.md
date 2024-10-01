# Domain Enumeration with crt.sh

This is a small Bash script that fetches data from the crt.sh website. This script is an improved version of 1N3/crt.sh, where I added functions and validation for better usability.

## Features
- Fetches all certificate sub-domains from crt.sh for a targeted domain.
- Includes functions for better organization and validation.
- Simple output format for easy reading.

## Prerequisites
- Bash shell
- `curl` (installed by default on most Linux and macOS systems)

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/B-Shresth12/crt.sh.git
   cd crt.sh
   ```

2. Make the script executable:
   ```bash
   chmod +x crt.sh
   ```

## Usage
To use the script, run the following command:
```bash
./crt.sh example.com
```
Replace `example.com` with the domain you want to enumerate.

### Example
```bash
./crt.sh example.com
```
The script will output all SSL certificates associated with `example.com`.

## Original Code
To view the original gist of the code, click [here](https://github.com/1N3/crt.sh).

## License
This project is licensed under the MIT License.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request.

### How to Use
- Copy the text above and paste it into your `README.md` file for your crt.sh Bash script project.
- Adjust any details as necessary, like the repository name or any specific features you want to highlight.

Let me know if you need any further modifications or additional help!
