#=================================================================================================#
# text.r
# Text processing methods
# Adam Erickson, Washington State University
# June 29, 2018
#=================================================================================================#

#' Helper method for retrieving tables and key-value pairs from txt files.
#' @param txt Text file input from readLines().
#' @param pattern Pattern to match with grep().
#' @param col.names Resulting column names for data.frame().
#' @param not Boolean for selecting columns not matching pattern.
#' @return data.frame() containing table or key-value pairs.
read_index = function(txt, pattern, col.names, not=FALSE, ...) {
  idx = grep(pattern, txt)
  if (not == TRUE) { idx = -idx }
  df  = read.table(text=txt[idx], col.names=col.names)
  return(df)
}

#' Helper method to read and clean text files
#' @param path Character path to a text file.
read_clean = function(path, comment_bol=">>", comment_eol="<<", ...) {
  txt = readLines(path)         # read raw lines from text file
  txt = gsub("\t",   " ", txt)  # convert tabs to spaces
  txt = gsub("\\s+", " ", txt)  # convert multi-space to single-space
  txt = gsub("^>>.*$","", txt)  # remove comments at beginning of line
  txt = gsub("<<.*$", "", txt)  # remove comments at end of line
  txt = trimws(txt)             # strip white space
  txt = txt[txt != ""]          # remove blank lines
  return(txt)
}

#' Method to extract tables from readLines() between headers
#' @param txt Character vector output from readLines().
#' @param before Character before the table.
#' @param after Character after the table.
#' @param col.names Character vector of column names.
#' @param sep Character separator to use when parsing strings.
#' @return data.frame() containing table.
extract_between = function(text, before, after, col.names, sep=" ", ...) {
  idx1 = ifelse(before == FALSE, 0, grep(before, text))
  idx2 = ifelse(after  == FALSE, length(text)+1, grep(after, text))
  rows = idx1:idx2
  idx  = rows[rows > idx1 & rows < idx2]
  df   = read.table(text=text[idx], sep=sep, col.names=col.names, ...)
  return(df)
}

