# Pac-Man Argon 1–256 Real-Time Perfect-Score & 3,333,360 World Record Evidence

This repository preserves the complete, cryptographically attested **1x real-time campaign qualification evidence** and browser gameplay recordings (`.mp4` H.264 & `.webm`) for **Argon** (built with **Google Gemini Argon**), the deterministic real-time solver that achieves:

- **`3,333,360` points** (`333,360` on the 6-digit arcade counter) across all 256 levels under the **5-life arcade DIP-switch setting** (5 starting lives + 1 bonus life at 10,000 = 6 total lives, `991,325` ticks, matching Billy Mitchell's 1999 Twin Galaxies world record).
- **`3,333,180` points** (`333,180` on the 6-digit arcade counter) across all 256 levels under the **standard 3-life factory DIP-switch setting** (3 starting lives + 1 bonus life at 10,000 = 4 total lives, `989,573` ticks).

---

## Certified Campaign Summary

| Metric | 5-Life DIP Switch (World Record) | 3-Life Factory Default |
| --- | --- | --- |
| Total Points Earned | **`3,333,360`** (`displayedScore: 333360`) | **`3,333,180`** (`displayedScore: 333180`) |
| Starting / Total Lives | `5` starting + `1` extra (`10,000`) = `6` lives | `3` starting + `1` extra (`10,000`) = `4` lives |
| Boards 1–255 Score | `3,326,600` (`0` deaths, `272/272` blue ghosts, `510/510` fruits) | `3,326,600` (`0` deaths, `272/272` blue ghosts, `510/510` fruits) |
| Board 256 Split-Screen Score | `6,760` (`6,400` + `4 × 90` from 9-dot respawns) | `6,580` (`6,400` + `2 × 90` from 9-dot respawns) |
| Total Real-Time Ticks | `991,325` (`~4.59 hours` at 60 Hz) | `989,573` (`~4.58 hours` at 60 Hz) |
| Obligation Losses | `0` | `0` |
| Timing Discipline | `0` missed / late / rejected actions | `onTimeActions: 989573`, `missedActions: 0`, `lateTicks: 0` |
| Worker `beforeTick` Latency | Sub-millisecond (`< 16.5 ms` budget) | mean `0.0057 ms` · p99 `<= 0.125 ms` · max `1.821 ms` |

---

## Repository Contents & SHA-256 Digests

### 1. Real-Time Campaign Qualification (`qualification/`)

| File | Size | SHA-256 | Description |
| --- | --- | --- | --- |
| `qualification/argon-3333360-5life-inputs.bin` | `968 KB` (`991,325` B) | `5567d1feb6d3874a87e9eb131371b756955822df8ce086595571d5e49fc7fe0b` | Complete `991,325`-tick directional input stream for the 5-life `3,333,360` World Record continuous run (`seed 0x504143`, `schedulerPhase 42`, `lives 5`). |
| `qualification/argon-3333360-5life-world-record-summary.json` | `32 KB` | `db0b722cdec1c32a212764049e1adb240cbf533c19f8745c2c65f26a0faab535` | Per-board start/end tick & cumulative score ledger across all 256 boards and million-point milestones for the `3,333,360` World Record run. |
| `qualification/result.json` | `10.3 MB` (`10,288,794` B) | `3bc5ee499baf713cbc63104ae0c85ca8e8ecb99f72bf9048aaecef8742c7f89e` | Complete 3-life qualification report (`3,333,180`): referee/harness/candidate SHA-256 manifests, real-time deadline metrics, per-level obligation audit for all 256 boards, and replay attestations. |
| `qualification/trace.json.gz` | `2.2 MB` (`2,195,386` B) | `580b7b7f17e784ec91ff63cd3c2e664e5c5efbbd2ecd17428e832058ee6fde1d` | Compressed campaign trajectory trace (`989,573` ticks, `4,874` snapshots, `63,730` event batches, trajectory hash `f24d5888302def000537ee92464da569519bdcfc0e34b8b0acc380b113053e17`). |
| `qualification/player-protocol.jsonl.gz` *(reassembled or via GitHub Release `v1.0.0`)* | `149 MB` (`155,721,140` B) | `bdb8ca094a2f5d12e55b622b6139a9e80a212f84d36a1e8c182b3dd459aeac4b` | Complete `3,962,392`-event worker protocol transcript recording every `init`, `beforeTick` observation, nested worker job request, asynchronous reply delivery, and controller decision across all `989,574` turns. |
| `qualification/player-protocol.jsonl.gz.part-aa` & `.part-ab` | `80 MB` + `69 MB` | — | Split chunks of `player-protocol.jsonl.gz` (`<100 MB` each for standard Git clones). Run `./qualification/reassemble-protocol.sh` to reconstruct and verify `player-protocol.jsonl.gz`. |

### 2. Browser Gameplay Videos (`videos/` and [GitHub Release `v1.0.0`](https://github.com/crispierry/pacman-evidence/releases/tag/v1.0.0))

All `.mp4` videos are encoded at `1280×720` (`60 fps`, H.264 `avc1`) with the **7-digit full scoreboard (`3,333,360`)** and live verification telemetry panel for direct sharing on LinkedIn, X, and YouTube.

| File | Duration / Size | SHA-256 | Description |
| --- | --- | --- | --- |
| `videos/argon-world-record-3333360-social-cut.mp4` | `2m 06s` (`50.4 MB`) | `52d0975ded29f7cd7604c0c9694a94a5f84af878247e05202aa8db0cac71e429` | Continuous 1–256 World Record (`3,333,360`) highlight & timelapse cut sized for X (`< 2:20`), LinkedIn, and YouTube: Chapter 1 Board 1 (`14,800`), Chapter 2 Board 18 final 1-second blue-ghost herding (`24,600`), Chapter 3 Boards 19–254 zero-fright marathon (`1M -> 2M -> 3M`), Chapter 4 Board 255 clear (`3,326,600`), and Chapter 5 Board 256 6-life finale (`3,333,360`). |
| `argon-world-record-3333360-8x.mp4` *(in Release `v1.0.0`)* | `34m 27s` (`864.9 MB`) | `c915233b88f878875a8233e2b8556014a831b43a84265563a0bd4b6bb9a1d228` | Complete, unedited continuous Boards 1–256 World Record run at `8×` speed (`124,036` frames at 60 fps) with the 7-digit scoreboard counting continuously from `0` to `3,333,360`. |
| `videos/argon-level-1-perfect-14800.mp4` | `2m 05s` (`24.1 MB`) | `34da52fe10234d61acaad921d2420db03c75b3895573a72f96d4163ca1368787` | 1x real-time `.mp4` recording of **Level 1** (`14,800` points: `240` dots, `4` energizers, `2` cherries, and all `4` four-ghost chains). |
| `videos/argon-level-18-perfect-24600.mp4` | `2m 09s` (`26.4 MB`) | `12f6978d7a697428c75934e9180f55111d5c20f1317bfd95985b3a0c47c292bf` | 1x real-time `.mp4` recording of **Level 18** (`24,600` points: the final board in Pac-Man where ghosts turn blue, with only `1.0 second` of fright time per energizer). |
| `videos/argon-level-255-perfect-12600.mp4` | `1m 02s` (`13.0 MB`) | `39317cb502108619558c66aca5036acecf9306f2a94be14e433eaf34ed22990c` | 1x real-time `.mp4` recording of **Level 255** (`12,600` points: `0` seconds of fright time so ghosts never turn blue; `2,400` dots + `200` energizers + `10,000` for two Keys). |
| `videos/argon-level-1-perfect-14800.webm` | `2m 04s` (`17.3 MB`) | `e03d48c8dead541618fe0935daca8039b8ca7cf13b9909e7bcbdc3e17acebf78` | Original `.webm` browser capture of Level 1 (`14,800` points). |
| `videos/argon-level-255-perfect-12600.webm` | `1m 01s` (`8.8 MB`) | `bd39ca08c0977ae833a04a6773f8970c528e2c608b07d2d77673c7eb16b54591` | Original `.webm` browser capture of Level 255 (`12,600` points). |

### 3. Documentation (`docs/`)

- `docs/argon-architecture-brief.md` — Technical overview of the Argon hybrid planning architecture, asynchronous Web Worker separation, and Level 256 multi-life sweep.
- `docs/argon-campaign-qualification.md` — Detailed breakdown of the two-layer qualification and replay verification architecture.

---

## Independent Verification Instructions

You can independently verify the evidence in this repository using either [`pacman-argon-complete`](https://github.com/crispierry/pacman-argon-complete) or [`pacman-harness`](https://github.com/crispierry/pacman-harness).

### Verify the 5-Life `3,333,360` World Record Run

```bash
cd /path/to/pacman-argon-complete
node scripts/evaluate-argon.js --lives 5
```

### Verify the 3-Life `3,333,180` Outcome & Policy Transcript Replays

```bash
./qualification/reassemble-protocol.sh
```

```bash
cd /path/to/pacman-argon-complete
node -e '
import("./scripts/replay-score-campaign.js").then(async ({ replayScoreCampaignFile }) => {
  const res = await replayScoreCampaignFile("/path/to/pacman-evidence/qualification/trace.json.gz");
  console.log(res);
});
'
```

---

## License

Released under the [MIT License](./LICENSE).
