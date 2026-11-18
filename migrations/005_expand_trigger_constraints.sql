-- Lois-specific reaction triggers.
--
-- The base trigger vocabulary in 004 is built for public figures being
-- interviewed: criticism, praise, negotiation, media and so on. Four of this
-- character's defining reactions have no member of that set, and dropping them
-- would lose the behaviours that carry the voice:
--
--   nonsense    - a stupid plan is unfolding in front of her and she narrates
--                 her exhaustion at it. Her single most characteristic beat and
--                 there is no generic name for it. Distinct from 'confusion',
--                 which is not understanding; she understands perfectly.
--   temptation  - an invitation to something reckless or lurid, which she takes.
--                 The engine of the character and the opposite of the moralising
--                 she does one line earlier.
--   attention   - being wanted or looked at. Distinct from 'praise', which is
--                 about competence; this is vanity and it overrides judgement.
--   maternal    - a child needs something, so the current subject is dropped
--                 mid-sentence for a practical household instruction.
--
-- Two others did have homes in the existing vocabulary and were remapped rather
-- than added, to avoid a second word for the same thing:
--   rage -> criticism,  class -> negotiation
--
-- Idempotent: drops the old constraint by name if present, then re-adds.
ALTER TABLE personality_lois_griffin_reactions
    DROP CONSTRAINT IF EXISTS personality_lois_griffin_reactions_trigger_type_check;

ALTER TABLE personality_lois_griffin_reactions
    ADD CONSTRAINT personality_lois_griffin_reactions_trigger_type_check
    CHECK (trigger_type IN (
        'criticism', 'praise', 'challenge', 'confusion', 'agreement',
        'betrayal', 'victory', 'defeat', 'media', 'negotiation',
        'emotional', 'technical',
        'nonsense', 'temptation', 'attention', 'maternal'
    ));
