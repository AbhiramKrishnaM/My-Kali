# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This repo is a personal Kali Linux learning environment running inside Docker. The goal is to practice Linux commands and security tooling in an isolated, reproducible container.

## Key Commands

Shortcuts are available via `make`:

| Command        | What it does                                      |
|----------------|---------------------------------------------------|
| `make build`   | Build the Docker image                            |
| `make up`      | Start the container in the background             |
| `make down`    | Stop and remove the container                     |
| `make shell`   | Enter an interactive Kali bash shell              |
| `make rebuild` | Rebuild the image and restart the container       |
| `make logs`    | Tail container logs                               |

**First-time setup (slow — downloads Kali + all tools):**
```bash
make build && make up
```

## Architecture

- `Dockerfile` — defines the image. Based on `kalilinux/kali-rolling`. Installs `kali-linux-default`, `kali-tools-top10`, and tool groups for web, passwords, and wireless.
- `docker-compose.yml` — runs the container (`kali-lab`) with `network_mode: host` and two bind-mounted volumes for persistence.

## Persistence Model

Only two directories survive container restarts:

| Host path | Container path | Purpose |
|---|---|---|
| `./workspace/` | `/root/workspace` | Personal scripts and files |
| `./tools/` | `/root/tools` | Custom downloaded tools |

System-level changes (e.g. `apt install` inside the container) are lost on `docker compose down`. To make them permanent, add them to the `Dockerfile` and rebuild.

## macOS Note

`network_mode: host` does not behave the same on macOS as on Linux — Docker Desktop uses a Linux VM as an intermediary. Host-network scanning tools (e.g. nmap against the local subnet) may have limited reach.
