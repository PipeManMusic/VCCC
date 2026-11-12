\version "2.24.4"

#(set-global-staff-size 17.2)

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

\header {
  title = ""
}

\paper {
  #(set-paper-size "letter")
  indent = 0\mm
  ragged-bottom = ##t

  top-margin = 10\mm
  bottom-margin = 10\mm
  left-margin = 14\mm
  right-margin = 14\mm

  markup-system-spacing.basic-distance = #2.5
  markup-system-spacing.padding = #1
  score-markup-spacing.basic-distance = #2.5
  score-markup-spacing.padding = #1
  system-system-spacing.basic-distance = #6.2
  system-system-spacing.padding = #0.5
  score-system-spacing.basic-distance = #6.2
  score-system-spacing.padding = #0.5

  print-page-number = ##t
  print-first-page-number = ##f
  first-page-number = 1

  oddFooterMarkup = \markup {
    \fill-line {
      \center-column {
        \line { \fontsize #1 "VCCC Jazz Study Book - Open Source Edition" }
        \vspace #0.3
        \epsfile #X #12 #"by-sa.eps"
        \vspace #0.3
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
  \context {
    \Staff
    printKeyCancellation = ##f
  }
  \context {
    \TabStaff
    \remove "Text_engraver"
    \override TabNoteHead.font-name = #"lilyjazz-text"
    \override TabNoteHead.font-size = #-1.0
  }
  \context {
    \ChordNames
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #0.5
  }
}

% ===================================================================
% FRONT MATTER
% ===================================================================

% --- PAGE 1: TITLE PAGE ---
\markup {
  \column {
    \vspace #8
    \fill-line { \fontsize #10 \bold "VCCC Jazz Study Book" }
    \vspace #1
    \fill-line { \fontsize #10 \bold "Lead Sheets & Harmony" }
    \vspace #4
    \fill-line { \fontsize #4 "Applied Chord Structures, Reharmonization, and Rhythms" }
    \vspace #1
    \fill-line { \fontsize #3 "(Guitar Tablature Edition)" }
    \vspace #12
    \fill-line { \fontsize #6 "By Daniel Worth" }
    \vspace #5
    \fill-line { \fontsize #2 \italic "An Open Source Music Theory Project" }
  }
}
\pageBreak

% --- PAGE 2: COPYRIGHT & LICENSE ---
\markup {
  \column {
    \vspace #8
    \fill-line { \fontsize #6 \bold "VCCC Jazz Study Book" }
    \vspace #2
    \fill-line { \fontsize #3 "Author: Daniel Worth" }
    \vspace #1
    \fill-line { \fontsize #3 "Edition: September 2026" }
    \vspace #5

    \fill-line { \fontsize #3 \bold "License" }
    \vspace #2
    \fill-line {
      \override #'(line-width . 90)
      \wordwrap-string "This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0). You are free to share, copy, and redistribute the material in any medium or format, and adapt, remix, transform, and build upon the material for any purpose, even commercially, under the condition that you provide appropriate attribution and distribute your contributions under this same license. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/."
    }
    \vspace #4
    \fill-line { \fontsize #3 \bold "Source Code & Contributions" }
    \vspace #1
    \fill-line {
      \override #'(line-width . 90)
      \wordwrap-string "This book is generated dynamically using LilyPond, an automated music engraving system. The source files are maintained as an open-source project under the Viral Concurrent Cellular Collectives (VCCC) initiative. You are encouraged to fork, modify, and contribute improvements to the codebase."
    }
  }
}
\pageBreak

% --- PAGE 3: TABLE OF CONTENTS ---
\markup {
  \column {
    \vspace #5
    \fill-line { \huge \bold "Table of Contents" }
    \vspace #4
    \fill-line {
      \line { \bold "1. After You've Gone (Layton, 1918) — Subdominant & Minor Plagal Motion" }
      \line { \bold "4" }
    }
    \vspace #2
    \fill-line {
      \line { \bold "2. VCCC Blues (12-Bar Form) — Bebop Cycle & Chromatic Turnarounds" }
      \line { \bold "5" }
    }
    \vspace #2
    \fill-line {
      \line { \bold "3. I Got Rhythm (Gershwin, 1930) — 32-Bar AABA Form & Dominant Bridge Cycles" }
      \line { \bold "6" }
    }
  }
}
\pageBreak


% ===================================================================
% STUDY 1: AFTER YOU'VE GONE (PAGE 4)
% ===================================================================
\markup { \vspace #0.1 \large \bold "1. After You've Gone" }
\markup { \italic "Turner Layton (1918) — Arr. Daniel Worth" }
\markup { \vspace #0.1 }

\storePredefinedDiagram #default-fret-table \chordmode { f:maj7 }
                        #guitar-tuning #"1-1;x;2-3;2-4;1-2;x;"
\storePredefinedDiagram #default-fret-table \chordmode { f:m6 }
                        #guitar-tuning #"x;8-3;6-1;7-2;6-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { c }
                        #guitar-tuning #"8-1;x;9-3;9-4;8-2;x;"
\storePredefinedDiagram #default-fret-table \chordmode { a:7 }
                        #guitar-tuning #"5-1;x;5-1;6-2;5-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { d:7 }
                        #guitar-tuning #"x;5-2;4-1;5-3;3-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { g:7 }
                        #guitar-tuning #"3-1;x;3-1;4-2;3-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { c:maj7 }
                        #guitar-tuning #"x;3-1;5-3;4-2;5-4;x;"
\storePredefinedDiagram #default-fret-table \chordmode { c:7 }
                        #guitar-tuning #"x;3-2;2-1;3-3;1-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { d:m7 }
                        #guitar-tuning #"x;5-1;7-3;5-1;6-2;5-1;"
\storePredefinedDiagram #default-fret-table \chordmode { dis:dim }
                        #guitar-tuning #"x;6-2;7-3;5-1;7-4;x;"
\storePredefinedDiagram #default-fret-table \chordmode { e:7 }
                        #guitar-tuning #"x;7-3;6-2;7-4;5-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { a:m7 }
                        #guitar-tuning #"5-1;x;5-1;5-1;5-1;x;"

harmonyStudyOne = \chordmode {
  f1:maj7 | f1:m6 | c1 | a1:7 |
  d1:7 | g1:7 | c1:maj7 | c1:7 |
  f1:maj7 | f1:m6 | c1 | a1:7 |
  d2:m7 dis2:dim | e1:7 | a1:m7 | d1:7 |
  c1 | g1:7 | c2 a2:m7 | d2:m7 g2:7 |
}

melodyStudyOne = {
  \key c \major
  \numericTimeSignature
  \time 4/4

  c4\5 c\5 c\5 e8\4 g\4~ | g2.\4 r4 |
  c4\5 c\5 c\5 e8\4 g\4~ | g2.\4 r4 |
  \break

  e'4\2 e'\2 e'4\2 d'8\2 c'\3~ | c'4\3 a2.\3 |
  b8\3 c'\3 d'\2 c'~\3 c'2\3~ | c'2.\3 r4 |
  \break

  c4\5 c\5 c\5 e8\4 g\4~ | g2.\4 r4 |
  c4\5 c\5 c\5 e8\4 g\4~ | g2.\4 r4 |
  \break

  a8\3 c'\3 e'\2 g'\1~ g'4\1 f'8\2 e'\2~ | e'1\2 |
  c'8\3 d'\2 e'\2 a'\1~ a'4\1 g'8\1 e'\2~ | e'1\2 |
  \break

  c4\5 c\5 c\5 e8\4 g\4~ | g4\4 a\3 b\3 d'\2 |
  c1~\5 | c2.\5 r4 \bar "|."
}

\score {
  <<
    \new FretBoards { \harmonyStudyOne }
    \new ChordNames { \set chordChanges = ##t \harmonyStudyOne }
    \new StaffGroup <<
      \new Staff {
        \clef "treble_8"
        \omit Staff.ClefModifier
        \omit Staff.StringNumber
        \melodyStudyOne
      }
      \new TabStaff \with { stringTunings = #guitar-tuning } {
        \melodyStudyOne
      }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context {
      \Score
      \override NonMusicalPaperColumn.line-break-permission = ##f
    }
    \context {
      \FretBoards
      \override FretBoard.size = #0.52
    }
    \context {
      \TabStaff
      \override TabNoteHead.font-size = #-1.2
    }
  }
}

% --- THEORETICAL ANALYSIS BLOCK: STUDY 1 ---
\markup {
  \column {
    \vspace #0.6
    \fill-line { \fontsize #1.5 \bold "Theoretical Analysis: Subdominant Openings & Minor Plagal Cadences" }
    \vspace #0.3
    \fill-line {
      \override #'(line-width . 90)
      \fontsize #-0.5
      \wordwrap-string "1. Non-Tonic Opening (IV to iv): Unusually for a standard in C major, the tune opens on the subdominant Fmaj7 before moving to Fm6 (iv6). This minor plagal motion introduces the expressive flattened sixth scale degree (Ab), which resolves down by half-step to the fifth (G) of the tonic C major chord."
    }
    \vspace #0.2
    \fill-line {
      \override #'(line-width . 90)
      \fontsize #-0.5
      \wordwrap-string "2. Secondary Dominant Chain: In mm. 4-6, A7 acts as V7/ii, resolving to D7 (V7/V), which in turn feeds the primary dominant G7. This cycle of fourths drives momentum back to the tonic Cmaj7 in measure 7."
    }
    \vspace #0.2
    \fill-line {
      \override #'(line-width . 90)
      \fontsize #-0.5
      \wordwrap-string "3. Passing Diminished Motion: In measure 13, D#dim connects Dm7 to E7 (or C/E). Its guide tone F# functions as a sharp fourth chromatic passing bass, pulling voice leading smoothly into the secondary dominant E7."
    }
  }
}


% ===================================================================
% STUDY 2: VCCC BLUES (PAGE 5)
% ===================================================================
\pageBreak

\markup { \vspace #0.1 \large \bold "2. VCCC Blues" }
\markup { \italic "Original 12-Bar Jazz Blues in F — Daniel Worth" }
\markup { \vspace #0.1 }

\storePredefinedDiagram #default-fret-table \chordmode { f:7 }
                        #guitar-tuning #"x;8-3;7-2;8-4;6-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { bes:7 }
                        #guitar-tuning #"6-1;x;6-1;7-2;6-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { b:dim }
                        #guitar-tuning #"7-2;x;6-1;7-3;6-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { d:7 }
                        #guitar-tuning #"x;5-2;4-1;5-3;3-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { g:m7 }
                        #guitar-tuning #"x;10-3;8-1;10-4;8-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { c:7 }
                        #guitar-tuning #"8-1;x;8-1;9-2;8-1;x;"

bluesHarmony = \chordmode {
  f1:7 | bes1:7 | f1:7 | f1:7 |
  bes1:7 | b1:dim | f1:7 | d1:7 |
  g1:m7 | c1:7 | f2:7 d2:7 | g2:m7 c2:7 |
}

bluesMelody = {
  \key f \major
  \numericTimeSignature
  \time 4/4

  \set Score.currentBarNumber = 1
  r8 c'8\3 d'8\2 f'8\2~ f'4\2 a'8\1 c''8\1~ |
  c''8\1 a'8\1 f'8\2 d'8\2 c'4\3 r4 |
  r8 c'8\3 d'8\2 f'8\2~ f'4\2 a'8\1 c''8\1~ |
  c''8\1 b'8\1 bes'8\1 g'8\1 f'4\2 r4 |
  \break

  r8 d'8\2 f'8\2 aes'8\1~ aes'4\1 c''8\1 d''8\1~ |
  d''8\1 b'8\1 aes'8\1 f'8\2 d'4\2 r4 |
  r8 c'8\3 d'8\2 f'8\2~ f'4\2 a'8\1 c''8\1~ |
  c''8\1 a'8\1 fis'8\1 ees'8\2 d'2\2 |
  \break

  r8 d'8\2 f'8\2 a'8\1 c''8\1 bes'8\1 g'8\1 e'8\2 |
  f'8\2 g'8\1 aes'8\1 a'8\1 bes'8\1 g'8\1 e'8\2 c'8\3 |
  f'8\2 d'8\2 c'8\3 a8\4 bes8\3 b8\3 c'4\3 |
  f'1\2 \bar "|."
}

\score {
  <<
    \new FretBoards { \bluesHarmony }
    \new ChordNames { \set chordChanges = ##t \bluesHarmony }
    \new StaffGroup <<
      \new Staff {
        \clef "treble_8"
        \omit Staff.ClefModifier
        \omit Staff.StringNumber
        \bluesMelody
      }
      \new TabStaff \with { stringTunings = #guitar-tuning } {
        \bluesMelody
      }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context {
      \Score
      \override NonMusicalPaperColumn.line-break-permission = ##f
    }
    \context {
      \FretBoards
      \override FretBoard.size = #0.52
    }
    \context {
      \TabStaff
      \override TabNoteHead.font-size = #-1.2
    }
  }
}

% --- THEORETICAL ANALYSIS BLOCK: STUDY 2 ---
\markup {
  \column {
    \vspace #1.0
    \fill-line { \fontsize #1.5 \bold "Theoretical Analysis: The 12-Bar Bebop Blues & Harmonic Cycle" }
    \vspace #0.4
    \fill-line {
      \override #'(line-width . 90)
      \fontsize #-0.5
      \wordwrap-string "1. Quick-to-IV and Chromatic Diminished Passing: Unlike standard folk blues, jazz blues moves to Bb7 (IV7) in bar 2, returns to F7 (I7), and uses Bdim (sharp IV dim) in bar 6. Bdim shares the identical tritone (D - Ab) with Bb7, operating as an ascending root movement that resolves smoothly into F7/C or root position F7 in bar 7."
    }
    \vspace #0.2
    \fill-line {
      \override #'(line-width . 90)
      \fontsize #-0.5
      \wordwrap-string "2. The VI7 to ii-V Turnaround: In bar 8, D7 (VI7) replaces the static I chord, acting as a secondary dominant to Gm7 (ii7). This converts the final four measures into a cycle-of-fourths engine (Gm7 -> C7 -> F7) that keeps the harmony in constant forward motion."
    }
    \vspace #0.2
    \fill-line {
      \override #'(line-width . 90)
      \fontsize #-0.5
      \wordwrap-string "3. Bebop Phrasing & Enclosures: Bars 10-11 highlight chromatic linear enclosures (Db - D natural, G# - A) to target chord tones on downbeats. Closed shell voicings on strings 6, 4, and 3 allow the player to comp rhythmically while holding position within the 5th-to-8th fret corridor."
    }
  }
}


% ===================================================================
% STUDY 3: I GOT RHYTHM (PAGES 6 & 7)
% ===================================================================
\pageBreak

\markup { \vspace #0.1 \large \bold "3. I Got Rhythm" }
\markup { \italic "George Gershwin (1930) — Arr. Daniel Worth" }
\markup { \vspace #0.1 }

\storePredefinedDiagram #default-fret-table \chordmode { bes:maj7 }
                        #guitar-tuning #"6-1;x;7-3;7-4;6-2;x;"
\storePredefinedDiagram #default-fret-table \chordmode { g:7 }
                        #guitar-tuning #"x;10-3;9-2;10-4;8-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { c:m7 }
                        #guitar-tuning #"x;3-1;5-3;3-1;4-2;x;"
\storePredefinedDiagram #default-fret-table \chordmode { f:7 }
                        #guitar-tuning #"x;8-3;7-2;8-4;6-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { b:dim }
                        #guitar-tuning #"7-2;x;6-1;7-3;6-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { ees:7 }
                        #guitar-tuning #"x;6-2;5-1;6-3;4-1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { e:dim }
                        #guitar-tuning #"x;7-2;8-3;6-1;8-4;x;"
\storePredefinedDiagram #default-fret-table \chordmode { d:7 }
                        #guitar-tuning #"x;5-2;4-1;5-3;3-1;x;"

rhythmHarmony = \chordmode {
  \repeat volta 2 {
    bes2:maj7 g2:7 | c2:m7 f2:7 | bes2:maj7 b2:dim | c2:m7 f2:7 |
    bes2:maj7 bes2:7 | ees2:7 e2:dim |
  }
  \alternative {
    { bes2:maj7 g2:7 | c2:m7 f2:7 | }
    { bes1:maj7 | bes1:maj7 | }
  }

  d1:7 | d1:7 | g1:7 | g1:7 |
  c1:7 | c1:7 | f1:7 | f1:7 |

  bes2:maj7 g2:7 | c2:m7 f2:7 | bes2:maj7 b2:dim | c2:m7 f2:7 |
  bes2:maj7 bes2:7 | ees2:7 e2:dim | bes2:maj7 f2:7 | bes1:maj7 |
}

rhythmMelody = {
  \key bes \major
  \numericTimeSignature
  \time 4/4

  % --- Page 6: System 1 (mm. 1-6 + volta endings) ---
  \repeat volta 2 {
    \set Score.currentBarNumber = 1
    d'4\3 f'4\2 g'4\2 bes'4\1~ | bes'2\1 g'2\2 |
    d'4\3 f'4\2 g'4\2 bes'4\1~ | bes'1\1 |
    d'4\3 f'4\2 g'4\2 bes'4\1~ | bes'4\1 c''8\1 bes'8\1~ bes'4\1 g'4\2 |
  }
  \alternative {
    { f'1\2~ | f'2\2 r2 | }
    { bes1\3~ | bes2\3 r2 | }
  }
  \break

  % --- Page 6: System 2 (Bridge mm. 17-20: D7 -> G7) ---
  fis'4\2 a'4\1 c''4\1 fis'4\2~ | fis'1\2 |
  f'4\2 b'4\1 d''4\1 f'4\2~ | f'1\2 |
  \break

  \pageBreak

  % --- Page 7: System 3 (Bridge mm. 21-24: C7 -> F7) ---
  e'4\2 g'4\2 bes'4\1 e'4\2~ | e'1\2 |
  ees'4\3 a'4\1 c''4\1 ees'4\3~ | ees'1\3 |
  \break

  % --- Page 7: System 4 (Final A recap mm. 25-28) ---
  d'4\3 f'4\2 g'4\2 bes'4\1~ | bes'2\1 g'2\2 |
  d'4\3 f'4\2 g'4\2 bes'4\1~ | bes'1\1 |
  \break

  % --- Page 7: System 5 (Resolution mm. 29-32) ---
  d'4\3 f'4\2 g'4\2 bes'4\1~ | bes'4\1 c''8\1 bes'8\1~ bes'4\1 g'4\2 |
  bes'1\1~ | bes'2.\1 r4 \bar "|."
}

\score {
  <<
    \new FretBoards { \rhythmHarmony }
    \new ChordNames { \set chordChanges = ##t \rhythmHarmony }
    \new StaffGroup <<
      \new Staff {
        \clef "treble_8"
        \omit Staff.ClefModifier
        \omit Staff.StringNumber
        \rhythmMelody
      }
      \new TabStaff \with { stringTunings = #guitar-tuning } {
        \rhythmMelody
      }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context {
      \Score
      \override NonMusicalPaperColumn.line-break-permission = ##f
    }
    \context {
      \FretBoards
      \override FretBoard.size = #0.52
    }
    \context {
      \TabStaff
      \override TabNoteHead.font-size = #-1.2
    }
  }
}

% --- THEORETICAL ANALYSIS BLOCK: STUDY 3 ---
\markup {
  \column {
    \vspace #0.8
    \fill-line { \fontsize #1.5 \bold "Theoretical Analysis: 32-Bar AABA Form & Dominant Cycles" }
    \vspace #0.3
    \fill-line {
      \override #'(line-width . 90)
      \fontsize #-0.5
      \wordwrap-string "1. The 'A' Section (I - VI - ii - V): The primary progression establishes tonic stability in Bb using the standard turnaround (Bbmaj7 - G7 - Cm7 - F7). The chromatic passing chord Bdim in measure 3 acts as an ascending root substitution connecting Bbmaj7 to Cm7. In measure 6, the motion targets Eb7 (IV7), borrowing the blues subdominant inflection before chromatically passing through Edim back to the turnaround."
    }
    \vspace #0.2
    \fill-line {
      \override #'(line-width . 90)
      \fontsize #-0.5
      \wordwrap-string "2. The 'B' Section (The Ragtime / Dominant Cycle): The bridge abandons the tonic key and executes an 8-measure cycle of fifths/fourths: D7 (III7) -> G7 (VI7) -> C7 (II7) -> F7 (V7). Each dominant chord lasts two measures, building forward harmonic motion that resolves naturally back to the tonic Bb on the final 'A' section recap."
    }
    \vspace #0.2
    \fill-line {
      \override #'(line-width . 90)
      \fontsize #-0.5
      \wordwrap-string "3. Guitar Voice Leading: In the 5th-to-8th fret box, keep voice-leading minimal. Notice how the 3rd of each secondary dominant steps down a half step to become the 7th of the next chord across the bridge cycle (e.g., F# in D7 steps down to F natural in G7)."
    }
  }
}
