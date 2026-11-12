\version "2.24.4"

#(set-global-staff-size 17.2)

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

\header {
  title = "I Got Rhythm"
  composer = "George Gershwin (1930)"
  arranger = "Arr. Daniel Worth"
  tagline = ##f
}

\paper {
  indent = 0\mm
  ragged-right = ##f
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
    \override TabNoteHead.font-size = #-1.2
  }
  \context {
    \FretBoards
    \override FretBoard.size = #0.52
  }
  \context {
    \ChordNames
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #0.5
  }
}

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

  fis'4\2 a'4\1 c''4\1 fis'4\2~ | fis'1\2 |
  f'4\2 b'4\1 d''4\1 f'4\2~ | f'1\2 |
  \break

  e'4\2 g'4\2 bes'4\1 e'4\2~ | e'1\2 |
  ees'4\3 a'4\1 c''4\1 ees'4\3~ | ees'1\3 |
  \break

  d'4\3 f'4\2 g'4\2 bes'4\1~ | bes'2\1 g'2\2 |
  d'4\3 f'4\2 g'4\2 bes'4\1~ | bes'1\1 |
  \break

  d'4\3 f'4\2 g'4\2 bes'4\1~ | bes'4\1 c''8\1 bes'8\1~ bes'4\1 g'4\2 |
  bes'1\1~ | bes'2.\1 r4 \bar "|."
}

\score {
  <<
    \new FretBoards { \rhythmHarmony }
    \new ChordNames { \set chordChanges = ##t \rhythmHarmony }
    \new StaffGroup <<
      \new Staff { \clef "treble_8" \omit Staff.ClefModifier \omit Staff.StringNumber \rhythmMelody }
      \new TabStaff \with { stringTunings = #guitar-tuning } { \rhythmMelody }
    >>
  >>
}