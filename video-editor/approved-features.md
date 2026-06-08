# Video Structure Editor — PRD / Story

## Overview

The Video Structure Editor enables users to create and manage chapters and slides on a video timeline. Users can structure video content for navigation (chapters) and visual context (slides), making long-form video easier to discover, understand, and consume.

---

## Story 1: Timeline Drag-and-Drop Reordering

### Description
As a content editor, I want to reorder chapters and slides by dragging them along the timeline, so I can quickly reorganize the video structure without manually editing timestamps.

### Acceptance Criteria

| # | Criteria | Expected Behavior |
|---|----------|-------------------|
| 1 | Drag initiation | Drag activates after 5px mouse movement from mousedown position (dead zone prevents accidental drags) |
| 2 | Duration preservation | Dragged segment retains its original duration after drop — no length change |
| 3 | Gap indicator | A 14px gap opens between adjacent segments at the nearest valid drop position |
| 4 | Insertion marker | A solid bright blue (#4da6ff) vertical marker appears in the gap with a timestamp label showing the target time |
| 5 | Ghost thumbnail | A semi-transparent (0.75 opacity) scaled-down clone of the segment follows the cursor during drag |
| 6 | Original position | The dragged segment collapses to 0 width at 0.4 opacity in its original position |
| 7 | Name preservation | Segment names remain unchanged after reordering |
| 8 | Track continuity | After drop, all segments fill the full track width with no gaps (start to end) |
| 9 | Undo support | Reorder action is added to undo history |
| 10 | Auto-save | Reorder triggers debounced auto-save (1 second) |

### Test Cases

- [ ] Drag first chapter to last position — verify all durations unchanged, names unchanged
- [ ] Drag last slide to first position — verify times rebuild correctly from 0
- [ ] Start drag then release within 5px — verify no reorder occurs
- [ ] Drag and drop at same position — verify no state change
- [ ] Undo after reorder — verify original order restored
- [ ] Reorder with only 2 segments — verify swap works correctly

---

## Story 2: Timeline Auto-Scroll During Drag

### Description
As a content editor, when I drag a segment near the edge of the visible timeline, I want the timeline to auto-scroll so I can reposition segments beyond the current viewport.

### Acceptance Criteria

| # | Criteria | Expected Behavior |
|---|----------|-------------------|
| 1 | Trigger zone | Auto-scroll activates when cursor is within 60px of the left or right edge of the timeline viewport |
| 2 | Speed | Scroll speed is proportional to cursor proximity to the edge (closer = faster, max 8px/frame) |
| 3 | Stop condition | Auto-scroll stops immediately when cursor leaves the trigger zone or drag ends |
| 4 | Boundary respect | Scroll does not exceed timeline start (0) or end (duration) |

### Test Cases

- [ ] Drag segment to right edge — timeline scrolls right, speed increases as cursor nears edge
- [ ] Drag segment to left edge — timeline scrolls left
- [ ] Move cursor back to center during drag — scrolling stops
- [ ] Drop segment while auto-scrolling — segment drops at correct position
- [ ] Auto-scroll at maximum zoom — verify no overscroll past duration

---

## Story 3: Snap to Markers

### Description
As a content editor, when dragging a segment near the playhead or other markers, I want the segment to snap to those positions so I can align content precisely.

### Acceptance Criteria

| # | Criteria | Expected Behavior |
|---|----------|-------------------|
| 1 | Snap threshold | Snap activates when segment is within 10px (screen space) of a snap target |
| 2 | Snap targets | Playhead position, all chapter start times, all slide start times, time 0, video duration |
| 3 | Visual indicator | A pink snap line appears with glow effect when snapping is active |
| 4 | Snap release | Snap disengages when cursor moves beyond threshold |

### Test Cases

- [ ] Drag segment near playhead — verify snap line appears and segment aligns to playhead time
- [ ] Drag segment near another chapter start — verify snap
- [ ] Drag beyond snap threshold — verify snap releases and pink line disappears
- [ ] Test snap at different zoom levels — verify 10px threshold is consistent in screen space

---

## Story 4: External File Drop on Slide Track

### Description
As a content editor, I want to drop image files from my desktop onto the slide track to quickly add new slides at a specific timeline position.

### Acceptance Criteria

| # | Criteria | Expected Behavior |
|---|----------|-------------------|
| 1 | Drop zone | Drop zone overlay (dashed blue border) appears when dragging files over the slide track |
| 2 | Supported formats | Accepts image files (PNG, JPG, GIF, WebP) |
| 3 | Position | New slide is created at the timeline position where the file is dropped |
| 4 | Multiple files | Each dropped image creates a separate slide |
| 5 | Feedback | Toast notification confirms slide creation |
| 6 | Undo | File drop action is added to undo history |
| 7 | Browser default | Default browser file-drop behavior is suppressed |

### Test Cases

- [ ] Drop PNG file on slide track — new slide created at correct position with image
- [ ] Drop multiple images — multiple slides created
- [ ] Drop non-image file — no slide created, no error
- [ ] Drop on chapter track — no action (only slide track accepts files)
- [ ] Drag file over then leave without dropping — overlay disappears

---

## Story 5: Resize Handles (Duration Adjustment)

### Description
As a content editor, I want to adjust segment boundaries by dragging edge handles, so I can fine-tune where one chapter/slide ends and the next begins.

### Acceptance Criteria

| # | Criteria | Expected Behavior |
|---|----------|-------------------|
| 1 | Visibility | Resize handles appear on left and right edges of segments on hover |
| 2 | Cursor | col-resize cursor when hovering a handle |
| 3 | Handle color (default) | Matches segment border color (--w-30 / light gray) |
| 4 | Handle color (active) | Blue (--blue) when the segment is focused/selected |
| 5 | Persistent during drag | Handles remain visible throughout the resize operation |
| 6 | Boundary adjustment | Dragging adjusts the shared boundary time between two adjacent segments |
| 7 | Minimum duration | No segment can be resized below 1 second |
| 8 | Track continuity | Segments always fill the full track — resize changes boundary, never creates gaps |
| 9 | Distinction from drag | Resize and reorder are separate interactions — resize does not trigger reorder |

### Test Cases

- [ ] Hover segment edge — handle appears
- [ ] Drag right handle of segment 1 rightward — segment 1 grows, segment 2 shrinks
- [ ] Drag left handle of segment 2 leftward — segment 2 grows, segment 1 shrinks
- [ ] Resize to minimum (1s) — stops, cannot go below
- [ ] Resize first segment left handle — no action (no segment to the left to shrink)
- [ ] Resize last segment right handle — no action (no segment to the right)
- [ ] Verify handle does not trigger drag-and-drop reorder

---

## Story 6: Segment Naming

### Description
As a content editor, I want segments to have mandatory names without auto-numbering, so the structure is meaningful and descriptive.

### Acceptance Criteria

| # | Criteria | Expected Behavior |
|---|----------|-------------------|
| 1 | No numbering | Segments do not display "Chapter 1", "Slide 2" etc. |
| 2 | Mandatory names | Every segment must have a non-empty name |
| 3 | Validation | If user clears the name field and blurs, name reverts to previous value |
| 4 | Default for new | New segments created with a default name (e.g., "Untitled") |

### Test Cases

- [ ] Create new chapter — has default name, no number prefix
- [ ] Edit name to empty string and blur — reverts to previous name
- [ ] Edit name to valid string — saves successfully
- [ ] Verify no numbering visible anywhere in track segments

---

## Story 7: Player Slide Overlay

### Description
As a viewer/editor, I want to see the currently active slide overlaid on the video player, so I have visual context while watching.

### Acceptance Criteria

| # | Criteria | Expected Behavior |
|---|----------|-------------------|
| 1 | Position | Bottom-right of video area, 223px wide |
| 2 | Styling | Rounded corners (8px), shadow, gradient overlay at top |
| 3 | Visibility | Only visible when slides exist AND current time is at or past a slide's timestamp |
| 4 | Active slide | Shows the most recent slide relative to current playback time |
| 5 | Hide when no slides | Overlay hidden when slide array is empty |
| 6 | Hide before first slide | Overlay hidden when current time is before the first slide |

### Test Cases

- [ ] Play video with slides — correct slide appears at each timestamp
- [ ] Play video with no slides — overlay not visible
- [ ] Seek to before first slide — overlay hidden
- [ ] Seek to between slide 2 and slide 3 — slide 2 is shown
- [ ] Delete all slides during playback — overlay disappears

---

## Story 8: Player Slide Show/Hide Toggle

### Description
As a content editor, I want to collapse the slide overlay to focus on the video, and expand it again when needed.

### Acceptance Criteria

| # | Criteria | Expected Behavior |
|---|----------|-------------------|
| 1 | Toggle button | Chevron icon with "Hide"/"Show" label |
| 2 | Collapsed state | Slide image hidden, only toggle button visible |
| 3 | Chevron rotation | Rotates 180deg when collapsed |
| 4 | State persistence | Remains in chosen state during playback |

### Test Cases

- [ ] Click "Hide" — slide image collapses, text changes to "Show"
- [ ] Click "Show" — slide image expands, text changes to "Hide"
- [ ] Continue playback while collapsed — slide updates in background, shows correct slide on expand

---

## Story 9: Player Switch View

### Description
As a content editor, I want to switch the main player view between video and slide, so I can focus on whichever content is more relevant.

### Acceptance Criteria

| # | Criteria | Expected Behavior |
|---|----------|-------------------|
| 1 | Button | 28x28px, always positioned on the small/minimized view only |
| 2 | Button icon | Kaltura DS icon '24/Switch' |
| 3 | Button style | Semi-transparent dark background (rgba(0,0,0,0.6)), 4px border-radius, icon at 80% opacity |
| 3b | CTA visibility | Both CTAs (Hide/Show toggle + Switch button) appear ONLY on the small view — never on the main/full view |
| 3c | CTAs on both streams | CTAs appear on the small view regardless of whether it is showing the video or the slide |
| 4 | Default state | Video is main (full area), slide is small overlay (223px, bottom-right) |
| 5 | Switched state | Slide moves to main view (full area, object-fit: contain), video moves to small thumbnail (223px, bottom-right, rounded) |
| 6 | Switch back via button | Clicking the switch button again restores default layout |
| 7 | Switch back via thumbnail | Clicking the minimized video thumbnail also switches back to default |
| 8 | Video playback | Video continues playing uninterrupted during switch |
| 9 | Controls | Player controls always render on top of the video, above all overlays (z-index: 10) |
| 10 | Stream swap concept | The switch action swaps which stream is in the main view vs. the minimized view — it does not hide either stream |

### Test Cases

- [ ] Click switch on slide thumbnail — slide fills player area, video becomes small thumbnail
- [ ] Click switch button again — restores default (video main, slide small)
- [ ] Click the minimized video thumbnail — switches back to default
- [ ] Play/pause while in switched view — works normally
- [ ] Seek while in switched view — slide and video both update
- [ ] Switch view when video is paused — layout changes correctly
- [ ] Verify Kaltura DS '24/Switch' icon is used
- [ ] Default mode: both Hide/Show toggle and Switch button visible on slide thumbnail
- [ ] Switched mode: both Hide/Show toggle and Switch button visible on video thumbnail
- [ ] Neither CTA visible on the main/full view in either mode
- [ ] Hide video thumbnail in switched mode — video disappears, toggle shows "Show"
- [ ] Switch back to default — video thumb hidden state resets

---

## Story 10: Scrubber & Timeline Sync

### Description
As a content editor, I want the scrubber, timeline playhead, and slide overlay to stay in sync at all times, so I always see the correct content for the current position.

### Acceptance Criteria

| # | Criteria | Expected Behavior |
|---|----------|-------------------|
| 1 | Progress bar click | Updates video time, timeline playhead position, and slide overlay immediately |
| 2 | Timeline ruler click | Updates video time, progress bar, and slide overlay immediately |
| 3 | Scrubber drag | Updates video time, timeline playhead, progress bar, and slide overlay in real-time during drag |
| 4 | Video playback | All indicators update continuously during normal playback |
| 5 | Tooltip format (short video) | Scrubber tooltip displays M:SS format (0:00) when video is under 1 hour |
| 6 | Tooltip format (long video) | Scrubber tooltip displays HH:MM:SS format (00:00:00) when video is 1 hour or longer |
| 7 | Other timestamps | All other timestamps in the UI remain in M:SS format |

### Test Cases

- [ ] Click progress bar at 50% — playhead moves to 50%, correct slide shows
- [ ] Click timeline ruler — video seeks, slide updates
- [ ] Drag scrubber — slide overlay updates in real-time as scrubber moves
- [ ] Video under 1hr — scrubber tooltip shows "1:30" format (M:SS)
- [ ] Video over 1hr — scrubber tooltip shows "00:01:30" format (HH:MM:SS)
- [ ] Verify player timestamp shows "1:30 / 5:00" format (M:SS) regardless of duration
- [ ] Verify chapter/slide timestamps show M:SS format

---

## Story 11: Keyboard Navigation

### Description
As a content editor, I want to control the timeline with keyboard shortcuts for efficient editing without a mouse.

### Acceptance Criteria

| # | Criteria | Expected Behavior |
|---|----------|-------------------|
| 1 | Select | Click to select a segment |
| 2 | Delete | Delete or Backspace removes selected segment (with confirmation) |
| 3 | Play/Pause | Space toggles playback |
| 4 | Seek | Arrow Left/Right seeks +/-5 seconds |
| 5 | Reposition | Arrow Left/Right on selected segment moves it by 1 second (Shift: 5 seconds) |
| 6 | Bounds | Reposition clamps to [0, video duration] |
| 7 | Feedback | Screen reader announces position changes |

### Test Cases

- [ ] Select chapter, press Right Arrow — chapter moves 1s forward
- [ ] Select chapter, press Shift+Left Arrow — chapter moves 5s backward
- [ ] Move segment to time 0 then press Left — stays at 0
- [ ] Press Delete with segment selected — segment removed
- [ ] Press Space — video toggles play/pause
- [ ] Press Arrow keys with no selection — seeks video +-5s

---

## Technical Notes

### Data Model
- `data.chapters[]` — array of `{ time, title, description, tags }`
- `data.slides[]` — array of `{ time, title, description, tags, image }`
- Arrays are always sorted by `time`
- Segments fill full track: each segment spans from its `time` to the next segment's `time` (or video duration for last segment)

### State Management
- Single source of truth in JavaScript data objects
- UI re-renders from data on every state change
- Auto-save with 1-second debounce on every data change
- Undo/redo history (max entries capped)

### Zoom Model
- `pixelsPerSecond` determines timeline scale
- Time-to-pixel: `time * pixelsPerSecond`
- Pixel-to-time: `px / pixelsPerSecond`

### Accessibility
- WCAG AA compliance
- All interactive elements keyboard accessible
- Minimum touch/click target: 44px
- ARIA labels and live region announcements for state changes
- Focus management during drag operations

### Browser Support
- Vanilla HTML/CSS/JS — no framework dependencies
- Native pointer events for drag interactions
- CSS custom properties for theming (Kaltura Design System tokens)
