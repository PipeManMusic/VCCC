\version "2.24.4"

#(set-global-staff-size 17.2)

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

\header {
  title = "After You've Gone"
  composer = "Turner Layton (1918)"
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
      \new Staff { \clef "treble_8" \omit Staff.ClefModifier \omit Staff.StringNumber \melodyStudyOne }
      \new TabStaff \with { stringTunings = #guitar-tuning } { \melodyStudyOne }
    >>
  >>
}