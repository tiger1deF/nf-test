#!/usr/bin/env nextflow

process extractProteins {
    label "docker_core"
    
    input:
    path input_dir
    path outdir
    
    output:
    path outdir
    path "${outdir}/lengths.txt"

    script:
    """
    #!/usr/bin python3

    import polars as pl
    import os
    from proteinTools import PT as p

    files = os.listdir(${input_dir})
    protein_data = []
    for file in files:
        data = pl.read_csv(file)
        proteins = data['Proteins'].to_list()
        protein_data += proteins

    lengths = []
    for protein in protein_data:
        prot = p.Protein(protein)
        prot.download(${outdir})
        lengths.append(len(prot))

    with open('${outdir}/lengths.txt', 'r') as f:
        for length in lengths:
            f.write(length + '\n')
    """
}
