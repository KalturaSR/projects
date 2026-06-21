# Kaltura Project Knowledge

## Core product context

This project focuses on Kaltura video workflows, especially Content Lab, Reach accessibility services, Kaltura Events, Unisphere, and AI-assisted content creation.

The design approach should prioritize user outcomes, enterprise SaaS usability, accessibility, and scalable information architecture.

## Key principle

Do not design around internal tools or backend objects.
Design around the user job.

Users are not trying to use "chapters", "slides", "captions", "metadata", or "AI summaries" as isolated features.
They are trying to make video content easier to discover, understand, navigate, reuse, and consume.

---

# Video Structure Workspace / Timeline Editor

## Product direction

The new editor consolidates:
1. Legacy manual Chapters & Slides editor
2. AI Summary & Chapters from Content Lab

The recommended product concept is:

Video Structure Workspace

This is not only a chapter editor, slide editor, or AI summary generator.
It is a unified workspace for transforming a linear video into a structured viewing experience.

## Core JTBD

When I publish a video,
I want to structure and enrich it with navigation and contextual content,
So viewers can quickly discover, understand, and consume the information they need.

## Supporting JTBDs

### Navigation

When a video contains multiple topics,
I want to organize it into meaningful chapters,
So viewers can quickly jump to relevant content.

### Understanding

When viewers need to understand a recording quickly,
I want to provide a summary and chapter descriptions,
So they can decide what to watch and what to skip.

### Context

When the video references slides, diagrams, or visual material,
I want to synchronize visuals with the video timeline,
So viewers can better understand the content.

### Efficiency

When I do not have time to manually review a long recording,
I want AI to generate an initial structure,
So I can create a useful viewing experience faster.

### Quality assurance

When generated or manual content does not fully match my intent,
I want to edit titles, descriptions, summaries, timestamps, thumbnails, and slides,
So the published experience accurately represents the video.

### Publishing

When my video structure is ready,
I want to preview and publish it,
So viewers receive a consistent navigation experience.

---

# Summary, Chapters, and Slides Mental Model

## Summary

Purpose:
Overview.

Answers:
What is this video about?

Summary is video-level content.
It does not belong to one timestamp.

## Chapters

Purpose:
Navigation.

Answers:
Where is the relevant information in the video?

Chapters are timeline assets.
They help viewers jump to specific sections.

## Slides

Purpose:
Visual context.

Answers:
What visual content belongs at this moment in the video?

Slides are timeline assets.
They help viewers follow presentations, diagrams, charts, or screenshots.

## Important UX rule

Do not separate Summary, Chapters, and Slides into three unrelated tools.

Treat them as parts of one structured viewing experience:

Video Structure
- Overview
  - Summary
- Timeline
  - Chapters
  - Slides

---

# Captions Dependency

Manual chapters do not require captions.
Manual slides do not require captions.
AI-generated summary and chapters require captions.

UX recommendation:
- Keep manual Add chapter and Add slide enabled even when captions are missing.
- Show Generate with AI as gated or disabled when captions are missing.
- Explain clearly: AI-generated summary and chapters require captions. Add captions first to use this option.

---

# Recommended Editor UI

## Page title

Video Structure

## Description

Create and manage the summary, chapters, and slides that help viewers understand and navigate this video.

## Main layout

Left side:
- Video player / preview
- Timeline below player
- Current time indicator
- Chapter and slide markers
- Add chapter / Add slide actions using current player time

Right side:
- Properties panel
- Empty state when nothing is selected
- Summary form when Summary is selected
- Chapter form when Chapter is selected
- Slide form when Slide is selected

Content structure area:
- Summary
- Chapters sorted by timestamp
- Slides sorted by timestamp

Alternative:
Use one combined timeline list:
- 00:00 Chapter — Introduction
- 02:15 Slide — Market overview
- 04:30 Chapter — Product demo

## Actions

Required actions:
- Add chapter from current time
- Add slide from current time
- Edit summary
- Edit chapter
- Edit slide
- Delete chapter or slide with confirmation
- Save
- Cancel
- Preview in player
- Publish to media
- Generate with AI when available

## Forms

Summary form:
- Summary text area
- Save / Cancel
- Optional Generate with AI

Chapter form:
- Timestamp
- Title
- Description or summary
- Tags
- Thumbnail
- Save / Cancel / Delete

Slide form:
- Timestamp
- Title
- Description
- Tags
- Slide image upload or replace
- Save / Cancel / Delete

## UX principles for the editor

- Player first: users need playback context while editing.
- Timeline is the source of truth.
- Keep users in context.
- Avoid modal-heavy workflows.
- Use progressive disclosure.
- AI should be an accelerator, not the main product.
- Support both manual and AI workflows.
- Generated content should appear directly in the same editor.
- Make manual editing possible even when AI requirements are not met.
- Preview before publish.

---

# Kaltura Content Lab Context

Content Lab helps users create AI-assisted assets for videos.

Relevant capabilities:
- AI Summary & Chapters
- AI Highlights / Clips
- AI Quizzes
- Metadata enrichment
- Captions and translations
- Dubbing
- Audio Description
- Extended Audio Description
- Sign Language
- Live Captions
- Live Dubbing

Content Lab design principle:
Expose value, but gate execution when prerequisites, permissions, catalog items, or account configuration are missing.

AI is an accelerator.
It should reduce effort, not become a disconnected workflow.

---

# Progressive Entitlement

Progressive Entitlement means:
Visible -> understandable -> optionally explorable -> gated at point of use.

Do not silently hide unavailable features unless required by account policy.

