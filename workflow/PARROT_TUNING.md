# Parrot recognition tuning

This doc explains how your Parrot patterns work and why recognition can feel inconsistent. Your patterns live in **`~/.talon/parrot/patterns.json`** (not in this repo). Use **`talon.log`** (from the end, ParrotFrame lines) to see what the model actually outputs; optionally use `workflow/sounds_test.log` and “clear sound log” to see which patterns fired.

## How it works

1. **Model** outputs a frame every ~16 ms with class probabilities (e.g. `shh=0.99`, `sss=0.5`, `whistle=0.1`) and `power`, `f0`, `f1`, `f2`.
2. **Patterns** in `patterns.json` define _pattern names_ (e.g. `shh_loud`, `sss_soft`). Each pattern:
   - Lists **sounds** (model class names, e.g. `["shh"]`).
   - Has **threshold** (and optional **grace_threshold**): e.g. `>probability` 0.5, `>power` 50.
   - Can have **detect_after** (seconds): sound must meet threshold _continuously_ for this long before the pattern fires.
   - Can have **throttle**: after this pattern fires, other patterns are blocked for N **seconds** (e.g. `"speech": 5` = 5 s).
3. **Your integration** (`~/.talon/user/parrot_integration.py`): when a pattern’s thresholds are met for `detect_after` seconds, it fires once; Talon then emits `pattern`, `pattern:repeat` (while held), `pattern:stop` (on release). Throttle applies to _other_ patterns (and optionally self).

## Test protocol (3 of each, in patterns.json order)

Sounds were tested **3 times each**, in **top‑to‑bottom order** of `patterns.json`:

1. **speech** (3×)
2. **clop** (3×)
3. **kuh** (3×)
4. **motor** (3×)
5. **shh_loud** (3×)
6. **shh_soft** (3×)
7. **sss_loud** (3×)
8. **sss_soft** (3×)
9. **spit** (3×)
10. **whistle_high** (3×)
11. **whistle_low** (3×)

Analysis below is from the **end of `talon.log`** (ParrotFrame lines only), working backward in time.

## What your talon.log shows (ParrotFrame analysis)

From the end of `talon.log`, frame-by-frame:

- **speech** – Many frames with `speech` 0.93–0.99 and power 76–185. Threshold `>probability` 0.70 is easily met → **speech fires** as intended.

- **clop** – Max `clop` in the log is ~0.48 (e.g. 0.408, 0.481 in a burst around 00:28:08.834–864). Pattern requires `>probability` 0.80 and `>power` 10 → **clop never reaches 0.80**, so **clop does not fire** for the attempted clops.

- **kuh** – Peaks at 0.98–0.99 in short bursts (e.g. 00:28:24.823–898, 00:28:25.258–303, 00:28:40.154). Pattern: `>probability` 0.95, `>power` 10, **no** `detect_after` → a single confident frame can trigger → **kuh fires**, often in bursts or repeats.

- **motor** – Sustained runs above 0.88 for well over 0.2 s (e.g. 00:28:26.281–370, 00:28:27.418–508, 00:28:29.010–023). Pattern: `>probability` 0.88, `detect_after` 0.2 → **motor fires** as intended.

- **shh_loud** – Requires `>power` 100, `>probability` 0.2, and `detect_after` 0.3 s. In the log, strong `shh` runs (0.89–1.0) often have power in the 44–97 range; only occasionally one frame above 100 (e.g. 102.3 at 00:28:31.605) then power drops. So **shh_loud rarely or never gets 0.3 s above power 100** → **shh_loud does not fire** for the attempted loud shhs.

- **shh_soft** – Requires `<power` 100, `>probability` 0.2, `detect_after` 0.3. Long stretches of `shh` 0.98–1.0 with power 44–77 (e.g. 00:28:33.733–898, 00:28:35.521–818) → **shh_soft fires**; your “shh” attempts land in the soft band.

- **sss_loud** – Requires `>power` 50, `>probability` 0.5, `detect_after` 0.3. Clear runs with `sss` 0.93–0.98 and power 77–97 (00:28:08.098–130), 84–90 (00:28:48.599–628), and 69–116 (00:29:02.984–03.254) → **sss_loud fires** when you hiss with enough power.

- **sss_soft** – Requires `<power` 50, `>probability` 0.5, `detect_after` 0.3. When power stays in the 20–50 range with `sss` > 0.5 (e.g. 00:28:48.733 power 42.8, 00:28:51.525–628 power 11–33), **sss_soft can fire**; boundary at 50 is tight so small level changes flip loud vs soft.

- **spit** – Pattern: `>power` 50, `>probability` 0.80. In the log, `spit` tops out around 0.65 (e.g. 0.550, 0.538, 0.569, 0.650). **Spit never reaches 0.80** → **spit does not fire** for the attempted spits.

- **whistle_high / whistle_low** – Both require `>probability` 0.8 on `whistle`; high uses `>f0` 1240, low uses `<f0` 1000. The only frame with `whistle` > 0.8 is at 00:29:07.452: `whistle=0.989`, **f0=1090.2**, power=15.4. So f0 sits **between 1000 and 1240** → **neither** whistle_high nor whistle_low fires (and power &lt; 20 fails the power threshold anyway). **Whistle almost never fires** due to strict probability and the f0 dead zone.

- **detect_after: 0.3** for shh and sss means you must hold the sound for **0.3 s** before it fires; short taps won’t register.

- **Throttle `"speech": 5`** after shh/sss/kuh/etc. means after any of these noises, _speech_ is suppressed for 5 s, which can make voice feel “messed up” right after a noise.

## Could this be microphone positioning?

**Yes.** If Parrot “used to work before,” a change in mic setup is a plausible cause. The model only sees what the mic picks up; position, distance, and gain directly affect:

