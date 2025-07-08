# FabricPlayerViewerMod

A lightweight Fabric mod that exposes real-time Minecraft player data over a secure local HTTP API, for integration with external control panels and dashboards.

## Features

- ✅ View online players
- ✅ Inspect player inventories
- ✅ Track player coordinates and dimension
- ✅ Kick players with a custom message
- ✅ Send messages to players in-game

## API Endpoints

All endpoints are served on `http://127.0.0.1:8080`.

| Method | Endpoint                          | Description                          |
|--------|-----------------------------------|--------------------------------------|
| GET    | `/players`                        | Returns list of online players       |
| GET    | `/players/:uuid/inventory`        | Player inventory                     |
| GET    | `/players/:uuid/position`         | Player position + dimension          |
| POST   | `/players/:uuid/kick`             | Kicks a player with optional reason  |
| POST   | `/players/:uuid/message`          | Sends a private message              |

## Build Instructions

1. Ensure you have Java 17+ and Gradle installed.
2. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/FabricPlayerViewerMod.git
   cd FabricPlayerViewerMod
   ```
3. Build the mod:
   ```bash
   ./gradlew build
   ```

4. The output `.jar` file will be located in:
   ```
   build/libs/fabricplayerviewer-1.0.0.jar
   ```

## Installation

Copy the `.jar` file into your Minecraft server's `mods/` directory.

## Deployment Script

Run the included script to automate building and installation:

```bash
chmod +x install-mod.sh
sudo ./install-mod.sh
```

This will:
- Build the mod using Gradle
- Place the mod jar in `/opt/minecraft/mods`

## License

MIT License