// PROCESS IMPORTS

include {extractProteins} from "./processes/downloadProtein.nf" 
include {processProtein} from "./processes/processProtein.nf"

workflow {
    processProtein(params.input)
}