\version "2.24.1"

\header {
  title = ""
}

\paper {
  #(set-paper-size "letter")
  indent = 0\mm
  ragged-bottom = ##t
  
  % Spacing adjustments for a full book layout
  markup-system-spacing.basic-distance = #10
  score-markup-spacing.basic-distance = #12
  system-system-spacing.basic-distance = #16
  score-system-spacing.basic-distance = #16
  
  % Page numbering behavior (Headers)
  print-page-number = ##t
  print-first-page-number = ##f
  first-page-number = 1
  
  % Global Footer (Prints on every page)
  oddFooterMarkup = \markup {
    \fill-line {
      \center-column {
        \line { \fontsize #1 "VCCC Music Theory Reference Book - Open Source Edition" }
        \vspace #0.5
        % Adjust the #12 up or down to change the size of the badge
        \epsfile #X #12 #"by-sa.eps" 
        \vspace #1
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
  
  % Table of Contents formatting
  tocTitleMarkup = \markup \huge \bold \column {
    \fill-line { "Table of Contents" }
    \vspace #2
  }
  tocItemMarkup = \markup \large \fill-line {
    \fromproperty #'toc:text
    \fromproperty #'toc:page
  }
}

% Global layout rules
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
  }
}

% ===================================================================
% FRONT MATTER
% ===================================================================

% --- PAGE 1: TITLE PAGE ---
\markup {
  \column {
    \vspace #10
    \fill-line { \fontsize #10 \bold "VCCC Music Theory" }
    \vspace #1
    \fill-line { \fontsize #10 \bold "Reference Book" }
    \vspace #4
    \fill-line { \fontsize #4 "Intervals, Scales, Clefs, and Signatures" }
    \vspace #1
    \fill-line { \fontsize #3 "(Guitar Tablature Edition)" }
    \vspace #14
    \fill-line { \fontsize #6 "By Daniel Worth" }
    \vspace #6
    \fill-line { \fontsize #2 \italic "An Open Source Music Theory Project" }
  }
}
\pageBreak

% --- PAGE 2: COPYRIGHT & LICENSE ---
\markup {
  \column {
    \vspace #10
    \fill-line { \fontsize #6 \bold "VCCC Music Theory Reference Book" }
    \vspace #2
    \fill-line { \fontsize #3 "Author: Daniel Worth" }
    \vspace #1
    \fill-line { \fontsize #3 "Edition: September 2026" }
    \vspace #6
    
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
      \wordwrap-string "This book is generated dynamically using LilyPond, an automated music engraving system. The source files are maintained as an open-source project. You are encouraged to fork, modify, and contribute improvements to the codebase."
    }
  }
}
\pageBreak

% --- PAGE 3: TABLE OF CONTENTS ---
\markuplist \table-of-contents
\pageBreak


% ===================================================================
% BOOK CONTENT
% ===================================================================

% --- PART 1: INTERVAL CHART ---
\tocItem \markup "1. Harmonic Intervals from C"

intervalsMusic = {
  <c c>1^\markup \bold "Perfect Unison"
  <c des>1^\markup \bold "Minor 2nd"
  <c d>1^\markup \bold "Major 2nd"
  <c ees>1^\markup \bold "Minor 3rd"
  <c e>1^\markup \bold "Major 3rd"
  \break

  <c f>1^\markup \bold "Perfect 4th"
  <c fis>1^\markup \bold "Tritone"
  <c g>1^\markup \bold "Perfect 5th"
  <c aes>1^\markup \bold "Minor 6th"
  <c a>1^\markup \bold "Major 6th"
  \break

  <c bes>1^\markup \bold "Minor 7th"
  <c b>1^\markup \bold "Major 7th"
  <c c'>1^\markup \bold "Perfect Octave"
}

\markup { \vspace #0.5 \large \bold "1. Harmonic Intervals from C" }
\score {
  \new StaffGroup <<
    \new Staff \with {
      \remove "Time_signature_engraver"
      \remove "Bar_engraver"
    } { 
      \clef "treble_8" \omit Staff.ClefModifier 
      \intervalsMusic 
    }
    
    \new TabStaff \with {
      \remove "Time_signature_engraver"
      \remove "Bar_engraver"
    } { \intervalsMusic }
  >>
  \layout { ragged-right = ##f }
}

% --- PART 2: MAJOR SCALE ---
\tocItem \markup "2. The C Major Scale (Whole and Half Steps)"

scaleNotes = {
  c1\5^\markup \circle "1" d1\5^\markup \circle "2"
  e1\4^\markup \circle "3" f1\4^\markup \circle "4"
  g1\4^\markup \circle "5" a1\3^\markup \circle "6"
  b1\3^\markup \circle "7" c'1\3^\markup \circle "8"
}
scaleText = {
  s2 s2_\markup \bold \large "W" s2 s2_\markup \bold \large "W"
  s2 s2_\markup \bold \large "H" s2 s2_\markup \bold \large "W"
  s2 s2_\markup \bold \large "W" s2 s2_\markup \bold \large "W"
  s2 s2_\markup \bold \large "H" s1
}

\markup { \vspace #1 \large \bold "2. The C Major Scale (Whole and Half Steps)" }
\score {
  \new StaffGroup <<
    \new Staff \with { \remove "Time_signature_engraver" } {
      \clef "treble_8" \omit Staff.ClefModifier 
      \cadenzaOn
      << \scaleNotes \scaleText >>
      \cadenzaOff \bar "|."
    }
    \new TabStaff \with { \remove "Time_signature_engraver" } {
      \cadenzaOn \scaleNotes \cadenzaOff \bar "|."
    }
  >>
  \layout { ragged-right = ##f }
}

% --- PART 3: CLEFS ---
\tocItem \markup "3. Common Clefs (Showing True Middle C - C4)"

clefsStaff = {
  \clef treble c'1^\markup \bold "Treble Clef" \bar "||"
  \clef bass c'1^\markup \bold "Bass Clef" \bar "||"
  \clef alto c'1^\markup \bold "Alto Clef" \bar "||"
  \clef tenor c'1^\markup \bold "Tenor Clef" \bar "|."
}
clefsTab = {
  c'1 \bar "||" c'1 \bar "||" c'1 \bar "||" c'1 \bar "|."
}

\markup { \vspace #1 \large \bold "3. Common Clefs (Showing True Middle C - C4)" }
\score {
  \new StaffGroup <<
    \new Staff \with { \remove "Time_signature_engraver" } { \clefsStaff }
    \new TabStaff \with { \remove "Time_signature_engraver" } { \clefsTab }
  >>
  \layout { ragged-right = ##f }
}

% --- PART 4: CIRCLE OF FIFTHS NATIVE VECTOR DIAGRAM ---
\tocItem \markup "4. The Circle of Fifths"

\markup { \vspace #1 \large \bold "4. The Circle of Fifths" }
\markup {
  \vspace #2
  \fill-line {
    \center-column {
      % Native LilyPond drawing commands to build the circle
      \combine \with-dimensions #'(-15 . 15) #'(-15 . 15) \draw-circle #14 #0.4 ##f
      \combine \translate #'(0 . 18) \halign #CENTER \center-column { \bold "C" "(0)" }
      \combine \translate #'(9 . 15.6) \halign #CENTER \center-column { \bold "G" "(1#)" }
      \combine \translate #'(15.6 . 9) \halign #CENTER \center-column { \bold "D" "(2#)" }
      \combine \translate #'(18 . 0) \halign #CENTER \center-column { \bold "A" "(3#)" }
      \combine \translate #'(15.6 . -9) \halign #CENTER \center-column { \bold "E" "(4#)" }
      \combine \translate #'(9 . -15.6) \halign #CENTER \center-column { \bold "B" "(5#)" }
      \combine \translate #'(0 . -19) \halign #CENTER \center-column { \bold "F# / Gb" "(6)" }
      \combine \translate #'(-9 . -15.6) \halign #CENTER \center-column { \bold "Db" "(5b)" }
      \combine \translate #'(-15.6 . -9) \halign #CENTER \center-column { \bold "Ab" "(4b)" }
      \combine \translate #'(-18 . 0) \halign #CENTER \center-column { \bold "Eb" "(3b)" }
      \combine \translate #'(-15.6 . 9) \halign #CENTER \center-column { \bold "Bb" "(2b)" }
               \translate #'(-9 . 15.6) \halign #CENTER \center-column { \bold "F" "(1b)" }
    }
  }
  \vspace #3
}

% --- PART 5: KEY SIGNATURES (WITH MAJOR SCALES) ---
\tocItem \markup "5. Key Signatures and Major Scales"

\markup { \vspace #1 \large \bold "5. Key Signatures and Major Scales" }

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key c \major \cadenzaOn c1\5^\markup \bold "C Major (0)" d\5 e\4 f\4 g\4 a\3 b\3 c'\3 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn c1\5 d\5 e\4 f\4 g\4 a\3 b\3 c'\3 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key g \major \cadenzaOn g,1\6^\markup \bold "G Major (1#)" a,\6 b,\5 c\5 d\5 e\4 fis\4 g\4 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn g,1\6 a,\6 b,\5 c\5 d\5 e\4 fis\4 g\4 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key d \major \cadenzaOn d1\5^\markup \bold "D Major (2#)" e\5 fis\4 g\4 a\4 b\3 cis'\3 d'\3 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn d1\5 e\5 fis\4 g\4 a\4 b\3 cis'\3 d'\3 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key a \major \cadenzaOn a,1\6^\markup \bold "A Major (3#)" b,\6 cis\5 d\5 e\5 fis\4 gis\4 a\4 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn a,1\6 b,\6 cis\5 d\5 e\5 fis\4 gis\4 a\4 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key e \major \cadenzaOn e1\5^\markup \bold "E Major (4#)" fis\5 gis\4 a\4 b\4 cis'\3 dis'\3 e'\3 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn e1\5 fis\5 gis\4 a\4 b\4 cis'\3 dis'\3 e'\3 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key b \major \cadenzaOn b,1\5^\markup \bold "B Major (5#)" cis\5 dis\4 e\4 fis\4 gis\3 ais\3 b\3 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn b,1\5 cis\5 dis\4 e\4 fis\4 gis\3 ais\3 b\3 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key fis \major \cadenzaOn fis,1\6^\markup \bold "F# Major (6#)" gis,\6 ais,\5 b,\5 cis\5 dis\4 eis\4 fis\4 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn fis,1\6 gis,\6 ais,\5 b,\5 cis\5 dis\4 eis\4 fis\4 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key cis \major \cadenzaOn cis1\5^\markup \bold "C# Major (7#)" dis\5 eis\4 fis\4 gis\4 ais\3 bis\3 cis'\3 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn cis1\5 dis\5 eis\4 fis\4 gis\4 ais\3 bis\3 cis'\3 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key f \major \cadenzaOn f1\5^\markup \bold "F Major (1b)" g\5 a\4 bes\4 c'\4 d'\3 e'\3 f'\3 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn f1\5 g\5 a\4 bes\4 c'\4 d'\3 e'\3 f'\3 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key bes \major \cadenzaOn bes,1\6^\markup \bold "Bb Major (2b)" c\6 d\5 ees\5 f\5 g\4 a\4 bes\4 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn bes,1\6 c\6 d\5 ees\5 f\5 g\4 a\4 bes\4 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key ees \major \cadenzaOn ees1\5^\markup \bold "Eb Major (3b)" f\5 g\4 aes\4 bes\4 c'\3 d'\3 ees'\3 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn ees1\5 f\5 g\4 aes\4 bes\4 c'\3 d'\3 ees'\3 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key aes \major \cadenzaOn aes,1\6^\markup \bold "Ab Major (4b)" bes,\6 c\5 des\5 ees\5 f\4 g\4 aes\4 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn aes,1\6 bes,\6 c\5 des\5 ees\5 f\4 g\4 aes\4 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key des \major \cadenzaOn des1\5^\markup \bold "Db Major (5b)" ees\5 f\4 ges\4 aes\4 bes\3 c'\3 des'\3 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn des1\5 ees\5 f\4 ges\4 aes\4 bes\3 c'\3 des'\3 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key ges \major \cadenzaOn ges,1\6^\markup \bold "Gb Major (6b)" aes,\6 bes,\5 ces\5 des\5 ees\4 f\4 ges\4 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn ges,1\6 aes,\6 bes,\5 ces\5 des\5 ees\4 f\4 ges\4 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \key ces \major \cadenzaOn ces1\5^\markup \bold "Cb Major (7b)" des\5 ees\4 fes\4 ges\4 aes\3 bes\3 ces'\3 \cadenzaOff \bar "|." }
    \new TabStaff { \cadenzaOn ces1\5 des\5 ees\4 fes\4 ges\4 aes\3 bes\3 ces'\3 \cadenzaOff \bar "|." }
  >>
  \layout { ragged-right = ##f }
}

% --- PART 6: TIME SIGNATURES ---
\tocItem \markup "6. Time Signatures"

timeSigs = {
  \time 4/4 s1^\markup \bold "4/4 (Common Time)" \bar "||"
  \time 3/4 s2.^\markup \bold "3/4 (Waltz Time)" \bar "||"
  \time 6/8 s2.^\markup \bold "6/8 (Compound)" \bar "||"
  \numericTimeSignature \time 2/2 s1^\markup \bold "2/2 (Cut Time)" \bar "|."
}

\markup { \vspace #1 \large \bold "6. Time Signatures" }
\score {
  \new StaffGroup <<
    \new Staff { \clef "treble_8" \omit Staff.ClefModifier \timeSigs }
    \new TabStaff { \timeSigs }
  >>
  \layout { ragged-right = ##f }
}