- **Power** – Farther away or off-axis → lower power. That can explain:
  - **clop** / **spit** never reaching 0.80 (weaker signal → lower confidence).
  - **shh_loud** never sustaining power > 100 for 0.3 s (your shh lands in the 44–97 range).
- **Class probabilities** – Angle and room tone can change how “clean” a sound looks to the model, so clop/spit/whistle may peak lower than they did when the mic was in a different spot.
- **f0** – For whistle, mic position can change which harmonics dominate, so f0 can shift (e.g. into the 1000–1240 gap).

**Things to try:**

1. **Distance** – Move the mic slightly **closer** to your mouth (or to where you make the noise). Same sound will show higher power and often higher confidence.
2. **Angle** – Point the mic at your mouth; avoid speaking or making noises from the side or from behind the mic.
3. **Gain** – In system sound settings or the mic’s own control, check that input gain hasn’t been turned down. If it was higher before, that would explain lower power and probabilities now.
4. **Consistency** – Re-run the same test (3 of each, in order) with the mic in the “old” position if you remember it, and compare the **end of `talon.log`** again: look at `power` and the class values (clop, spit, shh, whistle) for the same sounds.

You can **both** improve mic position **and** apply the threshold tweaks in this doc (e.g. lower clop/spit/whistle probability, or shh power boundary). Often the best result is a bit of each.

## Why it feels “messed up”

1. **clop** and **spit** – Probability thresholds (0.80) are above what the model outputs in this log (clop ~0.48, spit ~0.65) → those patterns never fire.
2. **Whistle** – Probability 0.8 is rarely met; when it is (once), f0=1090 falls in the gap between whistle_low (&lt;1000) and whistle_high (&gt;1240) → neither fires.
3. **Shh loud/soft** – Power boundary at 100 is harsh; your “shh” often sits below 100, so only shh_soft fires.
4. **Sss loud/soft** – Boundary at 50 works but is sensitive; small level changes flip which pattern fires.
5. **kuh** – No `detect_after` and high confidence (0.95) → single-frame or burst triggers and repeats.
6. **5 s speech throttle** – Voice is blocked 5 s after any of these noises.

## Suggested changes in `~/.talon/parrot/patterns.json`

Apply these in your **user** `patterns.json` (not in community). Reload Talon or re-save the file so Parrot reloads patterns.

### 1. Clop – lower probability

Model peaks around 0.48 in this log. To get clop to fire:

- **clop**: change `">probability": 0.80` → `0.45` or `0.50` (tweak up if you get false clops).

### 2. Spit – lower probability

Model peaks around 0.65. To get spit to fire:

- **spit**: change `">probability": 0.80` → `0.55` or `0.60`.

### 3. Whistle – loosen probability and f0 band

So whistle can fire and the single high-confidence frame (f0=1090) is usable:

- **whistle_high** and **whistle_low**: change `">probability": 0.8` → `0.5` or `0.6`.
- Consider narrowing the f0 gap: e.g. **whistle_low** `"<f0": 1000` → `1150`, and **whistle_high** `">f0": 1240` → `1150`, so 1090 is clearly in one band (e.g. low). Or keep 1000/1240 and accept that 1090 is a boundary case until you have more samples.

### 4. Shh loud/soft – softer power split

So shh_loud can fire and the boundary is less fragile:

- **shh_loud** `">power": 100` → try `80` or `70`.
- **shh_soft** `"<power": 100` → keep in sync, e.g. `"<power": 80` if you set loud to 80.

### 5. Shh / sss – shorter detect_after (optional)

So short holds can still trigger:

- **shh_loud**, **shh_soft**, **sss_loud**, **sss_soft**: change `"detect_after": 0.3` → `0.15` or `0.2` if you want more responsive taps.

### 6. Kuh – reduce accidental / repeated triggers

- Add `"detect_after": 0.05` or `0.1` so it’s not single-frame, **or**
- Raise `">probability"` from `0.95` to `0.97` or `0.98` if you still get false kuh while talking.

### 7. Speech throttle – shorter

- In every pattern that has `"throttle": { "speech": 5, ... }`, change `"speech": 5` → `2` or `3` (seconds).

## Quick reference: your current thresholds (from patterns.json)

| Pattern      | Main threshold                 | detect_after | Notes (from talon.log)           |
| ------------ | ------------------------------ | ------------ | -------------------------------- |
| speech       | >prob 0.70                     | 0            | Fires ✓                          |
| clop         | >power 10, >prob 0.80          | 0            | Never fires (max clop ~0.48)     |
| kuh          | >power 10, >prob 0.95          | 0            | Fires in bursts / repeats        |
| motor        | >prob 0.88                     | 0.2          | Fires ✓                          |
| shh_loud     | >power 100, >prob 0.2          | 0.3          | Rarely/never (power &lt; 100)    |
| shh_soft     | <power 100, >prob 0.2          | 0.3          | Fires ✓                          |
| sss_loud     | >power 50, >prob 0.5           | 0.3          | Fires ✓                          |
| sss_soft     | <power 50, >prob 0.5           | 0.3          | Can fire (power boundary 50)     |
| spit         | >power 50, >prob 0.80          | 0            | Never fires (max spit ~0.65)     |
| whistle_high | >f0 1240, >power 20, >prob 0.8 | 0.1          | Almost never (f0/prob)           |
| whistle_low  | <f0 1000, >power 20, >prob 0.8 | 0.1          | Almost never (f0=1090 dead zone) |
| (throttle)   | speech: 5 s after noise        | —            | Voice blocked 5 s after noise    |

After editing `~/.talon/parrot/patterns.json`, run the same test again (3 of each in order), then inspect the **end of `talon.log`** (ParrotFrame lines) to verify which patterns would fire and at what levels.
