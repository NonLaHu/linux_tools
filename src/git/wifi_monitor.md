# wifi_monitor

**Repo:** https://github.com/NonLaHu/wifi_monitor
**Visibility:** Private
**Stack:** Node.js, Fastify, React, Vite, Server-Sent Events

A real-time Wi-Fi and connected-device dashboard for ZTE F600W / ZXHN GPON routers. It logs into the router admin page, polls SSID traffic and client data every 2.5 seconds, and streams updates to a React dashboard.

## Requirements

- Node.js and npm
- Network access to the router admin page (default `https://192.168.1.1`)
- A supported router: currently the ZTE F600W adapter

## Clone

The repository is private, so authenticate first:

```bash
gh repo clone NonLaHu/wifi_monitor
cd wifi_monitor
```

Or use `git clone git@github.com:NonLaHu/wifi_monitor.git` with SSH keys.

## Install

```bash
npm install
npm install --prefix client
npm run build
```

The production frontend is committed under `client/dist`, but rebuilding is recommended after frontend changes.

## Run

```bash
npm start
```

Open <http://localhost:3000>.

Development mode:

```bash
npm run dev:server   # backend with file watching
npm run dev:client   # Vite frontend dev server
```

## Configure

1. Open the dashboard and choose the profile manager.
2. Add a profile with the router service (`ZTE F600W`), base URL, admin username, and password.
3. Activate the profile. The server logs in and starts polling.

Profiles are persisted in `server/data/profiles.json`. That file can contain router credentials and must stay out of public commits.

## Adding Router Support

1. Create `server/services/adapters/<name>Adapter.js` extending `BaseRouterAdapter`.
2. Implement `login`, `ensureSession`, `getSsids`, `getSsidStats`, `getClients`, and `getLiveSummary`.
3. Register the service in `server/services/profileService.js` (`SUPPORTED_SERVICES`).
4. Register the adapter constructor in `server/services/routerService.js`.

## Notes

- The ZTE adapter handles token generation, SHA-256 session handshakes, and self-signed router certificates.
- Keep this repository private: local profile data may include live router credentials.
- The README in the repository contains the full architecture and feature list.
