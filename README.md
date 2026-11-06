# Pac-Man Argon 1–256 Real-Time Perfect-Score Qualification Evidence

This repository preserves the complete, cryptographically attested **1x real-time campaign qualification evidence** and browser gameplay recordings for **Argon**, the deterministic real-time solver that achieves a continuous perfect score of **3,333,180 points** (`333,180` displayed on the 6-digit arcade counter) across all 256 levels of Pac-Man (`seed 5259587`, `schedulerPhase 42`).

---

## Certified Campaign Summary

| Metric | Certified Value |
| --- | --- |
| Qualification Mode | `realtime-continuous-game` (1x wall-clock `16.6667 ms` referee cadence) |
| Total Points Earned | **`3,333,180`** (`displayedScore: 333180`, 6-digit arcade counter rollover) |
| Campaign Span | Levels `1` through `256` (`endPhase: "game-over"`, `stopReason: "terminal-game-over"`) |
| Total Real-Time Ticks | `989,573` (`~4.58 hours` continuous 1x wall-clock run) |
| Perfect Flags | `perfect: true`, `complete: true`, `realTimeQualified: true`, **`perfectRealtime: true`** |
| Timing Discipline | `onTimeActions: 989573`, `missedActions: 0`, `staleActions: 0`, `rejectedActions: 0`, `illegalActions: 0`, `lateTicks: 0`, `tickWorkOverruns: 0` |
| Referee Clock Drift | `maximumLagMs: 15.265 ms` (budget `<= 16.667 ms`), `maximumTickWorkMs: 11.019 ms` |
| Worker `beforeTick` Latency | `989,574` turns · mean `0.0057 ms` · p50/p95/p99 `<= 0.125 ms` · max `1.821 ms` |
| Background Worker Jobs | `2,046` asynchronous jobs (`1,813` `score-v2`, `233` `score-cleanup`) · `2,046` delivered replies |
| Source Integrity | `sourceIdentityUnchanged: true` (candidate SHA-256 verified before and after the 4.5-hour run) |

---

## Repository Contents & SHA-256 Digests

### 1. Real-Time Campaign Qualification (`qualification/`)

| File | Size | SHA-256 | Description |
| --- | --- | --- | --- |
| `qualification/result.json` | `10.3 MB` (`10,288,794` B) | `3bc5ee499baf713cbc63104ae0c85ca8e8ecb99f72bf9048aaecef8742c7f89e` | Complete qualification report: referee/harness/candidate SHA-256 manifests, real-time deadline metrics, per-level obligation audit for all 256 boards, and replay attestations. |
| `qualification/trace.json.gz` | `2.2 MB` (`2,195,386` B) | `580b7b7f17e784ec91ff63cd3c2e664e5c5efbbd2ecd17428e832058ee6fde1d` | Compressed campaign trajectory trace (`989,573` ticks, `4,874` snapshots, `63,730` event batches, trajectory hash `f24d5888302def000537ee92464da569519bdcfc0e34b8b0acc380b113053e17`). |
| `qualification/player-protocol.jsonl.gz` *(reassembled or via GitHub Release `v1.0.0`)* | `149 MB` (`155,721,140` B) | `bdb8ca094a2f5d12e55b622b6139a9e80a212f84d36a1e8c182b3dd459aeac4b` | Complete `3,962,392`-event worker protocol transcript recording every `init`, `beforeTick` observation, nested worker job request, asynchronous reply delivery, and controller decision across all `989,574` turns. |
| `qualification/player-protocol.jsonl.gz.part-aa` & `.part-ab` | `80 MB` + `69 MB` | — | Split chunks of `player-protocol.jsonl.gz` (`<100 MB` each for standard Git clones). Run `./qualification/reassemble-protocol.sh` to reconstruct and verify `player-protocol.jsonl.gz`. |

### 2. Browser 1x Real-Time Gameplay Videos (`videos/`)

| File | Size | SHA-256 | Description |
| --- | --- | --- | --- |
| `videos/argon-level-1-perfect-14800.webm` | `17.3 MB` (`18,137,103` B) | `e03d48c8dead541618fe0935daca8039b8ca7cf13b9909e7bcbdc3e17acebf78` | Live browser recording of Argon clearing **Level 1** with a perfect score of **`14,800` points** (`240` dots, `4` energizers, `2` cherries, and all `4` ghost chains of `200/400/800/1600`). |
| `videos/argon-level-255-perfect-12600.webm` | `8.8 MB` (`9,237,803` B) | `bd39ca08c0977ae833a04a6773f8970c528e2c608b07d2d77673c7eb16b54591` | Live browser recording of Argon clearing **Level 255** (the final full maze before the Level 256 split-screen board) with a perfect score of **`12,600` points** (`240` dots, `4` energizers, and both `5,000`-point keys). |

### 3. Documentation (`docs/`)

- `docs/argon-architecture-brief.md` — Technical overview of the Argon hybrid planning architecture, asynchronous Web Worker separation, and Level 256 multi-life sweep.
- `docs/argon-campaign-qualification.md` — Detailed breakdown of the two-layer qualification and replay verification architecture.

---

## Independent Verification Instructions

You can independently verify the evidence in this repository using either [`pacman-argon-complete`](https://github.com/crispierry/pacman-argon-complete) or [`pacman-harness`](https://github.com/crispierry/pacman-harness).

### Step 1: Reassemble `player-protocol.jsonl.gz`

After cloning this repository, reassemble and checksum-verify the 149 MB worker protocol transcript (or download it directly from the [v1.0.0 GitHub Release](https://github.com/crispierry/pacman-evidence/releases/tag/v1.0.0)):

```bash
./qualification/reassemble-protocol.sh
```

### Step 2: Verify Outcome Replay (`replay-score-campaign.js`)

Re-simulates all `989,573` recorded legal controls against the independent referee (`refereeIdentity.sha256: 070c69019f30c16e19d1aaa3ea71c21f92c3ef4dda48999fcf12689a55b39a36`) and verifies every periodic snapshot (`4,874`), event batch (`63,730`), trajectory hash (`f24d5888302def000537ee92464da569519bdcfc0e34b8b0acc380b113053e17`), and the final score of `3,333,180`:

```bash
cd /path/to/pacman-argon-complete
node -e '
import("./scripts/replay-score-campaign.js").then(async ({ replayScoreCampaignFile }) => {
  const res = await replayScoreCampaignFile("/path/to/pacman-evidence/qualification/trace.json.gz");
  console.log(res);
});
'
```

### Step 3: Verify Deterministic Policy Transcript Replay (`replay-score-campaign-player.js`)

Reconstructs the candidate controller (`candidateIdentity.sha256: 439583c4161bccfaf4d3fefebb76fe6913ce163bd0942fd258e1a0720f773e76`) from fresh private memory and replays all `989,574` turns and `2,046` asynchronous worker job deliveries at their exact recorded tick boundaries, confirming that every single controller decision and outbound worker request matches the recorded 1x real-time transcript (`unrecordedGeneratedOutputs: 0`):

```bash
cd /path/to/pacman-argon-complete
node -e '
import("./scripts/replay-score-campaign-player.js").then(async ({ replayScoreCampaignPlayerDirectory }) => {
  const res = await replayScoreCampaignPlayerDirectory(
    "/path/to/pacman-evidence/qualification",
    { sourcePath: "src/players/argon" }
  );
  console.log(res);
});
'
```

---

## License

Released under the [MIT License](./LICENSE).
