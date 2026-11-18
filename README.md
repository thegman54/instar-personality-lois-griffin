# instar-personality-lois-griffin

A character-persona engine for [Project Instar](https://github.com/thegman54/project-instar)
that lets a bot talk in the voice of Lois Griffin — the exhausted sigh that
caves, a buried lurid past delivered flatly, moralising followed immediately by
appetite.

> **Unofficial fan persona.** Lois Griffin is a fictional character created by Seth
> MacFarlane and owned by Twentieth Century Fox. This repository is an independent
> character study for a personal assistant persona. It is not affiliated with,
> authorised by, or endorsed by the rights holders, and it reproduces no script text
> beyond short, widely-quoted catchphrases.

## Architecture

This personality engine uses **20 trait categories** across **6 layers**, backed by **4 database tables** for different types of personality data:

### Layers

| Layer | Name | Categories | Purpose |
|-------|------|------------|---------|
| 1 | **Foundation** | identity, values, worldview | Core beliefs — always active |
| 2 | **Expression** | voice, lexicon, tone, emphasis, humor | Shapes every response |
| 3 | **Strategy** | rhetoric, social, narrative, authority, deflection, topics | How interactions are conducted |
| 4 | **Reactive** | reaction, situational, rhythm | Triggered by conversational context |
| 5 | **Reference** | signature, quote | Catchphrases and recurring lines |
| 6 | **Constraints** | boundary | Guardrails and limits |

### Data Stores

| Table | Purpose |
|-------|---------|
| `personality_lois_griffin_traits` | 20-category behavioral traits with examples and anti-examples |
| `personality_lois_griffin_quotes` | Catchphrases and recurring lines with source attribution |
| `personality_lois_griffin_lexicon` | Vocabulary fingerprint — words to favor, avoid, and use situationally |
| `personality_lois_griffin_reactions` | Trigger-to-response pattern mappings by context |

### Key Character Features

- **The sigh that caves** — the correct objection, an ellipsis, then agreement, with no deliberation beat in between
- **The flat reveal** — something lurid from before the marriage dropped into a mundane sentence at the register of a grocery item
- **The maternal override** — the subject abandoned mid-sentence for a household instruction, then resumed as if it had waited
- **Stress by duration** — exasperation stretches a vowel rather than raising volume, so the persona never uses CAPS
- **The ledger** — arguments won with a precise history of past failures, with dates and amounts

### Character-specific reaction triggers

Migration `005` extends the base trigger vocabulary with four triggers this
character cannot be written without — `nonsense`, `temptation`, `attention`,
`maternal` — and documents why each one has no member of the generic set. The
admin panel's trigger dropdown is extended to match, so they are reachable from
the UI and not only from a YAML import.

## Installation

This is a skill package for Project Instar. Upload it via the Admin UI or place it in the skills directory.

```bash
# Clone
git clone https://github.com/thegman54/instar-personality-lois-griffin.git

# Import seed data via admin panel YAML import
# or load directly into the database
```

## Tools

| Tool | Purpose |
|------|---------|
| `personality_lois_griffin_read` | Load traits, quotes, lexicon, and reactions by category and situation |
| `personality_lois_griffin_list` | List available categories, counts, and data store stats |

## Seed Data

`data/lois_griffin_profile.yaml` contains a comprehensive starter profile.

## Contents

| Store | Entries |
|---|---|
| traits | 69 across 19 categories |
| quotes | 8 |
| lexicon | 16 |
| reactions | 10 |

The twentieth category, `quote`, holds no traits — that material lives in the
quotes store instead.

## Sourcing

Canonical biographical facts (the Pewterschmidt family, the piano teaching, the
marriage, the children) come from the character's encyclopaedia entry.
Catchphrases are recorded as **recurring catchphrases without invented episode
citations** — where no reliable source names an episode, none is claimed.
Everything else is written as a behavioural instruction rather than as a
quotation.

## License

MIT

## Install

```bash
zip -r instar-personality-lois-griffin.zip . -x '.git/*'
# Upload via the Instar admin Skills page
```

Then set the profile's **Personality** field to `skill:personality_lois_griffin`.
