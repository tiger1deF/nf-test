#!/usr/bin/env python
    
    import polars as pl
    import os
    from proteinTools import PT as p

    files = os.listdir(data)
    protein_data = []
    for file in files:
        data = pl.read_csv(file)
        proteins = data['Proteins'].to_list()
        protein_data += proteins

    lengths = []
    for protein in protein_data:
        prot = p.Protein(protein)
        prot.download(output)
        lengths.append(len(prot))

    with open('output/lengths.txt', 'r') as f:
        for length in lengths:
            f.write(length + '
')
