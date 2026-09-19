\version "2.24.1"

\header {
  title = "Interval Reference Chart"
  subtitle = "Harmonic Intervals from Middle C"
  tagline = ##f
}

\paper {
  #(set-paper-size "letter")
  indent = 0\mm
  markup-system-spacing.basic-distance = #15
  system-system-spacing.basic-distance = #20
}

\score {
  \new Staff \with {
    \remove "Time_signature_engraver"
    \remove "Bar_engraver"
  } {
    \clef treble
    
    % Unison and Seconds
    <c' c'>1^\markup \bold "Perfect Unison (P1)"
    <c' des'>1^\markup \bold "Minor 2nd (m2)"
    <c' d'>1^\markup \bold "Major 2nd (M2)"
    \break

    % Thirds and Fourth
    <c' ees'>1^\markup \bold "Minor 3rd (m3)"
    <c' e'>1^\markup \bold "Major 3rd (M3)"
    <c' f'>1^\markup \bold "Perfect 4th (P4)"
    \break

    % Tritone, Fifth, and Minor Sixth
    <c' fis'>1^\markup \bold "Tritone (d5/A4)"
    <c' g'>1^\markup \bold "Perfect 5th (P5)"
    <c' aes'>1^\markup \bold "Minor 6th (m6)"
    \break

    % Major Sixth and Sevenths
    <c' a'>1^\markup \bold "Major 6th (M6)"
    <c' bes'>1^\markup \bold "Minor 7th (m7)"
    <c' b'>1^\markup \bold "Major 7th (M7)"
    \break

    % Octave
    <c' c''>1^\markup \bold "Perfect Octave (P8)"
  }
  
  \layout {
    % Setting ragged-right to false stretches the systems to fill the width of the page
    ragged-right = ##f
  }
}
