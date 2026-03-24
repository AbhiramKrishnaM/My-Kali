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

## Building a Full Hacking Lab

A single Kali container is great for learning Linux, but for practicing actual hacking you need target machines too. Here are your options:

### Option 1: Docker Compose with multiple containers (recommended to start)

Add vulnerable target machines as separate containers in `docker-compose.yml` on a shared private network. Kali attacks them — completely isolated from your real network.

Popular ready-made vulnerable containers:

| Container | What it teaches |
|---|---|
| `ghcr.io/digininja/dvwa` | Web hacking (SQLi, XSS, file upload, etc.) |
| `webgoat/webgoat` | OWASP web vulnerabilities |
| `bkimminich/juice-shop` | OWASP Juice Shop — more web hacking |
| `tleemcjr/metasploitable2` | Network/service exploitation |

### Option 2: Virtual Machines (more realistic, heavier)

Use **VirtualBox** (free) with:
- Kali Linux VM as the attacker
- **Metasploitable2/3** as a vulnerable Linux server
- **VulnHub** VMs — hundreds of downloadable targets at [vulnhub.com](https://vulnhub.com)

More realistic than Docker (full OS, real network stack) but uses more RAM and disk.

### Option 3: Online Platforms (zero setup)

| Platform | Notes |
|---|---|
| [TryHackMe](https://tryhackme.com) | Best for beginners — guided learning paths |
| [HackTheBox](https://hackthebox.com) | More challenging, CTF-style machines |
| [PentesterLab](https://pentesterlab.com) | Web-focused, great for learning |

No local setup needed — they provide a VPN and cloud-hosted target machines.

---

## Notes

- `network_mode: host` on macOS works through Docker Desktop's Linux VM — host-network scanning tools may have limited reach compared to native Linux.
- `workspace/` and `tools/` are gitignored and will not be committed.
