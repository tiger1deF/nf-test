#!/usr/bin/env nextflow

process processProtein {
    publishDir "${params.outdir}"
    label "docker_core"

    input:
    path input_dir


    shell:
    """
    cat ${input_dir}/*.csv > proteins.txt
    """
}