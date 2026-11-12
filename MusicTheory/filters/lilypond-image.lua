-- filters/lilypond-image.lua
--
-- A Pandoc Lua filter to convert image links to LilyPond (.ly) files
-- into the correct format for the target output (PDF or SVG).
--
-- It expects images in the format: ![Caption](path/to/file.ly)
--
-- For PDF/LaTeX output, it changes the path to `build/scores/file.cropped.pdf`.
-- For EPUB/HTML output, it changes the path to `build/scores/file.cropped.svg`.

function Image(elem)
  local fmt = FORMAT or (pandoc and pandoc.FORMAT) or ""

  -- Check if the image URL ends with .ly
  if string.sub(elem.src, -3) == ".ly" then
    -- Extract the filename without the extension
    local basename = elem.src:match("([^/]+)$"):match("(.+)%..+")

    -- Determine the new extension based on the output format
    local new_ext
    if fmt:match 'latex' or fmt:match 'pdf' then
      new_ext = ".cropped.pdf"
    elseif fmt:match 'html' or fmt:match 'epub' then
      new_ext = ".cropped.svg"
    else
      -- For other formats, do nothing
      return elem
    end

    -- Construct the new path
    elem.src = "build/scores/" .. basename .. new_ext

    return elem
  end

  -- Route dual-format vector badges (.eps for LaTeX, .svg for EPUB/HTML)
  local base, ext = elem.src:match("^(.-)%.([%a%d]+)$")
  if base and (ext == "eps" or ext == "svg") then
    if fmt:match 'latex' or fmt:match 'pdf' then
      elem.src = base .. ".eps"
    elseif fmt:match 'html' or fmt:match 'epub' then
      elem.src = base .. ".svg"
    end
    return elem
  end

  -- If it's not a .ly file, return it unchanged
  return elem
end
