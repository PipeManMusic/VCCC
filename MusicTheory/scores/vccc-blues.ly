\version "2.24.4"

#(set-global-staff-size 17.2)

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

\header {
  title = "VCCC Blues"
  composer = "Daniel Worth"
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
      \new Staff { \clef "treble_8" \omit Staff.ClefModifier \omit Staff.StringNumber \bluesMelody }
      \new TabStaff \with { stringTunings = #guitar-tuning } { \bluesMelody }
    >>
  >>
}