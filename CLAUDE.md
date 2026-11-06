# Clearing

First-person PS1-style horror demo in Godot 4.5.1, built to learn 3D basics.
Goal: find 3 fuses in a foggy forest, power the gate, escape a stalker that only moves when unseen.

- Engine: `C:\Users\Zarin Yusri\Downloads\Godot_v4.5.1-stable_win64.exe\Godot_v4.5.1-stable_win64.exe`
  (call the main exe; the `_console` wrapper fails because the folder name ends in `.exe`).
- Renderer: GL Compatibility only, so the web export works.
- Look: rendered at 320x240 and scaled up (`display/window/stretch/mode="viewport"`).
- Web build target: GitHub Pages, single-threaded web export.

## Versions

- Version lives in `project.godot` as `application/config/version`; the HUD shows it bottom-right.
- Middle number up when a new step goes live (0.2.0 → 0.3.0), last number for fixes (0.3.0 → 0.3.1).
  Stay below 1.0.0 until people play it for real.
- Bump on the branch before merging, then tag the merge on main as vX.Y.Z and push the tag.

## Steps

Done: 0.1.0 walk around · 0.1.1 web export.

Core (a finished, story-telling game):
- 0.2.0 darkness + flashlight · 0.3.0 fuses · 0.4.0 stalker · 0.5.0 sound + escape
- 0.6.0 dialogue box + one NPC (typewriter text, a choice, a flag)
- 0.7.0 intro cutscene (AnimationPlayer, Mixamo animations)

Should have:
- 0.8.0 menus and settings · 0.9.0 saving and loading

Nice to have (0.10.0 onwards, order flexible; "0.10.0" is a version, not 0.1.0):
- 0.10.0 own mocap with PoseCap (needs Blender 4.2+; SMPL-X licence is non-commercial)
- 0.11.0 deeper sound design (music that reacts to danger)
- 0.12.0 stalker pathfinding (only if it gets stuck on trees)
- 0.13.0 shaders beyond the built-in PS1 look
