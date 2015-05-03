# Set Java home
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre7') # for 32-bit version

# Load libraries
library(rJava)
library("openNLP")
library("NLP")

s <- paste("Complimentary gym access for two for the length of stay $12 value per person per day")

tagPOS <-  function(x, ...) {
  s <- as.String(x)
    word_token_annotator <- Maxent_Word_Token_Annotator()
    a2 <- Annotation(1L, "sentence", 1L, nchar(s))
    a2 <- annotate(s, word_token_annotator, a2)
    a3 <- annotate(s, Maxent_POS_Tag_Annotator(), a2)
    a3w <- a3[a3$type == "word"]
        POStags <- unlist(lapply(a3w$features, `[[`, "POS"))
    POStagged <- paste(sprintf("%s/%s", s[a3w], POStags), collapse = " ")
    list(POStagged = POStagged, POStags = POStags)
  }

  tagged_str <-  tagPOS(s)
  tagged_str

#$POStagged
    #[1] "Complimentary/NNP gym/NN access/NN for/IN two/CD for/IN the/DT length/NN of/IN stay/NN $/$ 12/CD value/NN per/IN     person/NN per/IN day/NN"
    #
    #$POStags
#[1] "NNP" "NN"  "NN"  "IN"  "CD"  "IN"  "DT"  "NN"  "IN"  "NN"  "$"   "CD" 
#[13] "NN"  "IN"  "NN"  "IN"  "NN" 