When a tool is unavailable:
- Show the capability
- Explain why it is unavailable
- Provide a next step
- Optionally include Learn more
- Optionally include admin contact

Preferred tone:
Formal, product-oriented, helpful, not alarming.

Example:
This feature is not enabled for your account. Access is managed by your organization. Contact your administrator or learn more in the Kaltura Knowledge Center.

---

# Event Agent Context

Kaltura Event Agent is a post-event AI agent, not live.

Modes:
- Session-level agent: Q&A for a single session
- Event-level agent: Q&A across event sessions and content

Flow:
1. Create agent
2. Preview
3. Publish
4. Deactivate

Important states:
- Inactive / Not configured
- Creating
- Preview
- Published
- Deactivated

Recommended copy:
Title: Event AI Agent
Description: Enable a conversational agent for your event. Attendees can ask questions about sessions, recordings, and event content.

Processing message:
Setting up your event agent. This takes about 40 seconds and does not publish it to attendees.

AI agent UX rule:
Preview should be organizer-only.
Publish makes the agent available to attendees.
Deactivate unpublishes it.

---

# Reach / Accessibility Services Context

Reach includes accessibility and media services such as:
- Captions
- Translations
- Audio Description
- Extended Audio Description
- Dubbing
- Live Captions
- Live Dubbing
- Sign Language

UX principle:
Separate create/order flows from manage/status flows.

Users need to:
- Understand available services
- Order the right service
- Track processing status
- Resolve errors
- Manage completed assets

Common status concepts:
- Pending
- Pending for Moderation
- Rejected
- Processing
- Ready
- Error
- Aborted

---

# Product Writing Style

Tone:
Formal but friendly.
Clear, concise, product-oriented.
Avoid over-explaining in UI labels.
Use educational descriptions where needed.

Prefer:
- Create with AI
- Generate with AI
- Add chapter
- Add slide
- Preview
- Publish to media
- View processed content
- Feature unavailable for your account

Avoid:
- Technical backend terms
- Confusing internal language
- Long instructional paragraphs inside dense UI

---

# Product Knowledge Base

## Product Overview

This product is an enterprise video platform focused on AI-powered content creation, accessibility, discoverability, and content automation.

Users are typically:

* Learning administrators
* Media managers
* Content creators
* Event organizers
* Marketing teams
* Enterprise administrators

Users are not professional video editors.

Design for simplicity over editing power.

---

# Product Philosophy

## Principle 1

Users come to accomplish a goal.

They do not come to configure tools.

Always prioritize outcomes over configuration.

---

## Principle 2

AI should reduce work, not create work.

Every AI feature should save time immediately.

Avoid workflows where users spend more time reviewing than creating.

---

## Principle 3

Create and Manage are different jobs.

Creation actions should appear in the user workflow.

Management actions should live in dedicated management surfaces.

Do not mix them.

---

## Principle 4

Discoverability matters.

Users should be able to discover capabilities even when unavailable.

Prefer Progressive Entitlement:

* Visible
* Explainable
* Gated at execution

Avoid hiding features entirely.

---

## Principle 5

Time-based content should have one owner.

If content is attached to timestamps:

* Chapters
* Slides
* Clips
* Captions
* Highlights
* AI Moments
* Segments

The timeline should be considered the primary interaction surface.

Avoid duplicate editing experiences.

---

# Content Lab Principles

Content Lab exists to help users:

* Repurpose content
* Improve discoverability
* Improve accessibility
* Increase content engagement

The platform is not intended to be a full professional video editor.

Prefer lightweight workflows.

---

# AI Features

Current AI capabilities include:

* Summaries
* Chapters
* Metadata enrichment
* Highlights
* Clips
* Quizzes
* Captions
* Translation
* Dubbing
* Audio description
* Sign language generation

All AI outputs must support:

* Review
* Edit
* Regenerate
* Undo

---

# Empty State Principles

Every empty state should:

1. Explain value
2. Explain outcome
3. Provide a clear CTA
4. Encourage first action

Avoid instructional empty states that only explain functionality.

Focus on benefits.

---

# Enterprise UX Principles

Always consider:

* Permissions
* Scalability
* Bulk actions
* Processing states
* Error recovery
* Auditability
* Admin controls

Never assume a small-scale workflow.

---

# Accessibility Principles

Accessibility is a first-class workflow.

Accessibility features include:

* Captions
* Translation
* Audio Description
* Extended Audio Description
* Sign Language

Accessibility workflows should be discoverable and understandable by non-experts.

Avoid industry jargon when possible.

---

# UX Writing Principles

Use:

* Short sentences
* Action-oriented language
* Outcome-focused copy

Prefer:

"Generate chapters"

Over:

"Create chapter segmentation"

Prefer:

"Add slides"

Over:

"Upload presentation assets"

Avoid technical language unless necessary.

---

# Challenge Existing Designs

Do not assume the existing design is correct.

Always evaluate:

* Can this be simpler?
* Can steps be removed?
* Can surfaces be merged?
* Can AI automate this?
* Is the user effort justified?

Challenge before optimizing.

---

# Frontend Standards

## HTML

- Use semantic HTML.
- Avoid div soup.
- Prefer reusable components.
- Use labels for all form controls.

## CSS

- Use Flexbox and CSS Grid.
- Mobile-first responsive layouts.
- Avoid fixed heights.
- Use design tokens.

## Accessibility

- WCAG AA minimum.
- Keyboard navigation.
- Visible focus states.
- Minimum touch target 44px.

## Video Editor Rules

- Timeline is primary workspace.
- Support chapters, slides, intro, and video assets.
- Timeline thumb minimum interaction area 44px.
- Click-to-seek and drag-to-seek required.
