# Kali Linux Learning Environment

A personal Kali Linux lab running inside Docker. Built for learning Linux commands and security tooling in an isolated, reproducible environment.

## Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Mac/Windows/Linux)
- `make` (pre-installed on macOS via Xcode Command Line Tools)

## Getting Started

**1. Build the image** (first time only — downloads Kali + all tools, will take a while):
```bash
make build
```

**2. Start the container:**
```bash
make up
```

**3. Enter the Kali shell:**
```bash
make shell
```

You're now inside a full Kali Linux environment.

## Commands

| Command        | Description                                 |
|----------------|---------------------------------------------|
| `make build`   | Build the Docker image                      |
| `make up`      | Start the container in the background       |
| `make down`    | Stop and remove the container               |
| `make shell`   | Open an interactive Kali bash shell         |
| `make rebuild` | Rebuild image and restart (after Dockerfile changes) |
| `make logs`    | Tail container logs                         |

## Persistence

Only two directories survive container restarts — everything else resets:

| Host (your Mac)  | Inside Kali        | Use for                        |
|------------------|--------------------|--------------------------------|
| `./workspace/`   | `/root/workspace`  | Your scripts, notes, practice files |
| `./tools/`       | `/root/tools`      | Custom tools you download      |

> To make system-level changes permanent (e.g. a new `apt install`), add them to the `Dockerfile` and run `make rebuild`.

## Included Tools

Installed via official Kali meta-packages:

- **`kali-linux-default`** — core Kali toolset (nmap, metasploit, wireshark, burpsuite, sqlmap, aircrack-ng, and more)
- **`kali-tools-top10`** — the 10 most popular Kali tools
- **`kali-tools-web`** — web application testing tools
- **`kali-tools-passwords`** — password cracking (john, hashcat, hydra)
- **`kali-tools-wireless`** — wireless testing (aircrack-ng, wifite)

## Project Structure

```
.
├── Dockerfile          # Kali image definition + tool installs
├── docker-compose.yml  # Container config (volumes, networking)
├── Makefile            # Shortcut commands
├── workspace/          # Your files (gitignored, persisted)
└── tools/              # Custom tools (gitignored, persisted)
```

## Notes

- `network_mode: host` on macOS works through Docker Desktop's Linux VM — host-network scanning tools may have limited reach compared to native Linux.
- `workspace/` and `tools/` are gitignored and will not be committed.
